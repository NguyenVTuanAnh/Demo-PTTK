<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javaweb.libman.model.BorrowSlip" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thống kê tài liệu chi tiết</title>
    <style>
        /* --- Toàn trang --- */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(to right, #f0f4f8, #e3f2fd);
            overflow-x: hidden;
        }

        /* --- Khung chính full màn hình --- */
        .container {
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: white;
            padding: 40px 5%;
            box-sizing: border-box;
            overflow-y: auto; /* Cuộn dọc khi bảng dài */
        }

        h2 {
            text-align: center;
            color: black;
            margin-bottom: 30px;
        }

        /* --- Thông tin chi tiết tài liệu --- */
        .info {
            margin-bottom: 25px;
            line-height: 1.6;
            width: 100%;
            max-width: 900px;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-sizing: border-box;
        }

        .info strong {
            color: black;
        }

        /* --- Bảng thống kê --- */
        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            background: #fff;
            table-layout: fixed;
            word-wrap: break-word;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: black;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* --- Nút quay lại --- */
        .btn-back {
            display: inline-block;
            background: black;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 25px;
            transition: 0.3s;
        }

        .btn-back:hover {
            background: white;
            color: black;
            border: 1px solid black;
        }

        /* --- Căn giữa nút --- */
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        /* --- Responsive nhỏ gọn hơn trên màn hình nhỏ --- */
        @media (max-width: 768px) {
            .container {
                padding: 20px 3%;
            }

            table, th, td {
                font-size: 13px;
            }

            .info {
                padding: 15px;
                font-size: 14px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Thống kê tài liệu chi tiết</h2>

    <div class="info">
        <p><strong>Tên tài liệu:</strong> <%= request.getAttribute("documentName") %></p>
        <p><strong>Ngày bắt đầu:</strong> <%= request.getAttribute("startDate") %></p>
        <p><strong>Ngày kết thúc:</strong> <%= request.getAttribute("endDate") %></p>
        <p><strong>Tổng số lần mượn:</strong> <%= request.getAttribute("totalLoans") %></p>
    </div>

    <table>
        <tr>
            <th>STT</th>
            <th>Mã phiếu mượn</th>
            <th>Tên bạn đọc</th>
            <th>Ngày mượn</th>
            <th>Ngày hẹn trả</th>
        </tr>
        <%
            List<BorrowSlip> list = (List<BorrowSlip>) request.getAttribute("borrowSlipList");
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            if (list != null && !list.isEmpty()) {
                int i = 1;
                for (BorrowSlip b : list) {
        %>
        <tr>
            <td><%= i++ %></td>
            <td>
                <a href="borrow-slip?borrowSlipId=<%= b.getId() %>"
                   style="color: red; text-decoration: none;">
                    <%= b.getId() %>
                </a>
            </td>
            <td><%= b.getReader().getName() %></td>
            <td><%= b.getBorrowDate() != null ? b.getBorrowDate().format(fmt) : "-" %></td>
            <td><%= b.getDueDate() != null ? b.getDueDate().format(fmt) : "-" %></td>
        </tr>
        <%  }} else { %>
        <tr><td colspan="5">Không có dữ liệu mượn.</td></tr>
        <% } %>
    </table>

    <div class="btn-container">
        <a href="javascript:history.back()" class="btn-back">⬅ Quay lại</a>
    </div>
</div>
</body>
</html>
