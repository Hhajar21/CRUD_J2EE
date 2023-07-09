<%
 if(session.getAttribute("name")==null)
 {
	 response.sendRedirect("login.jsp");
 }
%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
   
   <style type="text/css">
   
   #user{
   		width: 63px;
   		height: 63px;
   		margin: 1%;
   		display: flex;
   }
   #user_s{
   background-color: #dcdcdc;
  border: 1px solid #ccc;
   }
   
   </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">ENSAF</a>
             <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Profile</a></li>
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                          
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.jsp">Login</a>
                                            <a class="nav-link" href="registration.jsp">Register</a>
                                          
                                        </nav>
                                    </div>
                                    
                            </div>
                           <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="New_Student.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-add"></i></div>
                                New Student
                            </a>
                            <a class="nav-link" href="tables.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Student Records
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                     
                        <div class="small">Logged in as:</div>
                        ENSAF user
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Home</li>
                        </ol>
                     
						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4" id="user_s">
								<div style="display: flex; align-items: center;">
								  <img src="images/user.ico" class="card-img-top" id="user" alt="User Image" style="margin-right: 10px;">
								  <p>Good Afternoon,
								  <br>
								  <b><%=session.getAttribute("name") %></b>
								  </p>
								</div>
                                    <div class="card-body">
                               Hello there! I hope you're having a great day. Did you know that as an admin, you have the ability to efficiently manage your students?
                            </div>
		                         <a href="New_Student.jsp" class="link-dark link-offset-3
		                             link-underline-opacity-27 link-underline-opacity-100-hover">
		                            <span style="color: black; padding-left: 1%;">Student Management</span>
		                           </a>
                            </div>
                            </div>
                           
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Students List
                            </div>
                             <div class="card-body">
                                <table id="datatablesSimple">
							    <thead>
							        <tr>
							            <th>Full Name</th>
							            <th>Email</th>
							            <th>Phone</th>
							            <th>City</th>
							            <th>Field</th>
							            <th>Education</th>
							            <th>Start date</th>
							            <th>Payment</th>
							        </tr>
							    </thead>
							    <tfoot>
							        <tr>
							            <th>Full Name</th>
							            <th>Email</th>
							            <th>Phone</th>
							            <th>City</th>
							            <th>Field</th>
							            <th>Education</th>
							            <th>Start date</th>
							            <th>Payment</th>
							        </tr>
							    </tfoot>
							    <tbody>
							        <% 
							        try {
										
							        	Class.forName("com.mysql.jdbc.Driver");
							        	Connection cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_j2ee?useSSL=false", "root", "Str@22Habibi");
							            Statement statement = cnx.createStatement();
							            ResultSet rs = statement.executeQuery("SELECT * FROM student");
							            
							            while (rs.next()) {
							            	%>
							           <tr>
							            <td><%= rs.getString("Full_Name") %></td>
							            <td><%= rs.getString("Email") %></td>
							            <td><%= rs.getString("Phone") %></td>
							            <td><%= rs.getString("City") %></td>
							            <td><%= rs.getString("Field") %></td>
							            <td><%= rs.getString("Edu") %></td>
							            <td><%= rs.getString("start_date") %></td>
							            <td><%= rs.getString("payment") %></td>
							        </tr>
							            	<%}
									} catch (Exception e) {
							            e.printStackTrace();
							            response.sendRedirect("tables.jsp?status=error");
									}
							  
							        %>
							       
							       
							    </tbody>
							</table>
							                                                       
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; ENSAF 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
