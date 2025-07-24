<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%    
String email = request.getParameter("email");
String password = request.getParameter("password");
try {
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:postgresql://db.qkijxgbzqjwhtepharsa.supabase.co:5432/postgres","postgres","AcroIt@2025");
    PreparedStatement ps = conn.prepareStatement("SELECT role FROM users WHERE email=? AND password=?");
    ps.setString(1, email);
    ps.setString(2, password);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        String role = rs.getString("role");
        session.setAttribute("email", email);
        session.setAttribute("role", role);
        response.sendRedirect("dashboard.jsp");
    } 
    else {
        out.println("<script>alert('Invalid email or password'); location='login.html';</script>");
    }
    ps.close();
    conn.close();
} 
catch (Exception e) {
    out.println("<script>alert('Error: " + e.getMessage() + "'); location='login.html';</script>");
}
%>
