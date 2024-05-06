<%-- 
    Document   : listOfCurrencies
    Created on : May 6, 2024, 10:08:32 PM
    Author     : Norah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Currency List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            header {
                background-color: #333;
                padding: 10px;
                color: #fff;
                text-align: center;
            }

            nav {
                margin-bottom: 20px;
            }

            nav a {
                text-decoration: none;
                color: #333;
                padding: 10px;
                margin-right: 10px;
                border-radius: 5px;
                background-color: #eee;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #333;
                color: #fff;
            }
        </style>
    </head>
    <body>


    <c:set var="result" value="${requestScope.SEARCH_RESULT}" /> <%-- copy setAtt trong SearchLastNameServlet--%>

    <table border="1">
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Description</th>
                <th>Rate</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>

        <c:forEach var="dto" items="${result}" varStatus="counter">

            <tr>

                <td>
                    ${dto.code}
                </td>
                <td>
                    ${dto.name}
                </td>
                <td>
                    ${dto.description}
                </td>
                <td>
                    ${dto.rate}
                </td>
                <td>
                    <form action="MainController" method="POST">                                   
                        <input type="submit" value="Update" name="action" />
                        <input type="hidden" name="code" value="${dto.code}" />
                    </form>
                </td> 

            </tr>

        </c:forEach>


    </tbody>
</table>

<c:if test="${empty result}">
    <h1 style="color: red">No record is matched !!!</h1>
</c:if>
<a href="MainController?action=Search">Back to home page</a>
</body>
</html>
