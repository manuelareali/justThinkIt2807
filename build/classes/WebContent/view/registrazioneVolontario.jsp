<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- dichiarazione e instanziazione di un loginBean !-->
<jsp:useBean id="RegistrazioneVolontarioBoundary" scope="request" class="beanweb.RegistrazioneVolontarioBoundary"/>

<!-- mappare gli attributi di un oggetto sui campi della form -->
<jsp:setProperty name="RegistrazioneVolontarioBoundary" property="*"/>

<%
Class.forName("com.mysql.jdbc.Driver");
 		if(request.getParameter("COMPLETA REGISTRAZIONE")!=null){
 			if ( request.getParameter("confermaPassword").equalsIgnoreCase(request.getParameter("Password"))){
 				if ((RegistrazioneVolontarioBoundary.registraVolontarioPressed(request.getParameter("Nome"),request.getParameter("Cognome"),request.getParameter("Password"), request.getParameter("confermaPassword"),request.getParameter("indirizzo")+ " "+ request.getParameter("Via")+" "+ request.getParameter("nCivico"),request.getParameter("RecapitoTel"),request.getParameter("Email"),request.getParameter("DataNascita"), request.getParameter("Citt�"))) == true ){ 			
%>
  
			<jsp:forward page="homeVolontario.jsp"/>
<%
		
					}	 				 
 				}
 		else{
 			
%>

 			<jsp:forward page="registrazioneVolontario.jsp"/>
<% 		
	}
 			}
 	
 	
 	
%>	

<!doctype html>
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

<title>REGISTARZIONE VOLONTARIO</title>
<link rel="stylesheet" href="../css/formTutteRegistrazione.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<div class="container text-center">
			<h1>Registrazione Volontario</h1>
		</div>
		<div class = "container">
		<div class = "form">
			<form class="row g-3 needs-validation"  action="registrazioneVolontario.jsp" name = "reg" method = "POST">
				
				<div class="col-md-4">
					<label for="validationCustom01" class="form-label">Nome
						</label> <input type="text" class="form-control" id = "Nome" name= "Nome" placeholder="es. Mario" required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom02" class="form-label">Cognome</label>
					<input type="text" class="form-control" id= "Cognome" name= "Cognome" placheholder="es. Rossi" required>
				</div>


				<div class="col-md-4">
					<label for="validationCustom03" class="form-label">Data di Nascita</label> <input type="text" class="form-control"
						id= "DataNascita" name= "DataNascita" placeholder="es. 17/03/1995" required >
				</div>

				<div class="col-md-4">
					<label for="validationCustom04" class="form-label">Provincia</label>
					<input type="text" class="form-control"  id ="Citt�" name= "Citt�"  placeholder="es.Roma"required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom05" class="form-label">Comune
						di Residenza</label> <input type="text" class="form-control"
						id="IndirizzoCaritas" id ="indirizzo" name= "indirizzo"  placeholder="es.Ostia" required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom06" class="form-label">Via</label> <input
						type="text" class="form-control" id="Via" name="Via"
						placeholder="es. Luigi settembrini" required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom07" class="form-label">N Civico</label>
					<input type="text" class="form-control" id="nCivico" name="nCivico"
						placeholder="es.54" required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom08" class="form-label">Telefono</label>
					<input type="text" class="form-control" id="RecapitoTel"
						name="RecapitoTel" placeholder="es.34324234" required>
				</div>

				<div class="col-md-4">
					<label for="validationCustom09" class="form-label">Email</label> <input
						type="text" class="form-control" id="Email" name="Email"
						placeholder="es.caritasRoma@gmail.com" required>
				</div>
				
				<div class="col-md-4">
					<label for="validationCustom10" class="form-label">Password</label> <input
						type="password" class="form-control" id= "Password" name= "Password" required>
				</div>
				
				<div class="col-md-4">
					<label for="validationCustom11" class="form-label">Conferma Password</label> <input
						type="password" class="form-control"  id= "confermaPassword" name= "confermaPassword" required>
				</div>
	
				</div>
				<div class="indietro ">
					<p>
						<a class="ind" href="registrazione.jsp">Torna indietro</a>
					</p>
					</div>
			
				
				<div class="completa">
					<button class="btn btn-light" type="submit"  name= "COMPLETA REGISTRAZIONE" value="COMPLETA REGISTRAZIONE">COMPLETA
						REGISTRAZIONE</button>
				</div>
				
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