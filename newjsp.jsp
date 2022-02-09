<%-- 
    Document   : newjsp
    Created on : 25-Jan-2022, 1:23:04 pm
    Author     : harin
--%>

<%@page import="java.net.URI"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Tasks !</title>
        <style>
            td{text-align: center;}
            h1{text-align: center;
            font-size: 40px;}
            tr{text-align: center;}
            table{
  margin-left: auto;
  margin-right: auto;
}
button {
  background-color: #5c4033;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  opacity:0.9;
}
button:hover {
  opacity: 1;
}
.b{
    position: absolute;
    left: 45%;
}
            body{
                background-image: url("https://i.pinimg.com/originals/03/b4/e6/03b4e6bf5a49dbaa2f3f682615810553.jpg");
  -moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
  background-repeat: no-repeat;
            }
            
            .styled-table {
                margin-left: auto;
  margin-right: auto;
    border-collapse: collapse;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
            
        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
            function preback(){window.history.forward();}
setTimeout("preback()",0);
window.onunload=function(){null;};
        </script>
    </head>
    <body>
        <div>
            <%
         
            String userid = session.getAttribute("userid").toString();
            %>
            <br><!-- comment -->
            <br>
            <br><!-- comment -->
            <br><!-- comment -->
            <br>
            <br>
            <h1> Welcome, <%=userid%> !</h1>
          
            <a href="create.html"><button class="b" onclick="create.html">CREATE</button></a>
            <br><!-- comment -->
            <br><!-- comment -->
            <br><!-- comment -->
            <br><!-- comment -->
            <br>
        </div>
        <div>
            
        
    <%
        
         try 
         {  
             Class.forName("com.mysql.jdbc.Driver");  
             Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Seenuselvi@17");  
             PreparedStatement statement = con.prepareStatement("select * from task where userid = ?");    
             statement.setString(1, userid);    
             ResultSet rs = statement.executeQuery();

         
             out.println("<table border=1 width=50% height=50% class=styled-table > ");  
             out.println("<tr><th>Title</th><th>Start Date</th><th>End Date</th><th>Status</th><th>Update ?</th><th>Delete ?</th><tr>");  
             while (rs.next()) 
             {  
                 String t = rs.getString("title");  
                 Date s = rs.getDate("start");  
                 Date e = rs.getDate("end"); 
                 String p = rs.getString("status"); 
                 %><tr>
                                 <td><%=t%></td>
                                 <td><%=s%></td>
                                 <td><%=e%></td>
                                 <td><%=p%></td>
                                 <td><a href="upd.jsp?id=<%=t%>"><button>Update</button></a></td>
                                 <td><a href="del.jsp?id=<%=t%>"><button>Delete</button></a></td>
                             </tr><%
                   
             }  
             out.println("</table>");  
//             out.println("</html></body>");  
             con.close();  
       
            }  
             catch (Exception e) 
            {  
             out.println("error");  
         }  
         %>
</div>
<br><!-- < -->
<br><!-- comment -->
<br>
<br><!-- comment --><form action="logout">
    <button type="submit" class="b" >LOGOUT</button>
            </form>
        </body>
</html>