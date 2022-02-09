import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class create extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String userid = session.getAttribute("userid").toString();
String title=request.getParameter("title");
String star = request.getParameter("start");
String en=request.getParameter("end");
String status=request.getParameter("status");

Date start = Date.valueOf(star);
Date end = Date.valueOf(en);

out.println(userid);
out.println(title);
out.println(start);
out.println(end);
out.println(status);
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","Seenuselvi@17"); 	
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("insert into task(userid,title,start,end,status) values(?,?,?,?,?)"); 
		pstmt.setString(1,userid);
		pstmt.setString(2,title);
                pstmt.setDate(3,start);
                pstmt.setDate(4,end);
		pstmt.setString(5,status);
                out.println("4");
		pstmt.executeUpdate();
                out.println("5");
		con.close(); 
                String redirectURL = "newjsp.jsp";
                response.sendRedirect(redirectURL);
//                String url = "home.html";
//                File file = new File(url);
//                Desktop.getDesktop().browse(file.toURI());
	out.println("Successfully added");
}
catch(Exception e)
{
	out.println("Error");
}
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(create.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(create.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
