<%@page import="java.awt.Label"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.*"
    import="javax.servlet.*"
     %>
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
     <h1>Update Employee </h1>
    </div>
    <div class="form-content">
<form  method="post">


    <div class="form-group">
<label> Employee Name</label> <br>
<select name="empName" id="empName" required="required">
<option value=""> </option>
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
<label>Employee Code</label> 
<input type="text" name="ecode" required="required"> <br>
</div>
        <div class="form-group">
<label>  Designation</label> 
<input type="text" name="edesignation" required="required"> <br>
</div>
        <div class="form-group">

<label>   Basic Salary</label> 
<input type="number" name="ebsalary" required="required"> <br>
</div>
        <div class="form-group">

<label>   HRA</label> 
<input type="number" name="ehra" required="required"> <br>
</div>
        <div class="form-group">

<label>   CCA</label> 
<input type="number" name="ecca" required="required"> <br>
</div>
        <div class="form-group">

<label>   Bank Account Number</label> 
<input type="number" name="eaccNumber" required="required"> <br>
</div>
        <div class="form-group">

<button type="submit">Update Details</button>
 </div>
      </form>
    </div>
  </div>
</div>


<%
String ecode=request.getParameter("ecode");
String ename= request.getParameter("empName");
String edesignation= request.getParameter("edesignation");
String ebasicSalary= request.getParameter("ebsalary");
String ehra= request.getParameter("ehra");
String ecca= request.getParameter("ecca");
String eAcountNumber= request.getParameter("eaccNumber");
if (ecode != null && ename != null && edesignation != null && ebasicSalary != null && ehra != null && ecca !=
null && eAcountNumber != null) {
int code=Integer.parseInt(ecode);
double basicSalary=Double.parseDouble(ebasicSalary);
double hra=Double.parseDouble(ehra);
double cca=Double.parseDouble(ecca);
long accountNumber=Long.parseLong(eAcountNumber);
    
    pstmt = null;
    String query = "update employeedata set emp_code=?, emp_name=?, emp_designation=?, emp_basicSalary=?, emp_hra=?, emp_cca=?, emp_bankaccno=? where  emp_name=?";
    
    
    try {
        pstmt = con.prepareStatement(query);
        pstmt.setInt(1, code);
        pstmt.setString(2, ename);
        pstmt.setString(3, edesignation);
        pstmt.setDouble(4, basicSalary);
        pstmt.setDouble(5, hra);
        pstmt.setDouble(6, cca);
        pstmt.setLong(7, accountNumber);
      
        pstmt.setString(8, ename);
        int count = pstmt.executeUpdate();
       
        if (count > 0) {
            out.println("<script type='text/javascript'>");
            out.println("alert('EMPLOYEE UPDATED');");
            out.println("</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}    
%>
</body>
<script type="js/formDesign.js"></script>
</html>