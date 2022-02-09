<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 
<%
    if(request.getParameter("submit")!=null)
    {
            String userid = session.getAttribute("userid").toString();
        String otitle = request.getParameter("title");
        String titl = otitle;
String star = request.getParameter("start");
String en=request.getParameter("end");
String status=request.getParameter("status");

Date start = Date.valueOf(star);
Date end = Date.valueOf(en);
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Seenuselvi@17");
        pst = con.prepareStatement("update task set title = ?,start =?,end= ?, status=? where title = ? and userid =?");
		pst.setString(1,titl);
                pst.setDate(2,start);
                pst.setDate(3,end);
		pst.setString(4,status);
         pst.setString(5, otitle);
         pst.setString(6, userid);
        pst.executeUpdate();    
            String redirectURL = "newjsp.jsp";
                response.sendRedirect(redirectURL);
        %>
        
       
    <%            
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Form</title>
    <style>
         body{
                background-image: url("https://i.pinimg.com/736x/c0/c5/dd/c0c5dd5d913bf34ff22bb9a3c4b80057.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
            }
        body, html {
  height: 100%;
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}
* {
  box-sizing: border-box;
}

.container {
  border-style: solid;
  border-width: 5px;
  position: absolute;
  top: 150px;
  right: 500px;
  margin: 20px;
  max-width: 300px;
  min-height: 330px;
  padding: 16px;
  background-color: white;
}

.btn {
  background-color: #5c4033;
  color: white;
  padding: 10px 10px;
  border: 2;
  border-radius: 8px;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.btn:hover {
  opacity: 1;
}
input[type=text], input[type=select], input[type=date] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
input[type=text]:focus, input[type=select]:focus, input[type=date]:focus {
  background-color: #ddd;
  outline: none;
}

select{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
select:focus {
  background-color: #ddd;
  outline: none;
}
button {
  background-color: #5c4033;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity:0.9;
}
button:hover {
  opacity: 1;
}
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #5c4033;
}
.container1 {
  padding: 16px;
}
span.psw {
  float: right;
  padding-top: 16px;
}
.modal {
  display: none; 
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: #f2f2f2; 
  background-color: #f2f2f2; 
  padding-top: 50px;
}
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto;
  border: 1px solid #888;
  width: 80%;
}
.close {
  position: absolute;
  right: 25px;
  top: 15px;
  color: #5c4033;
  font-size: 35px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: brown;
  cursor: pointer;
}
.animate {
  -webkit-animation: animatezoom 0.6s;
 animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
} 
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}
</style>
</head>
    <body>
        
        
         <a href="newjsp.jsp"><span onclick="newjsp.jsp" class="close" title="Close Modal">&times;</span></a>

  <form class="modal-content animate" action="#" method="post">
    <div class="container1">
        <h1>Update a Task !</h1>
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Seenuselvi@17");
                          
                          String userid = session.getAttribute("userid").toString();
                          String title = request.getParameter("id");
                     
        
                        pst = con.prepareStatement("select * from task where userid = ? and title = ?");
                        pst.setString(1, userid);
                        pst.setString(2, title);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    
                        
                    <label for="title"><b>Title</b></label>
      <input type="text" placeholder="Enter Title" name="title" value="<%= rs.getString("title")%>" id="title" required>
      
      <label for="start"><b>Start Date</b></label><br>
      <input type="date" name="start" id="start" value="<%= rs.getString("start")%>" required><!-- comment -->
      <br>
      <label for="end"><b>End Date</b></label><br>
      <input type="date" name="end" id="end" value="<%= rs.getString("end")%>" required>
<br>
      <label for="status"><b>Progress</b></label><br>
      <select type="text" name="status" id="status">
    <option value="To Start">To Start</option>
    <option value="In Progress">In Progress</option>
    <option value="Completed">Completed</option>
  </select>
    <button type="submit" id="submit" value="submit" name="submit">Update</button>
      
    </div>
  </form>
  <%}%>
    </body>
</html>
