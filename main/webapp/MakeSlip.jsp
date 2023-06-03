<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.*" import="java.io.*" %>
 
<% 
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	Statement stmt=null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata","root","sql123");
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
<title>Slip generator</title>
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


<div class="form">
 <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
      <h1>Enter Details</h1>
    </div>
    <div class="form-content">
<form action="makesliplink" method="post">
<div class="form-group">

<label>Employee Name</label> 
<select name="empname" id=empname required="required">
<option value="" ></option>
<%
String query="select emp_name from employeedata";
try {
	
	stmt=con.createStatement();
	rs=stmt.executeQuery(query);	
	

	while(rs.next()){
		String name=rs.getString(1);
		%>
		 <option value="<%=name%>"><%=name.toUpperCase() %></option>
		 
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


<label>Select Month</label>
<select name="month" id=month required="required">
<option value=""></option>
<option value="JAN">JAN</option>
<option value="FEB">FEB</option>
<option value="MAR">MAR</option>
<option value="APR">APR</option>
<option value="MAY">MAY</option>
<option value="JUN">JUN</option>
<option value="JUL">JUL</option>
<option value="AUG">AUG</option>
<option value="SEPT">SEPT</option>
<option value="OCT">OCT</option>
<option value="NOV">NOV</option>
<option value="DEC">DEC</option>
</select>
<br>
</div>
        <div class="form-group">

<label>Days in Month</label>
<input type="number"required="required" name="monthdays" value="monthdays"><br>
</div>
        <div class="form-group">
        
<label>Working Days</label>
<input type="number" required="required"name="workingdays" value="workingdays"><br>
</div>
        <div class="form-group">
        
<label>How many Sundays in Month</label>
<input type="number" required="required"name="sundays" value="sundays"><br>
</div>
        <div class="form-group">
        
<label>Holidays</label>
<input type="number"required="required" name="holidays" value="holidays"><br>
</div>
        <div class="form-group">
        
<label>EPF</label>
<input type="number"required="required" name="epf" value="epf"> <br>
</div>
        <div class="form-group">

<label>Leave Taken in days</label>
<input type="number" required="required"name="absent" value="absent"><br>
</div>
<div class="form-group">
<label>Late in hours</label>
<input type="number"required="required" name="late" value="late"><br>
</div>
        <div class="form-group">
        
<label>Overtime in hours</label>
<input type="number"required="required" name="overtime" value="overtime"><br>
</div>

 
        <div class="form-group">

<label>Tiffin </label>
<input type="number"required="required" name="tiffin" value="tiffin"><br>

</div>
       
        <div class="form-group">
        
<label>Fine</label>
<input type="number" required="required"name="fine" value="fine"><br>
</div>
        <div class="form-group">
        
<label>Advance/ Loan</label>
<input type="number" required="required"name="loan" value="loan"><br>
</div>
        <div class="form-group">
        
<label>Special Bonus</label>
<input type="number"required="required" name="bonus" value="bonus"><br>
</div>
        <div class="form-group">
        
<label>Attendance Award</label>
<input type="number"required="required" name="award" value="award"> <br>
</div>
        <div class="form-group">
        
<label>Medical Allowance</label>
<input type="number"required="required" name="medical" value="medical"> <br>
</div>
        <div class="form-group">
        
<label>Professional Tax </label>
<input type="number"required="required" name="tax" value="tax"> <br>
</div>
        <div class="form-group">
        
<label>ESIC</label>
<input type="number"required="required" name="esic" value="esic"> <br>
</div>
        <div class="form-group">
        
<button type="submit">Get Slip</button>
 </div>
      </form>
    </div>
  </div>
</div>
</body>
<script src="js/formDesign.js">


</script>
</html>