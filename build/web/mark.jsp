<%-- 
    Document   : mark
    Created on : Mar 19, 2021, 2:27:51 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finished Page</title>
    </head>
    <body>
        <c:import url="header.jsp">

        </c:import>


        <h1>Quiz Online</h1>
        Your Core:
        ${sessionScope.MARK}<br/>
        <a href="choosesubject">  Click here to return Home Page</a>
    </body>
</html>
