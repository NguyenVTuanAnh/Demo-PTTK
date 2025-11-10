<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome to Library</title>
  <style>
    /* --- Tổng thể trang --- */
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      /*background: linear-gradient(to right, #e3f2fd, #bbdefb);*/
      margin: 0;
      padding: 0;
    }

    /* --- Khung chính --- */
    .container {
      width: 480px;
      margin: 120px auto;
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
    h1 {
      color: black;
      margin-bottom: 15px;
    }

    h2 {
      color: red;
      margin-bottom: 30px;
    }

    /* --- Nút --- */
    button {
      padding: 12px 25px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      background-color: black;
      color: white;
      cursor: pointer;
      transition: 0.2s;
    }

    button:hover {
      background-color: green;
      color: black;
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
  <h1>Hệ Thống Quản Lý Thư Viện</h1>

  <%
    String username = (String) session.getAttribute("username");
    if (username != null) {
  %>
  <h2>Chào mừng, <%= username %>!</h2>
  <%
  } else {
  %>
  <h2>Bạn chưa đăng nhập!</h2>
  <%
    }
  %>

  <form action="login" method="get">
    <button type="submit">Đăng nhập</button>
  </form>

</div>
</body>
</html>
