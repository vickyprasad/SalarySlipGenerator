import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.text.DecimalFormat;

@WebServlet("/makesliplink")
public class MakeSlip extends HttpServlet{
Connection con;
Statement stmt=null;
ResultSet rs=null;
	@Override
	public void init() throws ServletException {
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
	}

@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String ename= req.getParameter("empname");
	String month= req.getParameter("month");
	String monthDay= req.getParameter("monthdays");
	String workingDay= req.getParameter("workingdays");
	String sunday= req.getParameter("sundays");
	String holiday= req.getParameter("holidays");
	String epf= req.getParameter("epf");
	String esic=req.getParameter("esic");
	String tax=req.getParameter("tax");
	
	String absent= req.getParameter("absent");
	String overtime= req.getParameter("overtime");
	String tiffin= req.getParameter("tiffin");
	String late= req.getParameter("late");
	String fine= req.getParameter("fine");
	String loan= req.getParameter("loan");
	String bonus= req.getParameter("bonus");
	String award=req.getParameter("award");
	String medical=req.getParameter("medical");
	
	int monthDays=Integer.parseInt(monthDay);
	int workingDays=Integer.parseInt(workingDay);
	int sundays=Integer.parseInt(sunday);
	int holidays=Integer.parseInt(holiday);
	double epf1=Double.parseDouble(epf);
	double professionalTax=Double.parseDouble(tax);
	double esic1=Double.parseDouble(esic);
	
	int absents=Integer.parseInt(absent);
	int overtimeHours=Integer.parseInt(overtime);
	double tiffineAllow=Double.parseDouble(tiffin);
	int late1=Integer.parseInt(late);
	double fine1=Double.parseDouble(fine);
	double loanTaken=Double.parseDouble(loan);
	double bonusGiven=Double.parseDouble(bonus);
	double awardGiven=Double.parseDouble(award);
	double medicalAllow=Double.parseDouble(medical);
	
	PrintWriter pw=resp.getWriter();
	
	
	String query1="select * from employeedata where emp_name=('"+ename+"')";
	int empCode=0;
	String empName=null;
	String designation=null;
	double	basicSalary=0;
	double	hra=0;
	double	cca=0;
	long accountNumber=0;
	
	try {
		stmt=con.createStatement();
		rs=stmt.executeQuery(query1);
		while(rs.next()) {
				empCode=rs.getInt(1);
				empName=rs.getString(2);
				designation=rs.getString(3);
				basicSalary=rs.getDouble(4);
				hra=rs.getDouble(5);
				cca=rs.getDouble(6);
				accountNumber=rs.getLong(7);
			pw.print(empCode+" "+empName+" "+designation+" "+basicSalary+" "+hra+" "+cca+" "+accountNumber );
		}
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	
	
	
	
	double perDaySal=FunctionClass.perDaySalary(basicSalary, hra, cca, monthDays);
	double perHourSal=FunctionClass.perHourSalary(perDaySal, designation);
	double incentive=FunctionClass.incentive(perHourSal, overtimeHours);
	double leaveDeduction=FunctionClass.leaveDeduction(absents, perDaySal);
	double lateDeduction= FunctionClass.lateDeduction(late1, perHourSal);
	double grossSalary=FunctionClass.grossSalary(basicSalary, hra, cca, tiffineAllow, awardGiven, medicalAllow, incentive,bonusGiven);
	double grossDeduction=FunctionClass.grossDeduction(leaveDeduction, lateDeduction, fine1, epf1,loanTaken,professionalTax,esic1);
	double netSalary=FunctionClass.netSalary(grossSalary, grossDeduction, empName);
	req.setAttribute("empName", empName);
	req.setAttribute("month", month);
	req.setAttribute("monthDays", monthDays);
	req.setAttribute("workingDays", workingDays);
	req.setAttribute("sundays", sundays);
	req.setAttribute("holidays", holidays);
	req.setAttribute("epf", epf1);
	req.setAttribute("esic", esic1);
	req.setAttribute("tax", professionalTax);
	req.setAttribute("absent", absents);
	req.setAttribute("overtime", overtimeHours);
	req.setAttribute("tiffin", tiffineAllow);
	req.setAttribute("late", late1);
	req.setAttribute("fine", fine1);
	req.setAttribute("loan", loanTaken);
	req.setAttribute("bouns", bonusGiven);
	req.setAttribute("award", awardGiven);
	req.setAttribute("medical", medicalAllow);
	req.setAttribute("perDaySal", perDaySal);
	req.setAttribute("perHourSal", perHourSal);
	req.setAttribute("incentive", incentive);
	req.setAttribute("leaveDeduction", leaveDeduction);
	req.setAttribute("lateDeduction", lateDeduction);
	req.setAttribute("grossSalary", grossSalary);
	req.setAttribute("grossDeduction", grossDeduction);
	req.setAttribute("netSalary", netSalary);
	req.setAttribute("empCode", empCode);
	req.setAttribute("designation", designation);
	req.setAttribute("basicSalary", basicSalary);
	req.setAttribute("cca", cca);
	req.setAttribute("hra", hra);
	req.setAttribute("accountNo", accountNumber);
	
	RequestDispatcher rd=req.getRequestDispatcher("DisplaySlip.jsp");
	rd.forward(req, resp);
	
	pw.print("\n PER DAY SAL: "+perDaySal+"\n PER HOUR SAL: "+perHourSal+"\n INCENTIVE: "+incentive+"\n LEAVE DEDUCTION: "+leaveDeduction+"\n LATE DEDUCTION: "+lateDeduction+"\n GROSS DEDUCTION: "+grossDeduction+"\n GROSS SALARY: "+grossSalary+"\n NET SAL: "+netSalary);
	
}

	


}