<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.DonazioneTab"%>
<%@ page import="beanweb.GestisciDonazioniBoundary"%>

<%
Class.forName("com.mysql.jdbc.Driver");
%>
<%
if (request.getParameter("INDIETRO") != null) {
%>
<jsp:forward page="homeCaritas.jsp" />
<%
}

if (request.getParameter("contatta") != null) {
%>
<jsp:forward page="contattaCaritasMap.jsp" />
<%
}
%>

<%
if (request.getParameter("eliminaDonazione") != null) {
	if (GestisciDonazioniBoundary.getInstance().cancellaDonazione(request.getParameter("cod_dona")) == true) {
%>
<jsp:forward page="homeCaritas.jsp" />
<%
}
}
%>
<%
if (request.getParameter("RITIRA DONAZIONE") != null) {
	if (GestisciDonazioniBoundary.getInstance().ritiraDonazione(request.getParameter("ritira")) == true) {
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

<title>GESTISCI DONAZIONI</title>
<link rel="stylesheet" href="../css/gestisciDonazioneCaritas.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<form action="gestisciDonazioniCaritas.jsp" name="my" method="POST">

			<div class="container text-center">
				<h1>Gestisci Donazioni</h1>
			</div>


			<div class="row">
				<div class="col">
					</br>
					<button class="btn  btn-light" type="submit"
						name="RITIRA DONAZIONE" value="RITIRA DONAZIONE">Ritira
						Donazione</button>
					<input type="text" id="ritira" name="ritira"
						placeholder="Inserisci l'ID della donazione da ritirare">
				</div>
			</div>


			<div class="row">
				<div class="col">
					</br>
					<button class="btn btn-light" type="submit" name="eliminaDonazione"
						value="eliminaDonazione">Elimina Donazione</button>

					<input type="text" id="cod_dona" name="cod_dona"
						placeholder="Inserisci l'ID della donazione da eliminare">
				</div>

			</div>

			<div class="indietro">
				<button class="btn btn-warning" type="submit" name="INDIETRO"
					value="INDIETRO">Indietro</button>
			</div>
			<div class="contatta">
				<button style="width: 250px;" class="btn  btn-light" type="submit"
					name="contatta" value="contatta">Contatta Volontario</button>
			</div>

				<div class="content text-center my-2">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID DONAZIONE</th>
							<th scope="col">TIPO</th>
							<th scope="col">DESCRIZIONE</th>
							<th scope="col">INDIRIZZO</th>
							<th scope="col">STATO</th>
						</tr>
					</thead>
					<tbody>


						<%
						List<DonazioneTab> list = GestisciDonazioniBoundary.getInstance().loadFormDonazione();
						int i = 0;
						while (i < list.size()) {
						%>
						<tr>
							<td>
								<%
								out.println(list.get(i).getIdDon());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getTipologia());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getDescrizione());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getIndirizzo());
								%>
							</td>
							<td>
								<%
								out.println(list.get(i).getStato());
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