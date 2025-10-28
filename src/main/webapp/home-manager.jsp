<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Lý Thư Viện</title>
    <style>
        /* --- Toàn bộ trang --- */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(to right, #e3f2fd, #bbdefb);
            margin: 0;
            padding: 0;
        }

        /* --- Khung chính --- */
        .container {
            width: 600px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
        }

        h1 {
            color: #1565c0;
            margin-bottom: 10px;
        }

        h2 {
            color: #0d47a1;
            margin-bottom: 25px;
        }

        /* --- Các nút menu --- */
        .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-top: 30px;
        }

        button {
            background-color: #42a5f5;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: 0.3s;
        }

        button:hover {
            background-color: #1e88e5;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        /* --- Nút đăng nhập --- */
        .top-btn {
            margin-top: 15px;
            background-color: #64b5f6;
            width: 200px;
        }

        .top-btn:hover {
            background-color: #2196f3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Trang chủ quản lý</h1>

    <!-- MENU QUẢN LÝ -->
    <div class="menu">
        <form action="reader-report" method="get">
            <button type="submit">Thống kê bạn đọc</button>
        </form>

        <form action="document-report" method="get">
            <button type="submit">Thống kê tài liệu</button>
        </form>

        <form action="supplier-report" method="get">
            <button type="submit">Thống kê nhà cung cấp</button>
        </form>
    </div>
</div>
</body>
</html>
