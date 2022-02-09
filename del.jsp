
<%@page import="java.sql.*" %> 


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Seenuselvi@17");
        pst = con.prepareStatement("delete from task where title = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        String redirectURL = "newjsp.jsp";
response.sendRedirect(redirectURL);
        %>
       