<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.servlet.*" import="java.sql.*"%>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Statement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata", "root", "sql123");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Data</title>
<style>
body {
  background-color: #3e94ec;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
  display: block;
  margin: auto;
  max-width: 600px;
  padding: 5px;
  width: 100%;
}

.table-title h3 {
  color: #fafafa;
  font-size: 30px;
  font-weight: 400;
  font-style: normal;
  font-family: "Roboto", helvetica, arial, sans-serif;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  text-transform: uppercase;
}

/*** Table Styles **/

.table-fill {
  background: white;
  border-radius: 3px;
  border-collapse: collapse;
  height: auto;
  margin: auto;
  max-width: 1000px;
  padding: 5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}

th {
  color: #D5DDE5;
  background: #1b1e24;
  border-bottom: 4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size: 23px;
  font-weight: 100;
  padding: 24px;
  text-align: left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align: middle;
}

th:first-child {
  border-top-left-radius: 3px;
}

th:last-child {
  border-top-right-radius: 3px;
  border-right: none;
}

tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color: #666B85;
  font-size: 16px;
  font-weight: normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:hover td {
  background: #4E5066;
  color: #FFFFFF;
  border-top: 1px solid #22262e;
}

tr:first-child {
  border-top: none;
}

tr:last-child {
  border-bottom: none;
}

tr:nth-child(odd) td {
  background: #EBEBEB;
}

tr:nth-child(odd):hover td {
  background: #4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
  border-bottom-right-radius: 3px;
}

td {
  background: #FFFFFF;
  padding: 10px;
  text-align: left;
  vertical-align: middle;
  font-weight: 300;
  font-size: 20px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}

@keyframes float {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
  100% {
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>
</head>
<body>
<%
String query = "select * from employeedata";

try {
    stmt = con.createStatement();
    rs = stmt.executeQuery(query);
%>
<div class="container">
  <div class="table-title">
    <h3>Employee Data</h3>
  </div>
  <table class="table-fill">
    <thead>
      <tr>
        <th class="text-left">EMPLOYEE CODE</th>
        <th class="text-left">NAME</th>
        <th class="text-left">DESIGNATION</th>
        <th class="text-left">BASIC SALARY</th>
        <th class="text-left">HRA</th>
        <th class="text-left">CCA</th>
        <th class="text-left">BANK ACCOUNT NUMBER</th>
      </tr>
    </thead>
    <tbody>
<%
    while (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString(2);
        String designation = rs.getString(3);
        double basicSalary = rs.getDouble(4);
        double hra = rs.getDouble(5);
        double cca = rs.getDouble(6);
        long accountNo = rs.getLong(7);
%>
      <tr>
        <td class="text-left"><%=id%></td>
        <td class="text-left"><%=name%></td>
        <td class="text-left"><%=designation%></td>
        <td class="text-left"><%=basicSalary%></td>
        <td class="text-left"><%=hra%></td>
        <td class="text-left"><%=cca%></td>
        <td class="text-left"><%=accountNo%></td>
      </tr>
<%
    }
%>
    </tbody>
  </table>
</div>
<%
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
