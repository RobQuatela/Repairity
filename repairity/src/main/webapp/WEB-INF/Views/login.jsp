<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/Views/header.jsp" %>
	
	<div class="container">
		<div class="col-6 offset-3 align-self-center">
			<div class="card">
				<div class="card-header bg-info text-white">
					Existing Users: Login
				</div>
				
				<div class="card-body">
					<form role="form" method="post" action="<c:url value='/authenticate' />">
						<div class="form-group">
							<label for="Username">Username: </label>
							<input type="text" class="form-control"
							placeholder="Enter Username" name="username" />
						</div>
						
						<div class="form-group">
							<label for="Password">Password: </label>
							<input type="password" class="form-control"
							placeholder="Password" name="password" />
						</div>
						
<%-- 						<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" /> --%>
						
						<input type="submit" value="Login" name="submit"
							class="btn btn-primary" />
					</form>
					
					<div class="row">
						<div class="col-12">
							<c:if test="${not empty error }">
								<p class="alert-danger">${error }</p>
							</c:if>
							<c:if test="${not empty msg }">
								<p class="alert-warning">${msg }</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/Views/footer.jsp" %>

</body>
</html>