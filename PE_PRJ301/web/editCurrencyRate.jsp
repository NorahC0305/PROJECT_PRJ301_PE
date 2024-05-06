<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Currency Rate</title>
        <style>

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
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            form {
                max-width: 400px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-bottom: 8px;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 16px;
                box-sizing: border-box;
            }

            button {
                background-color: #333;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>

    <body>


        <header>
            <h1>Currency Exchange Rates</h1>
        </header>


        <nav>
            <a href="#">Currency List</a>
            <a href="#">${sessionScope.USERINFO.name}</a>
            <a href="MainController?action=Log out">Logout</a>
        </nav>

        <h2>Update Currency Rate</h2>

        <form id="updateCurrencyForm" action="MainController" method="POST">
            <label for="code">Code:</label>
            <input type="text" id="code" name="code" readonly="readonly" value="${param.code}">

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>

            <label for="rate">Rate:</label>
            <input type="number" id="rate" name="rate" step="0.01" required>

            <input type="submit" value="Update Rate" onclick="updateCurrency()" name="action">
        </form>


        <!--    <script>
                function updateCurrency() {
                    // Add your logic here to handle the form submission
                    // You can use JavaScript to send the form data to a server for processing
                    // For this example, we're keeping it simple with just the form structure
                    alert("Currency rate updated successfully!");
                }
            </script>-->
    </body>

</html>