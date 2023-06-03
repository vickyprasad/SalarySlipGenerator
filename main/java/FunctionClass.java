
public class FunctionClass {
	public  static double perDaySalary(double basicSalary, double hra, double cca, int monthDays) {
		double perDaySal=(basicSalary+hra+cca)/monthDays;
		return perDaySal;	
	}
	
	public static double perHourSalary(double perDaySal,String empDesignation) {
		double perHourSal=0;
		if(empDesignation.equalsIgnoreCase("operator") ) {
			perHourSal=perDaySal/12;
		}else if (empDesignation.equalsIgnoreCase("helper") || empDesignation.equalsIgnoreCase("maid")) {
			perHourSal=perDaySal/8.5;
		}else {
			perHourSal=perDaySal/8;
		}
		return perHourSal;
	}
	
	public static double incentive(double perHourSalary, double overtime) {
		double incentive=perHourSalary*overtime;
		return incentive;
	}

	public static double leaveDeduction(int absent, double perDaySal) {
		double leaveDeduction=absent*perDaySal;
		return leaveDeduction;
	}
	
	public static double lateDeduction(double latefine,double perHourSal) {
		double lateDeduction=latefine*perHourSal;
		return lateDeduction;
	}
	
	public static double grossSalary(double basicSalary, double hra, double cca, double tiffin,double award, double medical, double incentive,double bonus) {
		double grossSal=basicSalary+hra+cca+tiffin+award+medical+incentive+bonus;
		return grossSal;
	}
	
	public static double grossDeduction(double leaveDeduction, double lateDeduction,double fine, double epf,double loan,double tax,double esic) {
		double grossDeduction=leaveDeduction+lateDeduction+fine+epf+loan+tax+esic;
		return grossDeduction;
	}
	
	public static double netSalary(double grossSalary, double grossDeduction, String empName) {
		double netSal;
		if(empName.equalsIgnoreCase("Chetan") || empName.equalsIgnoreCase("vikram")|| empName.equalsIgnoreCase("rishab")) {
			 netSal=grossSalary;
		}else {
			 netSal=grossSalary-grossDeduction;
		}
		
		return netSal;
	}
	
	
}
