<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('host.url')" var="hostUrl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<style>
body {
	background-image: url("");
	background-position: 40% 70%;
	background-size: auto;
	background-repeat: repeat;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Plan Details</title>
</head>
<body>
	<center>
		<font color="RED" size="5">Edit Plans</font>
	</center>
	<center>
		<c:if test="${!empty insplanbyId}">
			<table class="tg">
				<tr>
					<th width="40">ID</th>
					<th width="150">INSURANCE TYPE</th>
					<th width="150">PREMIUM NAME</th>
					<th width="150">NO.OF BRANCH</th>
					<th width="200">TOTAL INSURANCE AMOUNT</th>
					<th width="150">TOTAL COVERAGE</th>
				</tr>
				<tr>
					<td>${insplanbyId.id}</td>
					<td>${insplanbyId.insurancetype}</td>
					<td>${insplanbyId.premiumname}</td>
					<td>${insplanbyId.numberofbranch}</td>
					<td>${insplanbyId.totalinsuranceamount}</td>
					<td>${insplanbyId.coverlimit}</td>
				</tr>
			</table>
		</c:if>
	</center>

	<br>
	<br>

	<form:form action="/editplanupdate/" class="modal-content"
		method="POST" modelAttribute="insplanbyId">


		<table>
			<c:if test="${!empty insurancetype}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<!-- just to pass id to controller -->
			<input type="hidden" id="thisField" name="inputName"
				value="${insplanbyId.id}">

			<tr>
				<td><form:label path="insurancetype">
						<spring:message text="INSURANCE TYPE" />
					</form:label></td>
				<td><form:input path="insurancetype" /></td>
			</tr>

			<tr>
				<td><form:label path="premiumname">
						<spring:message text="PREMIUM NAME" />
					</form:label></td>
				<td><form:input path="premiumname" /></td>
			</tr>
			<tr>
				<td><form:label path="numberofbranch">
						<spring:message text="NO.OF BRANCH" />
					</form:label></td>
				<td><form:input path="numberofbranch" /></td>
			</tr>
			<tr>
				<td><form:label path="totalinsuranceamount">
						<spring:message text="TOTAL INSURANCE AMOUNT" />
					</form:label></td>
				<td><form:input path="totalinsuranceamount" /></td>
			</tr>
			<tr>
				<td><form:label path="coverlimit">
						<spring:message text="TTOTAL COVERAGE" />
					</form:label></td>
				<td><form:input path="coverlimit" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message text="Add Plan"/>" /></td>
			</tr>
		</table>

		<%
			request.setAttribute("value", 1);
		%>


	</form:form>

</body>
</html>