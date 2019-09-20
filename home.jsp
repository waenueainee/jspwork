<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ include file="config.jsp" %>
<%

Object user_id = session.getAttribute("user_id");
if (user_id == null) {
	response.sendRedirect("login.jsp");
}

Connection connect = null;
Statement statement = null;

String username = null;
String email = null;
String name = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	connect =  DriverManager.getConnection("jdbc:mysql://" + mysql_host + "/" + mysql_db + "" +"?user=" + mysql_username + "&password=" + mysql_password);
	statement = connect.createStatement();
	ResultSet user_data = statement.executeQuery("SELECT * FROM `users` WHERE `id` = '" + user_id.toString() + "';");
	if (user_data.next()) {
		username = user_data.getString("username");
		email = user_data.getString("email");
		name = user_data.getString("name");
	} else {
		session.removeAttribute("user_id");
		response.sendRedirect("login.jsp");
	}
}  catch (Exception e) {
	out.println(e.getMessage());
	e.printStackTrace();
}
try {
	if (statement != null){
		statement.close();
		connect.close();
	}
} catch (SQLException e) {
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>หน้าหลัก</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/offcanvas.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	<script defer src="assets/js/all.js"></script>
</head>
<style>
body{
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: url(assets/img/bg.jpg) no-repeat;
  background-size: cover;
}
</style>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand mb-0 h1" href="#">JSP Final</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="fas fa-home"></i>&nbsp; หน้าหลัก</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="data.jsp"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="map.jsp"><i class="fas fa-map-marked-alt"></i>&nbsp; แผนที่</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="about.jsp"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp; ออกจากระบบ</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br><br><br><br><br>
	<main role="main" class="container">
		<div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm pb-2">
			<i class="fas fa-user-circle fa-5x mr-3" ></i>
			<div class="lh-100">
				<h3 class="mb-0 text-white">ยินดีต้อนรับ!</h3>
				<h6>คุณ <%=name%></h6>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 pb-3">
				<div class="card">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<a class="sidebar-link black" href="#"><i class="fas fa-home"></i>&nbsp; หน้าหลัก</a>
						</li>
						<li class="list-group-item">
							<a class="sidebar-link black" href="data.jsp"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</a>
						</li>
						<li class="list-group-item">
							<a class="sidebar-link black" href="map.jsp"><i class="fas fa-map-marked-alt"></i>&nbsp; แผนที่</a>
						</li>
						<li class="list-group-item">
							<a class="sidebar-link black" href="about.jsp"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</a>
						</li>
						<li class="list-group-item">
							<a class="sidebar-link black" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp; ออกจากระบบ</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="col-lg-9">
				<div class="card">
					<div class="card-body">
						<h4><i class="fas fa-home"></i>&nbsp; บัญชีผู้ใช้ของฉัน</h4>
						<div class="my-2 p-2">
							<div class="media text-muted pt-3">
								<i class="fas fa-user-tag fa-2x mr-3 fa-fw"></i>
								<div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
									<div class="d-flex justify-content-between align-items-center w-100">
										<strong class="text-dark">ชื่อผู้ใช้</strong>
									</div>
									<span class="d-block"><%=username%></span>
								</div>
							</div>
							<div class="media text-muted pt-3">
								<i class="fas fa-at fa-2x mr-3 fa-fw"></i>
								<div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
									<div class="d-flex justify-content-between align-items-center w-100">
										<strong class="text-dark">ที่อยู่อีเมล</strong>
									</div>
									<span class="d-block"><%=email%></span>
								</div>
							</div>
							<div class="media text-muted pt-3">
								<i class="fas fa-edit fa-2x mr-3 fa-fw"></i>
								<div class="media-body pb-1 mb-0 lh-125">
									<div class="d-flex justify-content-between align-items-center w-100">
										<strong class="text-dark">ชื่อ-นามสกุล</strong>
									</div>
									<span class="d-block"><%=name%></span>
								</div>
							</div>
					    </div>
					</div>
				</div>
			</div>
		</div>
<div style="background-color:hsl(24, 100%, 50%);text-align:center;padding:30px;margin-top:7px;
	</main>
	
		height: 85px;border-radius: 2%;color:white;"> <h5>
		<marquee >Welcome to login Java Server Pages!!!        
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              
			𝑰𝒏 𝒕𝒉𝒆 𝒆𝒏𝒅, 𝒘𝒆 𝒍𝒆𝒂𝒓𝒏 𝒉𝒐𝒘 𝒕𝒐 𝒃𝒆 𝒔𝒕𝒓𝒐𝒏𝒈 𝒂𝒍𝒐𝒏𝒆.   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              |    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			            I may be far, but never gone.</marquee></h5></div>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
