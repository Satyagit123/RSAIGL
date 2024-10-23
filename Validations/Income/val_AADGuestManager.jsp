<%-- 
Notes:	Validate that Azure AD Account exists for Manager User in PV_ACCOUNT Table
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
	String managerID = request.getParameter("value");

//	System.out.println(varname + " value " +  managerID);
	
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pr = null;
	InitialContext ic;
	String stmt = null;
	String azureADDirName = "Income Azure AD";

	stmt="select name from AVUSER.PV_ACCOUNT where Supervisor_ID='"+managerID+"' and application_id=(select ID from AVUSER.PV_DIRECTORY where NAME='"+azureADDirName+"')";

	try {
		ic = new InitialContext();
		ds = (DataSource)ic.lookup( "java:/jdbc/avdb" );
		con = ds.getConnection();
		pr = con.prepareStatement(stmt);
		ResultSet rs = pr.executeQuery();
		System.out.println(stmt);
		boolean gotrecord = false;

		while (rs.next()) {
			System.out.println("Azure AD Account - " + rs.getString(1) + "  Exists for Manager - " + managerID);
			gotrecord=true;
		}

		if (!gotrecord) {
			out.println("Invalid Manager selection - Azure AD Account does not exists for  - " + managerID);
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
	
%>