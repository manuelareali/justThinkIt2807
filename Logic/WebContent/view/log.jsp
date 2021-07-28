<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- dichiarazione e instanziazione di un loginBean !-->
<jsp:useBean id="LoginBoundary" scope="request"
	class="beanweb.LoginBoundary" />

<!-- mappare gli attributi di un oggetto sui campi della form -->
<jsp:setProperty name="LoginBoundary" property="*" />


<%

	Class.forName("com.mysql.jdbc.Driver");

 	if(request.getParameter("login")!=null){
 		switch (LoginBoundary.loginPressed(request.getParameter("Username"), request.getParameter("Password"))){
 		case "Volontario":
 		
 %>
<jsp:forward page="homeVolontario.jsp" />
<%
 		break;
 		case "Caritas":
%>
<jsp:forward page="homeCaritas.jsp" />
<%
		break;
 		case "Negozio":
%>
<jsp:forward page="homeNegozio.jsp" />
<%
 		break;
 	case "Default":
%>
<jsp:forward page="log.jsp" />
<% 		
 
 		}}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>LOGIN</title>
<link rel="stylesheet" type="text/css" href="../css/log.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<div class="loginbox">
			<img src="../img/avatar.png" class="avatar" alt="avatar.">
			<h1>Login here</h1>
			<form action="log.jsp" name="my" method="POST">
				<p>Email</p>
				<input type="text" id="Username" name="Username"
					placeholder="Enter username" autocomplete="off">
				<p>Password</p>
				<input type="password" id="Password" name="Password"
					placeholder="Enter Password" autocomplete="off">
				<button type="submit" name="login" value="login">Login</button>
				<a href="registrazione.jsp">Don't have an account?</a>

			</form>
		</div>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>