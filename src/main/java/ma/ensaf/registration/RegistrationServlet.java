package ma.ensaf.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_name = request.getParameter("name");
		String user_email = request.getParameter("email");
		String user_pwd = request.getParameter("pass");
		String user_phone = request.getParameter("contact");
		RequestDispatcher dis = null;
		Connection cnx = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver charge");
			cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false","root","Str@22Habibi");
			System.out.println("connection pass");
			PreparedStatement pst = cnx.prepareStatement("INSERT INTO userlogin(username,userpassword,useremail,userphone) VALUES(?,?,?,?)"); 
			pst.setString(1, user_name);
			pst.setString(2, user_pwd);
			pst.setString(3, user_email);
			pst.setString(4, user_phone);
			
			int rowCount = pst.executeUpdate();
			dis = request.getRequestDispatcher("registration.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				cnx.close();
			} catch (Exception e2) 
			{
				// TODO: handle exception
			}
		}
	}
	}
