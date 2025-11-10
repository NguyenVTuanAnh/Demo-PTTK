<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký thẻ bạn đọc</title>
    <style>
        /* --- Toàn bộ trang --- */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* --- Khung chính --- */
        .container {
            width: 550px;
            margin: 80px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
        }

        h1 {
            color: black;
            margin-bottom: 25px;
        }

        /* --- Bảng thông tin --- */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            width: 40%;
        }

        input[type="text"],
        input[type="date"],
        input[type="email"] {
            width: 95%;
            padding: 6px;
            border: 3px solid black;
            border-radius: 6px;
        }

        /* --- Nút đăng ký --- */
        button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            transition: 0.3s;
        }

        button:hover {
            background-color: green;
        }

        /* --- Hiệu ứng hover nhẹ --- */
        .container:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            transition: 0.3s;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Đăng ký thẻ bạn đọc</h1>

    <form action="card-registration" method="post">
        <table>
            <tr>
                <th>Tên bạn đọc:</th>
                <td><input type="text" name="name" value="${reader.name}" required disabled></td>
            </tr>
            <tr>
                <th>Ngày sinh:</th>
                <td><input type="date" name="birth" value="${reader.birth}" required disabled></td>
            </tr>
            <tr>
                <th>Giới tính:</th>
                <td>
                    <input type="radio" name="gender" value="nam" ${reader.gender == 'nam' ? 'checked' : ''} disabled> Nam
                    <input type="radio" name="gender" value="nu" ${reader.gender == 'nu' ? 'checked' : ''} disabled> Nữ
                </td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td><input type="text" name="phone" value="${reader.phone}" required disabled></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="email" name="email" value="${reader.email}" required disabled></td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td><input type="text" name="address" value="${reader.address}" disabled></td>
            </tr>
            <tr>
                <th>Địa chỉ làm việc:</th>
                <td><input type="text" name="workAddress" value="${reader.companyAddress}" disabled></td>
            </tr>

            <tr>
                <th>Hiệu lực:</th>
                <td>
                    <input type="radio" name="expiry" value="3" > 3 Tháng
                    <input type="radio" name="expiry" value="6" > 6 Tháng
                    <input type="radio" name="expiry" value="12" > 12 Tháng
                </td>
            </tr>
        </table>
        <button type="submit">Đăng ký</button>
    </form>
</div>
</body>





</html>
