<%-- 
    Document   : login
    Created on : Mar 5, 2021, 2:35:18 PM
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
            .middle{
               
                text-align: center;
            }
            h1{
                color: red;
                margin-top: 11%;
            }

        </style>
        <title>Login Page</title>
    </head>
    <body>
        <div class="middle">
            <h1>Login Page</h1>
            <form action="login" method="POST"> 
                <c:set var="invalid" value="${requestScope.INVALID}"/>
                username: <input type="text" name="txtUsername" value="" /> <br/>

                password: <input type="password" name="txtPassword" value="" /> <br/>

                <c:if test="${not empty invalid}">
                    <font color ="red">
                    ${invalid}

                    </font>
                    <br/>

                </c:if>


                <input type="submit" value="Login" name="btAction" />
                <input type="reset" value="reset" />
            </form>
            <a href="createuser">Click here to create account to take quiz</a>
        </div>


    </body>
</html>
