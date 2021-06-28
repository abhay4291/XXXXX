<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%><%@ page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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


<title>SELECTED PLAN</title>
</head>
<body>

	<center>
		<font color=red><h4>YOUR SELECTED PLAN</h4></font>
	</center>

	<br>
	<br>

	<table class="tg">
		<tr>
			<th width="200">INSURANCE TYPE</th>
			<th width="200">PREMIUM NAME</th>
			<th width="200">NUMBER OF BRANCH</th>
			<th width="200">TOTAL INSURANCE AMOUNT</th>
			<th width="200">EMI PER MONTH</th>
			<th width="200">COVER LIMITS</th>
		</tr>

		<tr>
			<td>${InsuranceType}</td>
			<td>${PremiumName}</td>
			<td>${NumberOfBranch}</td>
			<td>${TotalInsuranceAmount}</td>
			<td>${EMIInsuranceAmount}</td>
			<td>${CoverLimit}</td>
		</tr>
	</table>

	<br>
	<br>

	<button class="accordion"
		style="background-color: Grey; border-color: Black; color: White">Add
		Persons</button>
	<div class="panel">
		<form class="modal-content"
			action="http://${hostUrl}/SpringMvc_Hibernate_Add_Edit_Delete_example_4/passenger/${FlightName}/${FlightArrival}/${FlightDeparture}/${FlightPrice}"
			method="POST">

			<hr>
			<div class="c1">

				<font color=red><p>Person Details For Buying Plan</p></font> <label
					for="fname"><b>First Name</b></label> <input type="text"
					placeholder="Enter FIRST NAME" name="P_Fname" required> <label
					for="lname"><b>Last Name</b></label> <input type="text"
					placeholder="Enter Last Name" name="P_Lname" required> <label
					for="fage"><b>Age</b></label> <input type="text"
					placeholder="Enter Age" name="P_Age" required>
				<tr>
					<label for="lname"><b>MALE</b></label>
					<input type="radio" name="MALE" required>
					<label for="lname"><b>FEMALE</b></label>
					<input type="radio" name="FEMALE" required>
				<tr>
			</div>
			<hr>


			<div class="c1">
				<font color=red><p>Contact Information</p></font> <label
					for="mobile"><b>Mobile No</b></label> <input type="text"
					placeholder="Enter Mobile No" name="P_MobileNo" required> <label
					for="email"><b>Email</b></label> <input type="text"
					placeholder="Enter Email" name="P_Email" required>
			</div>
			<hr>
			<br> <br>

			<button>CONTINUE</button>

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