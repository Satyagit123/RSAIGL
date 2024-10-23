<%-- 
Validation:	
1 - Validate that Azure AD Guest Account exists in PV_ACCOUNT Table using the Email Address field.
2 - Email should only include Characters , numbers and space
Variable - Update the azureADDirName variable as per configuration in RSA IGL
SQL Statement - Verify column names in the SQL Statement are as per PV_ACCOUNT table column names used in Azure AD Account Collection
--%>
<%@page contentType="text/html"
 import="java.util.*,javax.naming.*,javax.sql.DataSource,java.sql.*"
%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
<%

	String varname = request.getParameter("name");
	String mailid = request.getParameter("value");

//	System.out.println(varname + " value " +  mailid);
	
	

if (varname == "GEmail_01" || (varname != "GEmail_01" && !mailid.isEmpty())) {
	

	String regex = "^[A-Za-z0-9+_.-]+@(.+)$";
	Pattern pattern = Pattern.compile(regex);
	Matcher matcher = pattern.matcher(mailid);
	boolean isMatch = matcher.matches();
	if (!isMatch) {
		out.println("Error: You have entered an invalid format for Email Address.");
	}

	DataSource ds = null;
	Connection con = null;
	PreparedStatement pr = null;
	InitialContext ic;
	String stmt = null;
	String actType = "Guest";
	String azureADDirName = "Income Azure AD";

	stmt="select Display_Name from AVUSER.PV_ACCOUNT where Login_Type='"+actType+"' and Email_Address='"+mailid+"' and application_id= (select ID from AVUSER.PV_DIRECTORY where NAME='"+azureADDirName+"')";	

	try {
		ic = new InitialContext();
		ds = (DataSource)ic.lookup( "java:/jdbc/avdb" );
		con = ds.getConnection();
		pr = con.prepareStatement(stmt);
		ResultSet rs = pr.executeQuery();
		System.out.println(stmt);
		boolean gotrecord = false;

		while (rs.next()) {
			out.println("Error: Indicated Email Address (" + rs.getString(1) + ") already has an guest account registered.");
			gotrecord=true;
		}

		rs.close();
		pr.close();
	
	}catch(Exception e){
		out.println("Exception thrown " +e);
	}finally{
		if(con != null){	
			con.close();
		}
	}
}	
%>