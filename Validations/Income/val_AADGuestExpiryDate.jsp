<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
<%!private static Calendar getDateFromString(String value) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm");
		LocalDate localDate = null;
		try {
			localDate = LocalDate.parse(value, formatter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (localDate != null) {
			Calendar input = Calendar.getInstance();
			input.clear();
			input.set(localDate.getYear(), localDate.getMonthValue() - 1, localDate.getDayOfMonth());
			return input;
		}
		return null;
	}

	private static Calendar getDateFromMilliseconds(String value) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.setTimeInMillis(Long.parseLong(value));
		return cal;
	}%>
<%
String name = request.getParameter("name");
String question = request.getParameter("question");
String value = request.getParameter("value");


String regex = "^[0-9]{10,}";
Pattern pattern = Pattern.compile(regex);
Matcher matcher = pattern.matcher(value);
boolean isMatch = matcher.matches();
Calendar input = null;
if (isMatch) {
	input = getDateFromMilliseconds(value);
} else {
	input = getDateFromString(value);
}
if (input == null) {
	out.println("Error: Failed to validate Expiry Date, please contact the administrator.");
	return;
}
Calendar now = Calendar.getInstance();
int difference = input.compareTo(now);
if (difference > 0) {
	int daysdiff = 0;
	long diff = input.getTimeInMillis() - now.getTimeInMillis();
	long diffDays = diff / (24 * 60 * 60 * 1000) + 1;
	daysdiff = (int) diffDays;
	if (daysdiff > 365) {
		out.println("Error: Expiry Date must be within 1 year from Request Date.");
	} 
} else {
	out.println("Error: Expiry Date must be within 1 year from Request Date.");
}
%>