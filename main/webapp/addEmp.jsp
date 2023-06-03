<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*" %>
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
</style>
<body>
<div class="form">
    <div class="form-toggle"></div>
    <div class="form-panel one">
        <div class="form-header">
            <h1>Add Employee</h1>
        </div>
        <div class="form-content">
            <form method="post">
                <div class="form-group">
                    <label>Enter Code</label> 
                    <input type="number" name="ecode" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter Name</label> 
                    <input type="text" name="ename" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter Designation</label> 
                    <input type="text" name="edesignation" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter Basic Salary</label> 
                    <input type="number" name="ebsalary" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter HRA</label> 
                    <input type="number" name="ehra" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter CCA</label> 
                    <input type="number" name="ecca" required="required"> <br>
                </div>
                <div class="form-group">
                    <label>Enter Bank Account Number</label> 
                    <input type="number" name="eaccNumber" required="required"> <br>
                </div>
                <div class="form-group">
                    <button type="submit" onclick="showAlert()">ADD</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>


<%
    Connection con = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata", "root", "sql123");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%
    String ecode = request.getParameter("ecode");
    String ename = request.getParameter("ename");
    String edesignation = request.getParameter("edesignation");
    String ebasicSalary = request.getParameter("ebsalary");
    String ehra = request.getParameter("ehra");
    String ecca = request.getParameter("ecca");
    String eAcountNumber = request.getParameter("eaccNumber");
    
    if (ecode != null && ename != null && edesignation != null && ebasicSalary != null && ehra != null && ecca !=
        null && eAcountNumber != null) {
        int code = Integer.parseInt(ecode);
        double basicSalary = Double.parseDouble(ebasicSalary);
        double hra = Double.parseDouble(ehra);
        double cca = Double.parseDouble(ecca);
        long accountNumber=Long.parseLong(eAcountNumber);
        
        PreparedStatement pstmt = null;
        String query = "insert into employeedata values(?,?,?,?,?,?,?)";
        
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, code);
            pstmt.setString(2, ename);
            pstmt.setString(3, edesignation);
            pstmt.setDouble(4, basicSalary);
            pstmt.setDouble(5, hra);
            pstmt.setDouble(6, cca);
          	pstmt.setLong(7, accountNumber);
            
            int count = pstmt.executeUpdate();
            if (count > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Employee Added');");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</html>
