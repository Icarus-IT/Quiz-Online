<%-- 
    Document   : search
    Created on : Mar 13, 2021, 4:28:21 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Online Page</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
            <h1>QUIZ MANAGEMENT</h1> 
            <br/>

            <form action="search">
                <p>Search Value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" /></p> <br/>


            Subject ID: <select name="cbosubjectID">
                <option  value="all">All </option>
                <c:forEach var="dto" items="${sessionScope.SUBLIST}">
                    <c:if test="${dto.getSubjectID() eq param.cbosubjectID}">
                        <option selected="selected" value="${dto.getSubjectID()}"> ${dto.getSubjectID()} </option>
                    </c:if>

                    <c:if test="${dto.getSubjectID() ne param.cbosubjectID}">
                        <option  value="${dto.getSubjectID()}"> ${dto.getSubjectID()} </option>
                    </c:if>


                </c:forEach>

            </select> <br/>


            Status  <select name="cbostatus">
                <c:if test="${'all' eq param.cbostatus}">
                    <option selected="selected" value="all">All</option>
                </c:if>
                <c:if test="${'all' ne param.cbostatus}">
                    <option  value="all">All</option>
                </c:if>

                <c:if test="${'true' eq param.cbostatus}">
                    <option selected="selected"  value="true">true</option>
                </c:if>
                <c:if test="${'true' ne param.cbostatus}">
                    <option  value="true">true</option>
                </c:if>

                <c:if test="${'false' eq param.cbostatus}">
                    <option selected="selected"  value="false">false</option>
                </c:if>
                <c:if test="${'false' ne param.cbostatus}">
                    <option  value="false">false</option>
                </c:if>



            </select> <br/>







            <input type="submit" value="Search" name="btAction" /><br/>


        </form> <br/>

        <c:set var="searchValue" value="${param.txtSearchValue}"/>

        <c:set var="result" value="${requestScope.SEARCHRESULT}"/>

        <c:if test="${not empty result}">
            <table border="1" style="width: 100%">
                <thead>
                    <tr>
                        <th>ID.</th>
                        <th>Question Content</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>Correct Answer</th>
                        <th>Date create</th>
                        <th>Subject</th>

                        <th>status</th>
                        <th>Delete</th>
                        <th>Update</th>



                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}" >
                    <form action="update">
                        <tr>

                            <td>${dto.id}</td>
                        <input type="hidden" name="id" value="${dto.id}" /> 
                        <td><input type="text" name="question_content" value="${dto.questioncontent}" /> </td>
                        <td><input type="text" name="a" value="${dto.a}" /> </td>
                        <td><input type="text" name="b" value="${dto.b}" /> </td>
                        <td><input type="text" name="c" value="${dto.c}" /> </td>
                        <td><input type="text" name="d" value="${dto.d}" /> </td>
                        <td><input type="text" name="answer_correct" value="${dto.answer_correct}" /> </td>
                        <td><input type="text" name="date" value="${dto.date}" /> </td>
                        <td><input type="text" name="subjectID" value="${dto.subjectID}" /> </td>
                        <td>
                            <input type="text" name="status" value=" ${dto.status}" />
                        </td>



                        <c:if test="${sessionScope.ISADMIN}">

                            <td>

                                <input type="hidden" name="lastSearchValue" value="${param.txtSearchValue}" />
                                <input type="hidden" name="lastcbosubjectID" value="${param.cbosubjectID}" />
                                <input type="hidden" name="lastcbostatus" value="${param.cbostatus}" />

                                <input type="submit" value="Update" name="btAction"  />




                            </td>

                            <td>



                                <c:url var="urlRewriting" value="delete">

                                    <c:param name="pk" value="${dto.id}"/>
                                    <c:param name="lastSearchValue" value="${param.txtSearchValue}"/>                                        
                                    <c:param name="lastcbostatus" value="${param.cbostatus}"/>                                        
                                    <c:param name="lastcbosubjectID" value="${param.cbosubjectID}"/>                                        
                                </c:url>

                                <a href="${urlRewriting}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>



                            </td>

                        </c:if>


                        </tr>
                    </form>
                </c:forEach>

            </tbody>
        </table>


        <form action="DispatcherServlet">
            <c:if test="${requestScope.PAGE ne 1}">
                <input type="submit" value="BACK" name="btAction" /> 
            </c:if>


            <input type="text" name="txtPage" value="${requestScope.PAGE}" readonly="readonly" />
            <c:if test="${requestScope.PAGE ne requestScope.PAGESIZE}">
                <input type="submit" value="NEXT" name="btAction" />   
            </c:if>

            <input type="hidden" name="txtSearchValue" value="${searchValue}" />
            <input type="hidden" name="cboCategory" value="${param.cboCategory}" />
            <input type="hidden" name="txtPricemin" value="${param.txtPricemin}" />
            <input type="hidden" name="txtPricemax" value="${param.txtPricemax}" />
        </form>

    </c:if>
    <form action="addQ">
        <input type="submit" value="Add Quiz" name="btAction" />
    </form>
    <c:if test="${param.cboCategory != null}">
        <c:if test="${empty result}">
            <h2>no record is matched!!! 
            </h2>
        </c:if>

    </c:if>  


</body>
</html>
