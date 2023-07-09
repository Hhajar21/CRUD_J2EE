package ma.ensaf.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String useremail = request.getParameter("username");
		String userpassword = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dis = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver charge");
			Connection	cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false","root","Str@22Habibi");
			System.out.println("connection pass");
			PreparedStatement pst = cnx.prepareStatement("select * from userlogin where useremail = ? and userpassword = ?");
			pst.setString(1, useremail);
			pst.setString(2, userpassword);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("name", rs.getString("username"));
				dis = request.getRequestDispatcher("index.jsp");
				System.out.println(useremail + " "+ userpassword);
			}else {
				request.setAttribute("status", "failed");
				dis = request.getRequestDispatcher("login.jsp");
			}
			dis.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
