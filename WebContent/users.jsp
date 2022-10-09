<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management System</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<div class="social">
		<a href="+918085426718"><img src="images/Dialer.jfif"
			height="21px"></a> <a
			href="https://www.instagram.com/saijan.arpit/" target="blank"><img
			src="images/insta.jfif" height="21px"></a> <a
			href="https://www.linkedin.com/in/arpit-mishra-201a331b9/"
			target="blank"><img src="images/Linkedin.jfif" height="21px"></a>
	</div>
	<div class="navigation" align="center">
		<ul class="nav">
			<li><a href="#">Home</a></li>
			<li><a href="#">About Me</a></li>
			<li><a href="#">Contact Me</a></li>
		</ul>
	</div>
	<header>
		<a href="#"><img class="profile" src="images/ProfilePic.jpg"
			alt="Arpit Mishra"></a>
	</header>
	<h2 align="center">User Management System</h2>
	<c:url value="/addUser" var="addUserURL"></c:url>  <%-- to store addUser page address --%>
    <c:url value="/editUser" var="editURL"></c:url>    <%-- to store editUser page address --%>
    <c:url value="/deleteUser" var="deleteURL"></c:url> <%--Delete User URL --%>
	<div class="container">
		<div class="main" align="center">
        
        
        
        <%-- User Add request --%>
			<c:if test="${requestScope.error ne null}">
				<strong style="color:red;"> 
				<c:out value="${requestScope.error}">
					</c:out>
				</strong>
			</c:if>
        
<c:if test="${requestScope.success ne null}">
				<strong style="color:green;"> 
				<c:out value="${requestScope.success}">
					</c:out>
				</strong>
			</c:if>
			
			<form  action='<c:out value="${addUserURL}"></c:out>' method="post">
				Name:<input type="text" name="name"><br> Email Id:<input
					type="text" name="email"><br> password:<input
					type="password" name="password"><br> <input
					type="submit" value="Add User">
			</form>
			
			
			
			<%-- Edit Request --%>
    <c:if test="${requestScope.user ne null}">
        <form  action='<c:out value="${editURL}"></c:out>' method="post">
            ID: <input type="text" value="${requestScope.user.id}"
                readonly="readonly" name="id"><br> 
            Name: <input type="text" value="${requestScope.user.name}" name="name"><br>
            Email Id: <input type="text" value="${requestScope.user.email}" name="email"><br>  
            Password: <input type="password" value="${requestScope.user.password}" name="password"><br>               
            <input type="submit" value="Edit User">
        </form>
    </c:if>
    
    
		
    
    
    
			<%-- Users Table --%>
			<c:if test="${not empty requestScope.users}">
        <table>
        <caption>Registered Users Details </caption>
            <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email Id</th>
                    <th>Password</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${requestScope.users}" var="user">
                    <c:url value="/editUser" var="editURL">
                        <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <c:url value="/deleteUser" var="deleteURL">
                        <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <tr>
                        <td><c:out value="${user.id}"></c:out></td>
                        <td><c:out value="${user.name}"></c:out></td>
                        <td><c:out value="${user.email}"></c:out></td>
                        <td><c:out  value="*********"></c:out></td>
                        <td><a
                            href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
                        <td><a
                            href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
		</div>
	</div>
</body>
</html>