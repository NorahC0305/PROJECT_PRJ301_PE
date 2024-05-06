<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <title>Currency Exchange</title>
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
        <header>
            <h1>Currency Exchange Rates</h1>
        </header>

        <nav>
            <a href="MainController?action=Get items">Currency list</a>
            <a href="#">${sessionScope.USERINFO.name}</a>
            <a href="MainController?action=Log out">Log out</a>
        </nav>

        <form action="MainController" method="POST" id="searchForm">
            <label for="code">Code:</label>
            <input type="text" id="code" name="code" value=${param.code}>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${param.name}">

            <input type="submit" value="Search" name="action" >
        </form>

        <c:set var="result" value="${requestScope.SEARCH_RESULT}" /> <%-- copy setAtt trong SearchLastNameServlet--%>

        <table border="1">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Rate</th>
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


                    </tr>

                </c:forEach>


            </tbody>
        </table>


        <c:if test="${empty result}">
            <h1 style="color: red">No record is matched !!!</h1>
        </c:if>

    </body>

</html>