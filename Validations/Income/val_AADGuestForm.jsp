
<%@ page import="java.util.*"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%
HashMap<String, String> values = new HashMap<String, String>();
HashMap<String, String> questions = new HashMap<String, String>();

// Make the parameters and questions easy to access
for (Enumeration e = request.getParameterNames(); e.hasMoreElements();) {
	String name = e.nextElement().toString();
	String value = request.getParameter(name);
	if (name.startsWith("value."))
		values.put(name.substring(6), value);
	if (name.startsWith("question."))
		questions.put(name.substring(9), value);
}
/*	GEmail_01 fullname_01 upn_01
 *	1.	The email address must be differernt for all the guests 
 *	
 *	2.	Display Name must be differernt for all the guests 
 *	3.	For Guest 2 to 5 : If firstname or last name has some value then other fields for that guest should not be empty.
 *
 */
Properties outputProps = new Properties();
Set<String> mapSet = new HashSet<>();
Set<String> fullNameSet = new HashSet<>();
boolean shouldNotEmpty = false;


String guestEmail01 = values.get("GEmail_01");
String guestFullName01 = values.get("fullname_01");
String guestUPN01 = values.get("upn_01");

mapSet.add(guestEmail01);
fullNameSet.add(guestFullName01);


String guestEmail02 = values.get("GEmail_02");
String guestFullName02 = values.get("fullname_02");
String guestUPN02 = values.get("upn_02");

shouldNotEmpty = false;

if (guestFullName02 != null && !guestFullName02.isEmpty()) {
	shouldNotEmpty = true;
}
if (guestEmail02 != null && !guestEmail02.isEmpty()) {
	shouldNotEmpty = true;
}

if (guestEmail02 != null && !guestEmail02.isEmpty()) {
	if (mapSet.contains(guestEmail02)) {
		outputProps.put("error.GEmail_02", "Error: Email address must be unique.");
	} else {
		mapSet.add(guestEmail02);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.GEmail_02", "Error: Email address cannot be empty.");
}
if (guestFullName02 != null && !guestFullName02.isEmpty()) {
	if (fullNameSet.contains(guestFullName02)) {
		outputProps.put("error.fullname_02", "Error: Display Name must be unique.");
	} else {
		fullNameSet.add(guestFullName02);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.fullname_02", "Error: Display Name cannot be empty.");
}
if (guestUPN02 != null && !guestUPN02.isEmpty()) {

} else if (shouldNotEmpty) {
	outputProps.put("error.upn_02", "Error: User principal name cannot be empty.");
}


String guestEmail03 = values.get("GEmail_03");
String guestFullName03 = values.get("fullname_03");
String guestUPN03 = values.get("upn_03");

shouldNotEmpty = false;

if (guestFullName03 != null && !guestFullName03.isEmpty()) {
	shouldNotEmpty = true;
}
if (guestEmail03 != null && !guestEmail03.isEmpty()) {
	shouldNotEmpty = true;
}

if (guestEmail03 != null && !guestEmail03.isEmpty()) {
	if (mapSet.contains(guestEmail03)) {
		outputProps.put("error.GEmail_03", "Error: Email address must be unique.");
	} else {
		mapSet.add(guestEmail03);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.GEmail_03", "Error: Email address cannot be empty.");
}
if (guestFullName03 != null && !guestFullName03.isEmpty()) {
	if (fullNameSet.contains(guestFullName03)) {
		outputProps.put("error.fullname_03", "Error: Display Name must be unique.");
	} else {
		fullNameSet.add(guestFullName03);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.fullname_03", "Error: Display Name cannot be empty.");
}
if (guestUPN03 != null && !guestUPN03.isEmpty()) {

} else if (shouldNotEmpty) {
	outputProps.put("error.upn_03", "Error: User principal name cannot be empty.");
}


String guestEmail04 = values.get("GEmail_04");
String guestFullName04 = values.get("fullname_04");
String guestUPN04 = values.get("upn_04");

shouldNotEmpty = false;

if (guestFullName04 != null && !guestFullName04.isEmpty()) {
	shouldNotEmpty = true;
}
if (guestEmail04 != null && !guestEmail04.isEmpty()) {
	shouldNotEmpty = true;
}

if (guestEmail04 != null && !guestEmail04.isEmpty()) {
	if (mapSet.contains(guestEmail04)) {
		outputProps.put("error.GEmail_04", "Error: Email address must be unique.");
	} else {
		mapSet.add(guestEmail04);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.GEmail_04", "Error: Email address cannot be empty.");
}
if (guestFullName04 != null && !guestFullName04.isEmpty()) {
	if (fullNameSet.contains(guestFullName04)) {
		outputProps.put("error.fullname_04", "Error: Display Name must be unique.");
	} else {
		fullNameSet.add(guestFullName04);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.fullname_04", "Error: Display Name cannot be empty.");
}
if (guestUPN04 != null && !guestUPN04.isEmpty()) {

} else if (shouldNotEmpty) {
	outputProps.put("error.upn_04", "Error: User principal name cannot be empty.");
}


String guestEmail05 = values.get("GEmail_05");
String guestFullName05 = values.get("fullname_05");
String guestUPN05 = values.get("upn_05");

shouldNotEmpty = false;

if (guestFullName05 != null && !guestFullName05.isEmpty()) {
	shouldNotEmpty = true;
}
if (guestEmail05 != null && !guestEmail05.isEmpty()) {
	shouldNotEmpty = true;
}

if (guestEmail05 != null && !guestEmail05.isEmpty()) {
	if (mapSet.contains(guestEmail05)) {
		outputProps.put("error.GEmail_05", "Error: Email address must be unique.");
	} else {
		mapSet.add(guestEmail05);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.GEmail_05", "Error: Email address cannot be empty.");
}
if (guestFullName05 != null && !guestFullName05.isEmpty()) {
	if (fullNameSet.contains(guestFullName05)) {
		outputProps.put("error.fullname_05", "Error: Display Name must be unique.");
	} else {
		fullNameSet.add(guestFullName05);
	}
} else if (shouldNotEmpty) {
	outputProps.put("error.fullname_05", "Error: Display Name cannot be empty.");
}
if (guestUPN05 != null && !guestUPN05.isEmpty() && shouldNotEmpty) {

} else if (shouldNotEmpty) {
	outputProps.put("error.upn_05", "Error: User principal name cannot be empty.");
}

//System.out.println("validateform.jsp request method=" + request.getMethod());
//System.out.println("validateform.jsp parameterMap=" + request.getParameterMap());
//System.out.println("validateform.jsp values=" + values);
//System.out.println("validateform.jsp questions=" + questions);

ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
outputProps.store(outputStream, null);
outputStream.close();
out.print(outputStream.toString("ISO-8859-1"));
%>