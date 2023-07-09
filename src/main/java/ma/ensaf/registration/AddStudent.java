package ma.ensaf.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/studentServlet")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public AddStudent() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		String action = request.getParameter("action");

        if (action != null && !action.isEmpty()) {
            if (action.equals("add")) {
                addStudent(request, response);
            } else if (action.equals("update")) {
                updateStudent(request, response);
            } else if (action.equals("Delete")) {
                deleteStudent(request, response);
            } else if (action.equals("search")) {
                search(request, response);
            }
        } else {
            addStudent(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false", "root", "Str@22Habibi");

            String query = "SELECT * FROM student WHERE Email=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, search);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String fullName = rs.getString("Full_Name");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String city = rs.getString("City");
                String field = rs.getString("Field");
                String edu = rs.getString("Edu");
                String startDate = rs.getString("start_date");
                String payment = rs.getString("payment");

                request.setAttribute("fullName", fullName);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("city", city);
                request.setAttribute("field", field);
                request.setAttribute("edu", edu);
                request.setAttribute("startDate", startDate);
                request.setAttribute("payment", payment);

                request.getRequestDispatcher("New_Student.jsp").forward(request, response);
            } else {
                response.sendRedirect("New_Student.jsp?status=failed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("New_Student.jsp?status=error");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	    
	    private void addStudent(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String fullName = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("Phone");
	        String city = request.getParameter("City");
	        String field = request.getParameter("Field");
	        String edu = request.getParameter("edu");
	        String startDate = request.getParameter("start_date");
	        String payment = request.getParameter("Payment");
	        
	        
	        Connection conn = null;
	        PreparedStatement stmt = null;
	          if (!fullName.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !city.isEmpty() && !field.equals("Choose...") && !edu.equals("Choose...") && !startDate.isEmpty() && !payment.isEmpty()) 
	            {
			        try 
			        {
			        	
			            Class.forName("com.mysql.jdbc.Driver");
			            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false", "root", "Str@22Habibi");
			          
			            String query = "INSERT INTO student (Full_Name, Email, Phone, City, Field, Edu, start_date, payment) "
			                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			            stmt = conn.prepareStatement(query);
			            stmt.setString(1, fullName);
			            stmt.setString(2, email);
			            stmt.setString(3, phone);
			            stmt.setString(4, city);
			            stmt.setString(5, field);
			            stmt.setString(6, edu);
			            stmt.setString(7, startDate);
			            stmt.setString(8, payment);
	            
				            int rowCount = stmt.executeUpdate();
				            
				            if (rowCount > 0 ) 
				            {
						                response.sendRedirect("New_Student.jsp?status=success");
						   } else 
						   {
							   		response.sendRedirect("New_Student.jsp?status=failed");
						   }
	            }
	         catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	          
	            response.sendRedirect("New_Student.jsp?status=error");
	        } finally {
	            try {
	                if (stmt != null) {
	                    stmt.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            }
	         }else {
	            	RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
	            	dis.forward(request, response);
	            }
	        
	        
	        
	    }
	    
	    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String fullName = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("Phone");
	        String city = request.getParameter("City");
	        String field = request.getParameter("Field");
	        String edu = request.getParameter("edu");
	        String startDate = request.getParameter("start_date");
	        String payment = request.getParameter("Payment");

	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false", "root", "Str@22Habibi");

	            String query = "UPDATE student SET Full_Name=?, Phone=?, City=?, Field=?, Edu=?, start_date=?, payment=? WHERE Email=?";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, fullName);
	            stmt.setString(2, phone);
	            stmt.setString(3, city);
	            stmt.setString(4, field);
	            stmt.setString(5, edu);
	            stmt.setString(6, startDate);
	            stmt.setString(7, payment);
	            stmt.setString(8, email);

	            int rowCount = stmt.executeUpdate();

	            if (rowCount > 0) {
	                response.sendRedirect("New_Student.jsp?status=success");
	            } else {
	                response.sendRedirect("New_Student.jsp?status=failed");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("New_Student.jsp?status=error");
	        } finally {
	            try {
	                if (stmt != null) {
	                    stmt.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    
	    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String studentEmail = request.getParameter("email");
	        
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false", "root", "Str@22Habibi");

	            String query = "DELETE FROM student WHERE Email = ?";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, studentEmail);

	            int rowCount = stmt.executeUpdate();

	            if (rowCount > 0) {
	            	
	                response.sendRedirect("New_Student.jsp?status=success");
	            } else {
	            
	                response.sendRedirect("New_Student.jsp?status=failed");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	          
	            response.sendRedirect("New_Student.jsp?status=error");
	        } finally {
	            try {
	                if (stmt != null) {
	                    stmt.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}