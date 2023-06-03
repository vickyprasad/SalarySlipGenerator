<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.*" import="java.math.*" 
    import="java.time.format.DateTimeFormatter" import="java.time.*"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
div.table-title {
  display: block;
  margin: auto;
  max-width: 600px;
  padding: 5px;
  width: 100%;
}
.table-fill {
  background: #e0e8ff; /* Light blue shade */
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

.sonFormat {
  background: #c3d8ff; /* Medium blue shade */
  border-radius: 3px;
  border-collapse: collapse;
  height: 5px;
  margin: auto;
  max-width: 1000px;
  padding: 5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
  font: bold;
}
.son {
  background: #a6c4ff; /* Dark blue shade */
  border-radius: 3px;
  border-collapse: collapse;
  height: 5px;
  margin: auto;
  max-width: 1000px;
  padding: 5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
  font-size: 17px;
}
.sonTechno {
  background: #a6c4ff; /* Dark blue shade */
  height: 50px;
  font-size: 29px;
}
.downloadpdf button {
  outline: none;
  background: #4285F4;
  width: 20%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 100;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}

.two .downloadpdf button {
  background: #FFFFFF;
  color: #4285F4;
}
</style>
<!-- html2canvas library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- jsPDF library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.js" integrity="sha512-Bw9Zj8x4giJb3OmlMiMaGbNrFr0ERD2f9jL3en5FmcTXLhkI+fKyXVeyGyxKMIl1RfgcCBDprJJt4JvlglEb3A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>
<body>

<% 
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
LocalDateTime now = LocalDateTime.now();  
DecimalFormat df = new DecimalFormat("0.00");
df.setRoundingMode(RoundingMode.UP);
String name=(String)request.getAttribute("empName");
String month=(String)request.getAttribute("month");
int monthDays=(Integer)request.getAttribute("monthDays"); 
int workingDays=(Integer)request.getAttribute("workingDays");
int sundays=(Integer)request.getAttribute("sundays");
int holidays=(Integer)request.getAttribute("holidays");
int absent=(Integer)request.getAttribute("absent");
int overtime=(Integer)request.getAttribute("overtime");
double tax=(double)request.getAttribute("tax");
double esic=(double)request.getAttribute("esic");
double epf=(double)request.getAttribute("epf");
double tiffin=(double)request.getAttribute("tiffin");
int late=(Integer)request.getAttribute("late");
double fine=(double)request.getAttribute("fine");
double loan=(double)request.getAttribute("loan");
double bouns=(double)request.getAttribute("bouns");
double award=(double)request.getAttribute("award");
double medical=(double)request.getAttribute("medical");
double perDaySal=(double)request.getAttribute("perDaySal");
double perHourSal=(double)request.getAttribute("perHourSal");
double incentive=(double)request.getAttribute("incentive");
double leaveDeduction=(double)request.getAttribute("leaveDeduction");
double lateDeduction=(double)request.getAttribute("lateDeduction");
double grossSalary=(double)request.getAttribute("grossSalary");
double grossDeduction=(double)request.getAttribute("grossDeduction");
double netSalary=(double)request.getAttribute("netSalary");
int empCode=(Integer)request.getAttribute("empCode");
String designation=(String)request.getAttribute("designation");
double basicSalary=(Double)request.getAttribute("basicSalary");
double cca=(Double)request.getAttribute("cca");
Double hra=(Double)request.getAttribute("hra");
long accountNumber=(Long)request.getAttribute("accountNo");
%>
<!-- Trigger button -->

<!-- HTML content for PDF creation -->
<div id="contentToPrint" class="table-fill">
<table border="3" cellpadding="6px" cellspacing="5px" width="100%" height="300px"  rules="all" >
      
        <tr class="sonTechno">
        <th colspan="5">SON TECHNO</th>
        
        </tr>
        
        
        <tr class="sonFormat">
            
        <td colspan="2" align="center">Salary Slip</td>
        <!-- <th></th> -->
        <td align="right"><%=dtf.format(now) %></td>
        <td>Month</td>
        <td><%=month %></td>
        </tr>

        <tr>
        <td>Employee Name</td>
        <td ><%=name.toUpperCase() %></td>
        <td>Month Days</td>
        <td align="center" colspan="2"><%=monthDays %></td>
        <!-- <td></td> -->

        <tr>
            <td>Employee Code</td>
            <td><%=empCode %></td>
            <td>Total Working Days</td>
            <td align="center" colspan="2"><%=workingDays %></td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td>Designation</td>
            <td><%=designation.toUpperCase() %></td>
            <td>Number of working days Attended</td>
            <td align="center"colspan="2"><%=workingDays%></td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td>Bank Account Number</td>
            <td><%=accountNumber %> </td>
            <td>Sundays/Holidays</td>
            <td align="center"><%=sundays %></td>
            <td align="center"><%=holidays %></td>
        </tr>
        <tr>
        <td>Mode of Transfer Salary</td>
            <td>NEFT</td>
            
            <td>Leaves in Days/Late in Hours</td>
            <td align="center"><%=absent %></td>
            <td align="center"><%=late %></td>
        </tr>
        <tr>
            <td colspan="2"></td>
           <!--  <td></td> -->
            <td>Overtime in Hours</td>
            <td align="center" colspan="2"><%=overtime %></td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td colspan="5"></td>
            <!-- <td></td>
            <td></td>
            <td></td>
            <td></td> -->
        </tr>
        <tr class="son">
            <td colspan="2"align="center">Income</td>
            <!-- <td></td> -->
            <td colspan="3"align="center">Deductions</td>
            <!-- <td></td>
            <td></td> -->
        </tr>
        <tr  class="sonFormat">
            <td>Particulars</td>
            <td>Amount</td>
            <td>Particulars</td>
            <td align="right" colspan="2">Amount</td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td>Basic Salary</td>
            <td align="right"><%=df.format(basicSalary) %></td>
            <td>PF</td>
            <td align="right" colspan="2"><%=df.format(epf) %></td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td>Attendance Award</td>
            <td align="right"><%=df.format(award) %></td>
            <td>Professional Tax</td>
            <td align="right" colspan="2"><%=tax %> </td>
             <!-- <td></td> -->
        </tr>
        <tr>
            <td>HRA</td>
            <td align="right"><%=df.format(hra) %></td>
            <td>ESIC</td>
            <td align="right" colspan="2"><%=df.format(esic) %> </td>
             <!-- <td></td> -->
        </tr>
        <tr>
            <td>Tiffin Allowance</td>
            <td align="right"><%=df.format(tiffin) %></td>
            <td>Leave Deduction</td>
            <td align="right" colspan="2"><%=df.format(leaveDeduction) %></td>
             <!-- <td></td> -->
        </tr>
        <tr>
            <td>City Compensatory Allowance</td>
            <td align="right"><%=df.format(cca) %></td>
            <td>Late Deducion</td>
            
            <td align="right" colspan="2"><%=df.format(lateDeduction) %></td>
             <!-- <td></td> -->
        </tr>
        <tr>
            <td>Incentive</td>
            <td align="right"><%=df.format(incentive) %></td>
            <td>Advance/Loan</td>
            
            <td align="right" colspan="2"><%=df.format(loan) %></td>
        </tr>
        <tr>
            <td>Medical Allowance</td>
            <td align="right"><%=df.format(medical) %></td>
            <td>Fine</td>
            
            <td align="right" colspan="2"><%=df.format(fine) %></td>
        </tr>
        <tr>
            <td>Bouns</td>
            <td align="right"><%=df.format(bouns) %></td>
            <td colspan="3"></td>
            
           
        </tr>
        <tr>
            <td>Total</td>
            <td align="right"><%=df.format(grossSalary) %></td>
            <td>Total</td>
           
            <td colspan="2" align="right"><%=df.format(grossDeduction) %></td>
            <!-- <td></td>  -->
        </tr>
        <tr>
            <td colspan="5"></td>
            <!-- <td></td>  -->
        </tr>
        <tr>
            <td colspan="3"align="center" class="son">Net Salary</td>
           
            <td colspan="2" align="right"><%=df.format(netSalary) %></td>
           <!-- <td></td>  -->
        </tr>
    
        
        <tr height="50px">
           <td colspan="2" ></td>
           <td colspan="3" ></td>
                  
        </tr>
        
        

        <tr rowspan="2">
        <td colspan="2"align="center" >Employee Signature</td>
        <!-- <td></td> -->
        <td colspan="3"align="center"> Employer Signature</td>
        <!-- <td></td>
        <td></td> -->

        </tr>
        
       
     
        </table>
        </div>
        <br>
        <br>
       <div align="center"  class="downloadpdf">
       <button  onclick="Convert_HTML_To_PDF();">DOWNLOAD PDF</button>
       </div>
       
        
		
</body>
<script>
window.jsPDF = window.jspdf.jsPDF;

//Convert HTML content to PDF
function Convert_HTML_To_PDF() {
 var doc = new jsPDF();
	
 // Source HTMLElement or a string containing HTML.
 var elementHTML = document.querySelector("#contentToPrint");

 doc.html(elementHTML, {
     callback: function(doc) {
         // Save the PDF
         doc.save('<%=name%>salarySlip.pdf');
     },
     margin: [10, 10, 10, 10],
     autoPaging: 'text',
     x: 0,
     y: 0,
     width: 190, //target width in the PDF document
     windowWidth: 1000 //window width in CSS pixels
 });
}
</script>
</html>

