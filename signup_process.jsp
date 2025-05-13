<%@ page import="java.sql.*" %>
<%
String role = request.getParameter("role");
String email = request.getParameter("email");
String password = request.getParameter("password");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CheckIT?useSSL=false", "root", "jiya23");
    PreparedStatement ps = conn.prepareStatement("INSERT INTO users VALUES (?, ?, ?)");
    ps.setString(1, email);
    ps.setString(2, password);
    ps.setString(3, role);
    int rows = ps.executeUpdate();
    if (rows > 0) {
        out.println("<script>alert('Registration successful! Your account will be activated only after admin approval.'); window.location='login.html';</script>");
    } 
    else {
        out.println("<script>alert('Registration failed. Please try again.'); window.location='signup.html';</script>");
    }
    ps.close();
    conn.close();
} 
catch (Exception e) {
    out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='signup.html';</script>");
}
%>
