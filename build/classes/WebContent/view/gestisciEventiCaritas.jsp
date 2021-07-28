<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.EventTab"%>
<%@ page import="beanweb.GestisciEventiCaritasBoundary"%>

<%
Class.forName("com.mysql.jdbc.Driver");
%>
<%
if (request.getParameter("indietro") != null) {
%>
<jsp:forward page="homeCaritas.jsp" />
<%
}

if (request.getParameter("contatta") != null) {
%>
<jsp:forward page="contattaCaritasMap.jsp" />
<%
}
if (request.getParameter("cancella") != null) {
if (GestisciEventiCaritasBoundary.getInstance().cancellaEvento(request.getParameter("Id")) == true) {
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

<title>GESTISCI EVENTI</title>
<link rel="stylesheet" href="../css/gestisciCaritasEventi.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<form action="gestisciEventiCaritas.jsp" name="my" method="POST">

		
				<div class="container text-center">
					<h1>Gestisci Eventi</h1>
				</div>

				<div class = "container text-center">
				<div class="row">
						<div class="col">
							</br><button class="btn  btn-light" type="submit"   name = "cancella" value = "cancella">Elimina Evento</button>
							<input type="text" id = "Id" name= "Id"  placeholder="Inserisci l'ID degli eventi da eliminare">
						</div>

						<div class="col">
							</br><button class="btn btn-light" type="submit"  name= "contatta" value="contatta">Contatta Negozio</button>
						</div>
					</div>
			</div>
				

				<div class="indietro">
					<button class="btn btn-warning" type="submit" name="indietro"
						value="indietro">Indietro</button>
				</div>
			

			<div class="content text-center my-5">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID EVENTO</th>
							<th scope="col">EVENTO</th>
							<th scope="col">NEGOZIO</th>
							<th scope="col">NOTE EVENTO</th>
							<th scope="col">IMPORTO</th>
							<th scope="col">PARTECIPANTI</th>
							<th scope="col">STATO</th>
						</tr>
					</thead>
					<tbody>


						<%
						List<EventTab> list = GestisciEventiCaritasBoundary.getInstance().loadFormEvento();
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
								out.println(list.get(i).getNomeEvento());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getNomeNegozio());
								%>
							
							<td>
								<%
								out.println(list.get(i).getNoteEvento());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getImportoRaggiunto());
								%>/<%
								out.println(list.get(i).getPrezzoEvento());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getNumPartecipanti());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getStatoEvento());
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