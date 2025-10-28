<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javaweb.libman.model.BorrowSlip" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thống kê tài liệu chi tiết</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        .info {
            margin-bottom: 25px;
            line-height: 1.6;
        }
        .info strong {
            color: #34495e;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .btn-back {
            display: inline-block;
            background: #95a5a6;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 20px;
        }
        .btn-back:hover {
            background: #7f8c8d;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📚 Thống kê tài liệu chi tiết</h2>

    <div class="info">
        <p><strong>Tên tài liệu:</strong> <%= request.getAttribute("documentName") %></p>
        <p><strong>Ngày bắt đầu: </strong> <%= request.getAttribute("startDate") %> </p>
        <p><strong>Ngày kết thúc: </strong> <%= request.getAttribute("endDate") %> </p>
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
                   style="color: #2980b9; text-decoration: none;">
                <%= b.getId() %>
                </a>
            </td>
            <td><%= b.getReader().getName() %></td>
            <td><%= b.getBorrowDate() != null ? b.getBorrowDate().format(fmt) : "-" %></td>
            <td><%= b.getDueDate() != null ? b.getDueDate().format(fmt) : "-" %></td>
        </tr>
        <%  }} else { %>
        <tr><td colspan="4">Không có dữ liệu mượn.</td></tr>
        <% } %>
    </table>

    <div style="text-align:center;">
        <a href="javascript:history.back()" class="btn-back">⬅ Quay lại</a>
    </div>
</div>
</body>
</html>
