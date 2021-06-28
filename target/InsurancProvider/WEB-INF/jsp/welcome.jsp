<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('host.url')" var="hostUrl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details</title>
<style>
body {
	background-image: url("");
	background-position: 70% 30%;
	background-size: auto;
	background-repeat: repeat;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
	<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #FF33A2;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #FF33A2;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.fname {
	float: right;
	color: grey;
}

@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>

	<h2>Enter Details</h2>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form action="http://${hostUrl}/customerdetails" method="post">

					<div class="row">
						<div class="col-50">

							<label for="fname"><i class="Pay_User"></i>Name</label> <input
								type="text" id="fname" name="name"
								placeholder="Enter Your name here"> <label for="age"><i
								class="Pay_Age"></i> Age</label> <input type="text" id="age" name="age"
								placeholder="Enter your age"> <label for="email"><i
								class="Pay_Email"></i> Email</label> <input type="text" id="email"
								name="email" placeholder="Enter your mail id"> <label
								for="phone"><i class="Pay_Phone"></i>PhoneNumber</label> <input
								type="text" id="phone" name="phonenumber"
								placeholder="Enter phone number"> <label for="city"><i
								class="P_City"></i> City</label> <input type="text" id="cityname"
								name="cityname" placeholder="Enter your city">

							<div class="row">
								<div class="col-50">
									<label for="state">State</label> <input type="text" id="state"
										name="state" placeholder="Enter Your state">
								</div>
							</div>
							</label> <input type="submit" value="Get Plan" class="btn">
						</div>
						<div class="col-50"></div>
					</div>
				</form>
</body>
</html>