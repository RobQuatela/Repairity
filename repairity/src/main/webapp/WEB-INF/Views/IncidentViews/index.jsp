<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Repairity</title>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/Views/header.jsp" %>
		
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="jumbotron">
					<h1 class="display-4">Welcome to Repairity</h1>
					<p class="lead">
					All of your incidents in one spot
					</p>
					
					<a href="user/new" class="btn btn-lg btn-success">New User?</a>
					<p><br />Existing Users: <a href="/user/login">Login</a></p>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
				<div class="card" style="height: 200px">
					<div class="card-header">Online</div>
					<img src="<spring:url value='/resource/images/stay-online.png' />"
						class="card-img-top" alt="Online" />
					<div class="card-body">
						<p class="card-text">200+ Incidents via NetRepair</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/Views/footer.jsp" %>
	</div>
</body>
</html>