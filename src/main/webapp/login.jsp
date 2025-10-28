<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        /* --- Toàn trang --- */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(to right, #e3f2fd, #bbdefb);
            margin: 0;
            padding: 0;
        }

        /* --- Khung chính --- */
        .container {
            width: 400px;
            margin: 100px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
        }

        h2 {
            color: #1565c0;
            margin-bottom: 25px;
        }

        /* --- Nhãn và ô nhập --- */
        label {
            display: block;
            text-align: left;
            font-weight: bold;
            color: #0d47a1;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 18px;
            border: 1px solid #90caf9;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #42a5f5;
            box-shadow: 0 0 5px rgba(33, 150, 243, 0.4);
        }

        /* --- Nút đăng nhập --- */
        button {
            background-color: #42a5f5;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1e88e5;
        }

        /* --- Thông báo lỗi --- */
        .error {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }

        /* --- Hiệu ứng hover toàn khung --- */
        .container:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            transition: 0.3s;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Đăng nhập hệ thống</h2>

    <form action="login" method="post">
        <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Đăng nhập</button>
    </form>

    <% if (request.getAttribute("errorMessage") != null) { %>
    <p class="error"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
</div>
</body>
</html>
