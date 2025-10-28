<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Create Reader</title>
    <style>
        :root{
            --bg1: #e3f2fd;
            --bg2: #bbdefb;
            --primary: #5563DE;
            --primary-600: #3848c6;
            --accent: #42a5f5;
            --card-bg: #ffffff;
            --muted: #666;
        }

        *{box-sizing: border-box;}
        body {
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background: linear-gradient(135deg, var(--bg1), var(--bg2));
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }

        .container {
            width: 100%;
            max-width: 720px;
            background: var(--card-bg);
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(20,30,60,0.12);
            padding: 28px;
            transition: transform .18s ease, box-shadow .18s ease;
        }
        .container:hover{
            transform: translateY(-4px);
            box-shadow: 0 18px 40px rgba(20,30,60,0.14);
        }

        .header {
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:12px;
            margin-bottom: 18px;
        }
        .title {
            font-size: 22px;
            color: var(--primary);
            margin: 0;
            font-weight: 700;
        }
        .subtitle {
            color: var(--muted);
            font-size: 13px;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px 18px;
            align-items: start;
        }

        /* full-width row */
        .full {
            grid-column: 1 / -1;
        }

        label {
            display:block;
            font-size: 13px;
            color: #284b8a;
            margin-bottom: 6px;
            font-weight: 600;
        }

        .field {
            display:flex;
            flex-direction:column;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #d7e6ff;
            font-size: 14px;
            color: #222;
            background: #fbfdff;
            transition: box-shadow .14s ease, border-color .14s ease;
        }
        input:focus{
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 4px 14px rgba(66,165,245,0.18);
        }

        .actions {
            display:flex;
            gap:12px;
            justify-content:flex-end;
            align-items:center;
            margin-top:6px;
            grid-column: 1 / -1;
        }

        .btn {
            padding: 10px 16px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-weight: 700;
            font-size: 14px;
        }
        .btn-submit {
            background: linear-gradient(180deg, var(--primary), var(--primary-600));
            color: #fff;
            box-shadow: 0 8px 20px rgba(85,99,222,0.14);
        }
        .btn-cancel {
            background: transparent;
            color: var(--muted);
            border: 1px solid #e6f0ff;
        }

        .message {
            margin-top: 10px;
            grid-column: 1 / -1;
            font-size: 14px;
            color: green;
            font-weight: 600;
        }

        /* responsive */
        @media (max-width: 640px) {
            form { grid-template-columns: 1fr; }
            .actions { justify-content: stretch; flex-direction: column-reverse; }
            .btn { width: 100%; }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div>
            <h1 class="title">Tạo mới Bạn đọc</h1>
            <div class="subtitle">Điền thông tin cơ bản để tạo tài khoản và thẻ bạn đọc</div>
        </div>
    </div>

    <form action="create-reader" method="post">
        <div class="field full">
            <label for="name">Họ và tên</label>
            <input type="text" id="name" name="name" placeholder="Nguyễn Văn A" required>
        </div>

        <div class="field">
            <label for="birth">Ngày sinh</label>
            <input type="date" id="birth" name="birth" required>
        </div>

        <div class="field">
            <label for="gender">Giới tính</label>
            <input type="text" id="gender" name="gender" placeholder="Nam / Nữ / Khác" required>
        </div>

        <div class="field">
            <label for="phone">Số điện thoại</label>
            <input type="text" id="phone" name="phone" placeholder="0987xxxxxx">
        </div>

        <div class="field">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="you@example.com">
        </div>

        <div class="field full">
            <label for="address">Địa chỉ</label>
            <input type="text" id="address" name="address" placeholder="Địa chỉ hiện tại">
        </div>

        <div class="field full">
            <label for="companyAddress">Địa chỉ làm việc</label>
            <input type="text" id="companyAddress" name="companyAddress" placeholder="Công ty / Trường học">
        </div>

        <div class="field">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" placeholder="username" required>
        </div>

        <div class="field">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
        </div>

        <div class="actions">
            <button type="button" class="btn btn-cancel" onclick="window.location='home.jsp'">Hủy</button>
            <button type="submit" class="btn btn-submit">Tạo bạn đọc</button>
        </div>

        <div class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>
    </form>
</div>
</body>
</html>
