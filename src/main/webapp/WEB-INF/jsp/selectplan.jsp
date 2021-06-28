<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('host.url')" var="hostUrl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: lightyellow;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: bold;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: green;
	color: blue;
	background-color: pink;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}

<
style type ="text/css">.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: bold;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: lightGreen;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
</style>
<style>
body {
	background-image: url("");
	background-position: 40% 40%;
	background-size: auto;
	background-repeat: repeat;
	font-family: Arial, Helvetica, sans-serif;
}
</style>


<title>All Plan Details</title>
</head>
<body>
	<center>
		<font color="RED" size="5">Available Plans</font>
	</center>

	<c:if test="${!empty JspPlanDetailsList}">
		<table class="tg">
			<tr>
				<th width="40">ID</th>
				<th width="150">INSURANCE TYPE</th>
				<th width="150">PREMIUM NAME</th>
				<th width="150">NO.OF BRANCH</th>
				<th width="200">TOTAL INSURANCE AMOUNT</th>
				<th width="150">TOTAL COVERAGE</th>
				<th width="150">SELECT PLAN</th>
				<th width="80">EDIT</th>
				<th width="80">DELETE</th>
			</tr>
			<c:forEach var="PLANLIST" items="${JspPlanDetailsList}">
				<tr>
					<td>${PLANLIST.id}</td>
					<td>${PLANLIST.insurancetype}</td>
					<td>${PLANLIST.premiumname}</td>
					<td>${PLANLIST.numberofbranch}</td>
					<td>${PLANLIST.totalinsuranceamount}</td>
					<td>${PLANLIST.coverlimit}</td>
					<td><a
						href="/bookplan/${PLANLIST.insurancetype}/${PLANLIST.premiumname}/${PLANLIST.numberofbranch}/${PLANLIST.totalinsuranceamount}/${PLANLIST.coverlimit}">View
							Details</a></td>
					<td><a href="/deleteplan/${PLANLIST.id}"> Delete Plan</a></td>
					<td><a href="/editplan/${PLANLIST.id}"> Edit Plan</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


	<c:if test="${empty JspPlanDetailsList}">
		<br>
		<br>
		<center>
			<h3>Oops.. no insurance plan available</h3>
		</center>
	</c:if>
	</center>

	<br>
	<hr>
	<font color="red">${planRegsiterd}</font>
	<font color="red">${planRegistraionFailed}</font>
	<font color="red">${planDeletionFailed}</font>
	<font color="red">${planDeleted}</font>
	<br>
	<hr>


	<button class="accordion"
		style="background-color: Grey; border-color: Black; color: White">Add
		Insurance Details</button>
	<div class="panel">
		<form class="modal-content" action="/addplan" method="POST">

			<hr>
			<div class="c1">

				<font color=red><p>Enter The Insurance Details</p></font> <label
					for="fname"><b>INSURANCE TYPE</b></label> <input type="text"
					placeholder="Enter Insurance Type" name="insurancetype" required>

				<label for="lname"><b>PREMIUM NAME</b></label> <input type="text"
					placeholder="Enter Premium Name" name="premiumname" required>

				<label for="fage"><b>NO. OF BRANCH</b></label> <input type="text"
					placeholder="Enter No Of Branch" name="numberofbranch" required>

				<hr>

				<div class="c1">
					<label for="mobile"><b>TOTAL INSURANCE AMOUNT</b></label> <input
						type="text" placeholder="Enter Insurance Amount"
						name="totalinsuranceamount" required> <label for="email"><b>TOTAL
							COVERAGE</b></label> <input type="text" placeholder="Enter Coverage Amount"
						name="coverlimit" required>
				</div>
				<hr>
			</div>
			<button>SUBMIT PLAN</button>
	</div>

	</form>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>


</body>
</html>