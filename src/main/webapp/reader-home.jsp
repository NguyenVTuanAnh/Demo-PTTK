<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <style>
        /* --- Tổng thể trang --- */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* --- Khung chính --- */
        .container {
            width: 450px;
            margin: 100px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
            transition: 0.3s;
        }

        .container:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        /* --- Tiêu đề --- */
        h2 {
            color: black;
            margin-bottom: 40px;
            font-size: 26px;
        }

        /* --- Nhóm nút --- */
        .button-group {
            display: flex;
            justify-content: center;
            gap: 25px;
        }

        /* --- Nút --- */
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s;
            color: white;
        }

        .btn-search {
            background-color: black;
        }

        .btn-register {
            background-color: black;
        }

        .btn-search:hover {
            background-color: green;
        }

        .btn-register:hover {
            background-color: green;
        }

        /* --- Dòng chữ nhỏ cuối trang --- */
        .footer {
            margin-top: 30px;
            font-size: 13px;
            color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Trang chủ</h2>

    <div class="button-group">
        <form action="search.jsp" method="get">
            <button type="submit" class="btn btn-search">Tìm kiếm tài liệu</button>
        </form>
        <form action="card-registration" method="get">
            <button type="submit" class="btn btn-register">Đăng ký thẻ bạn đọc</button>
        </form>
    </div>
    
</div>
</body>
</html>
