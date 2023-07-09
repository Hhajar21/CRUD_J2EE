<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>New Student - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        
  
        
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">ENSAF</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" >
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch"/>
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
                                  
                                </nav>
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
                        <h1 class="mt-4">New Student</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">New Student</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    The objective of this webpage is to provide a comprehensive guide on the process of incorporating a new student into your database, ensuring efficient student data management and administration.
                                </p>
                            </div>
                        </div>
                      <div class="container mt-5">
						   <form class="row g-3" id="studentForm" action="studentServlet" method="post">
						   <div class="col-md-7">
						    <input class="form-control" placeholder="Search..." type="search"   name="search"/>
						  </div>
						  
						   <div class="col-md-5">
						   <input type="submit" class="btn btn-secondary"  name="action" value="search" />
							  <input type="submit" class="btn btn-success" name="action" value="add" />
							  <input type="submit" class="btn btn-primary" name="action" value="update"/>
							  <input type="submit" class="btn btn-danger" name="action" value="Delete"/>
							</div>
					        
						   
						  <div class="col-md-6">
						    <label for="fullname" class="form-label">Full Name</label>
						    <input type="text" class="form-control" id="fullname" name="name" placeholder="Enter name" value="${fullName}">
						  </div>
						  <div class="col-md-6">
						    <label for="email" class="form-label">Email</label>
						   
						    <input type="text" name="email" class="form-control" placeholder="Enter Email" value="${email}">
						    
						  </div>
						  <div class="col-md-6">
						    <label for="Phone" class="form-label">Phone</label>
						    <input type="text" class="form-control" id="Phone" name="Phone" placeholder="Enter Phone" value="${phone}">
						  </div>
						  <div class="col-md-6">
						    <label for="City" class="form-label">City</label>
						    <input type="text" class="form-control" id="City" name="City" placeholder="Enter City" value="${city}">
						  </div> 
						 
						  <div class="col-md-6">
						    <label for="Field" class="form-label">Field</label>
						    <select id="Field" class="form-select" name="Field">
						        <option selected>Choose...</option>
						        <option ${field == 'MYQ2SI' ? 'selected' : ''}>MYQ2SI</option>
						        <option ${field == 'Software Engineering' ? 'selected' : ''}>Software Engineering</option>
						        <option ${field == 'IFSMD' ? 'selected' : ''}>IFSMD</option>
						        <option ${field == 'SYSTEM' ? 'selected' : ''}>SYSTEM</option>
						        <option ${field == '2ISD' ? 'selected' : ''}>2ISD</option>
						        <option ${field == 'CRSI' ? 'selected' : ''}>CRSI</option>
						        <option ${field == 'FDWJEE' ? 'selected' : ''}>FDWJEE</option>
						    </select>
						  </div>
						  <div class="col-md-6">
						    <label for="edu" class="form-label">Continuing Education</label>
						    <select id="edu" class="form-select" name="edu">
								        <option ${edu == 'Choose...' ? 'selected' : ''} value="${edu}">Choose...</option>
								        <option ${edu == 'Bac+3' ? 'selected' : ''}>Bac+3</option>
								        <option ${edu == 'Bac+5' ? 'selected' : ''}>Bac+5</option>
								    </select>
						  </div>
						  <div class="col-md-6">
						    <label for="start_date" class="form-label">Start Date</label>
						    <input type="date" class="form-control" id="start_date" name="start_date" placeholder="Enter start date" value="${startDate}">
						  </div>
						  <div class="col-md-6">
						    <label for="Payment" class="form-label">Payment</label>
						    <input type="text" class="form-control" id="Payment" name="Payment" placeholder="Enter how much the studies cost" value="${payment}">
						  </div>
						

						</form>



                    </div>
                </main>
                <br>
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
     
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
     <script type="text/javascript">
		
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Congrats","Add Student Successfully","success");
		}
		else(status == "failed"){
			swal("Sorry","Please double-check your code !!","error");
		}
		
	</script>
    </body>
</html>
