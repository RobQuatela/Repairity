<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <h1>Input Form</h1>
        <form:form action="addUser" method="post" modelAttribute="user">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <form:input path="id" /> <br />
                        <form:errors path="id" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <form:input path="name" /> <br />
                        <form:errors path="name" cssClass="error" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit">Submit</button></td>
                </tr>
            </table>
        </form:form>

</body>
</html>