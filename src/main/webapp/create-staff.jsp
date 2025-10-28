<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Staff</title>
</head>
<body>
<h2>Create New Staff</h2>

<form action="create-staff" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Birth (yyyy-MM-dd):</label><br>
    <input type="date" name="birth" required><br><br>

    <label>Gender:</label><br>
    <input type="text" name="gender" required><br><br>

    <label>Phone:</label><br>
    <input type="text" name="phone"><br><br>

    <label>Email:</label><br>
    <input type="email" name="email"><br><br>

    <label>Address:</label><br>
    <input type="text" name="address"><br><br>

    <label>Company Address:</label><br>
    <input type="text" name="companyAddress"><br><br>

    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Create</button>
</form>

<p style="color: green;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>

</body>
</html>
