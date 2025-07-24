<%
String role = (String) session.getAttribute("role");
if (role == null) {
    response.sendRedirect("login.html");
    return;
}
if (role.equals("Student")) {
    response.sendRedirect("student_dashboard.html");
} else if (role.equals("Faculty")) {
    response.sendRedirect("faculty_dashboard.html");
} else if (role.equals("Admin")) {
    response.sendRedirect("admin_dashboard.html");
} else {
    out.println("Unknown role");
}
%>
