<%-- 
    Document   : history
    Created on : Mar 19, 2021, 9:35:09 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h1{
                text-align: center;
                color: red;
             
            }
            .history{
                text-align: center;
            }
            table{
                width: 100%;
            }
            table thead{
                color: red;
            }
        </style>
        <title>History Page</title>
    </head>
    <body>

        <c:import url="header.jsp">

        </c:import>
        <h1>History Page</h1>
        <div class="history">
            <a href="choosesubject">Click here to return Home page</a>

            <form action="searchhistory">
                Choose subject: 
                <select name="cbosubid">
                    <c:forEach var="dto" items="${sessionScope.SUBLIST}">
                        <c:if test="${dto.getSubjectID() eq param.cbosubid}">
                            <option selected="selected" value="${dto.getSubjectID()}"> ${dto.getSubjectID()} </option>
                        </c:if>
                        <c:if test="${dto.getSubjectID() ne param.cbosubid}">
                            <option  value="${dto.getSubjectID()}"> ${dto.getSubjectID()} </option>
                        </c:if>

                    </c:forEach>
                </select>


                <input type="submit" value="Search" name="btAction"/> <br/>
            </form>
            <c:set var="searchValue" value="${param.cbosubid}"/>


            <c:if test="${not empty searchValue}">
                <c:set var="result" value="${sessionScope.SEARCHHISTORYLIST}"/>
                <c:if test="${not empty result}">
                    <table style="text-align: center"  border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Subject</th>
                                <th>Mark</th>


                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${result}" varStatus="counter">

                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${dto.getSubjectID()}</td>
                                    <td>${dto.getMark()}</td>


                                </tr>

                            </c:forEach>

                        </tbody>
                    </table>

                </c:if>
                <c:if test="${empty result}">
                    <h2>no record is matched!!! 
                    </h2>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
