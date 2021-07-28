<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.TurnoTab"%>
<%@ page import="beanweb.GestisciTurniBoundary"%>

<%
Class.forName("com.mysql.jdbc.Driver");
if (request.getParameter("modifica") != null) {
	if (GestisciTurniBoundary.getInstance().modificaTurno(request.getParameter("note"),
	request.getParameter("id")) == true) {
%>
<jsp:forward page="homeCaritas.jsp" />
<%
}
}
%>
<%
if (request.getParameter("crea") != null) {
	GestisciTurniBoundary.getInstance().creaTurno();
%>
<jsp:forward page="creaTurno.jsp" />
<%
}

if (request.getParameter("indietro") != null) {
%>
<jsp:forward page="homeCaritas.jsp" />
<%
}

if (request.getParameter("eliminaTurno") != null) {
if (GestisciTurniBoundary.getInstance().cancellaTurno(request.getParameter("turno")) == true) {
%>
<jsp:forward page="homeCaritas.jsp" />
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

<title>GESTISCI TURNI</title>
<link rel="stylesheet" href="../css/gestisciCaritasTurni.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<form action="gestisciTurniCaritas.jsp" name="my" method="POST">


			<div class="container text-center">
				<h1>Gestisci Turni</h1>
			</div>


			<div class="row">
				<div class="col">
					</br>
					<button class="btn  btn-light" type="submit" name="eliminaTurno"
						value="eliminaTurno">Elimina Turno</button>
					<input type="text" id="turno" name="turno" placeholder="Inserisci l'ID del turno da eliminare">
				</div>
			</div>


			<div class="row">
				<div class="col">
					</br>
					<button class="btn btn-light" type="submit" name="modifica"
						value="modifica">Modifica Note</button>

					<input type="text" id="id" name="id"
						placeholder="Inserisci l'ID del turno a cui modificare le note">

					<input class="note" id="note" name="note"
						placeholder="Bisogna essere puntuali!"></input>
				</div>


			</div>


			<div class="indietro">
				<button class="btn btn-warning" type="submit" name="indietro"
					value="indietro">Indietro</button>
			</div>


			<div class="crea">
				<button style="width: 250px;" class="btn  btn-light" type="submit"
					name="crea" value="crea">Crea Turno</button>
			</div>

			<div class="content text-center my-2">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID TURNO</th>
						<th scope="col">GIORNO</th>
						<th scope="col">ORARIO</th>
						<th scope="col">PARTECIPANTI</th>
						<th scope="col">NOTE</th>
					</tr>
				</thead>
				<tbody>
					<%
									List<TurnoTab> list = GestisciTurniBoundary.getInstance().loadFormTurni();
									int i = 0;
									while (i < list.size()) {
									%>
					<tr>
						<td>
							<%
											out.println(list.get(i).getId());
											%>
						
						<td>
							<%
											out.println(list.get(i).getGiorno());
											%>
						</td>
						<td>
							<%
											out.println(list.get(i).getOraIn());
											%> <%
 out.println(list.get(i).getOraFine());
 %>
						</td>
						<td>
							<%
											out.println(list.get(i).getPartecipanti());
											%>
						</td>
						<td>
							<%
											out.println(list.get(i).getNote());
											%>
						</td>
					</tr>

					<%
									i++;
									}
									%>

				</tbody>
			</table>
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
		</form>
	</div>
</body>
</html>