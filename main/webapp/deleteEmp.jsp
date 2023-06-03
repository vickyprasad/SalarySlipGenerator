<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.*" %>
    <%
    Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	Statement stmt=null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata","root","sql123");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/formDesign.css">
</head>
<style>
 .form-group label{
 	font-size: 14px;
 
 }
  /* Style the select element */
   .form-group select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
     background: rgba(0, 0, 0, 0.1);
  }

  /* Style the select options */
  .form-group select option {
    font-size: 14px;
   
  
  }
</style>
<body>
<div class="form">
 <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
     <h1>DELETE EMPLOYEE </h1>
    </div>
    <div class="form-content">
<form  method="post">


    <div class="form-group">
<label> Employee Name</label> <br>
<select name="empName" id="empName" required="required">
<option> </option>
<%
try {
	String query="select emp_name from employeedata";
	stmt=con.createStatement();
	rs=stmt.executeQuery(query);	
	

	while(rs.next()){
		String name=rs.getString(1);
		%>
		 <option value="<%=name%>"><%=name %></option>
		 
		<%
	}
	
}
catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>

</select>
</div>
        <div class="form-group">


<button type="submit">Delete Employee</button>
</div>
      </form>
    </div>
  </div>
</div>

</body>
<%
String ename=request.getParameter("empName");

 pstmt=null;
String query="delete from employeedata where emp_name=?";
try {
	pstmt=con.prepareStatement(query);
		
	pstmt.setString(1,ename);
	int count=pstmt.executeUpdate();
	
	
	if (count > 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('EMPLOYEE DELETED');");
        out.println("</script>");
    }
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
<script src="js/formDesign.js">


</script>
</html>