<%-- 
    Document   : header
    Created on : Jan 17, 2021, 9:01:44 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                background-repeat: no-repeat;
                background-size: 100%;
                background-image: url(https://previews.123rf.com/images/artursz/artursz1908/artursz190808379/128686836-text-sign-showing-online-quiz-business-photo-showcasing-game-or-a-mind-sport-that-are-published-on-t.jpg);
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>        
        <c:if test="${sessionScope.FULLNAME ne null}">
            <font color="red">Welcome, ${sessionScope.FULLNAME}</font>
            <form action="logout">
                <input type="submit" name="btAction" value="Logout" />
            </form>
        </c:if>
        <c:if test="${sessionScope.FULLNAME eq null}">
            <c:url var="url" value="DispatcherServlet">
                <c:param name="btAction" value="Login Now"></c:param>
            </c:url>
            <a href="${url}">Login</a>
        </c:if>
    
    </body>
</html>
