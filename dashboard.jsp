<%
String role = (String) session.getAttribute("role");
if (role == null) {
    response.sendRedirect("login.html");
    return;
}
if (role.equals("student")) {
    response.sendRedirect("student_dashboard.html");
} else if (role.equals("faculty")) {
    response.sendRedirect("faculty_dashboard.html");
} else if (role.equals("admin")) {
    response.sendRedirect("admin_dashboard.html");
} else {
    out.println("Unknown role");
}
%>
