<%-- 
Validatioan: Validate that Full name of Azure AD Guest Account
Condition: Full name should only include Characters and space
--%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
<%!
private static final Pattern regex = Pattern.compile("[0123456789$&+,:;=\\\\?@#|/'<>^*()%!-]");
%>
<%
String varname = request.getParameter("name");
String question = request.getParameter("question");
String guestName = request.getParameter("value");


if (varname == "fullname_01") {
	if (regex.matcher(guestName).find()) {	
		out.println("Error: Display Name cannot contain any Special Characters or Numberic Characters (E.g. [0123456789$&+,:;=\\\\?@#|/'<>^*()%!-]).");
	}
}else {
	if (guestName != null && regex.matcher(guestName).find()) {
		out.println("Error: Display Name cannot contain any Special Characters or Numberic Characters (E.g. [0123456789$&+,:;=\\\\?@#|/'<>^*()%!-]).");
	}
}	
System.out.println(varname + " value " +  guestName);

%>


