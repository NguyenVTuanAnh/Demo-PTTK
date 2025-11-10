<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javaweb.libman.model.DocumentReport" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê tài liệu</title>
    <style>
        /* --- Toàn trang --- */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", sans-serif;
            overflow-x: hidden; /*  Ngăn thanh scroll ngang */
        }

        /* --- Khung full màn hình --- */
        .container {
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: white;
            padding: 40px 5%; /* dùng % để tránh tràn ngang */
            box-sizing: border-box;
            overflow-y: auto; /* cho phép cuộn dọc nếu bảng dài */
        }

        h2 {
            text-align: center;
            color: black;
            margin-bottom: 30px;
        }

        /* --- Thanh chọn ngày --- */
        form {
            text-align: center;
            margin-bottom: 25px;
            flex-shrink: 0;
        }

        input[type="date"],
        input[type="submit"],
        .btn-back {
            padding: 8px 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin: 0 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background: black;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background: white;
            color: black;
        }

        .btn-back {
            background: black;
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-back:hover {
            background: white;
            color: black;
        }

        /* --- Bảng thống kê --- */
        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: #fff;
            table-layout: fixed; /*  tránh bảng tràn ngang */
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

        /* --- Tổng cộng --- */
        .total {
            margin-top: 20px;
            font-weight: bold;
            text-align: right;
            width: 100%;
            max-width: 1200px;
        }

        /* --- Nút quay lại --- */
        .btn-container {
            text-align: center;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Báo cáo thống kê tài liệu</h2>

    <form action="document-report" method="post">
        <label>Từ ngày:</label>
        <input type="date" name="startDate"
               value="<%=request.getAttribute("startDate") != null ? request.getAttribute("startDate") : ""%>">

        <label>Đến ngày:</label>
        <input type="date" name="endDate"
               value="<%=request.getAttribute("endDate") != null ? request.getAttribute("endDate") : ""%>">
        <input type="submit" value="Xem thống kê">
    </form>

    <table>
        <tr>
            <th>STT</th>
            <th>Mã tài liệu</th>
            <th>Tên tài liệu</th>
            <th>Số lần mượn</th>
        </tr>
        <%
            List<DocumentReport> list = (List<DocumentReport>) request.getAttribute("documentReportList");
            if (list != null && !list.isEmpty()) {
                int index = 1;
                for (DocumentReport d : list) {
        %>
        <tr>
            <td><%= index++ %></td>
            <td>
                <a href="document-detail-report?documentId=<%= d.getId() %>&documentName=<%= d.getName() %>"
                   style="color: red; text-decoration: none;">
                    <%= d.getId() %>
                </a>
            </td>
            <td><%= d.getName() %></td>
            <td><%= d.getTotalLoans() %></td>
        </tr>
        <%  }} else { %>
        <tr><td colspan="4">Không có dữ liệu</td></tr>
        <% } %>
    </table>

    <div class="total">
        Tổng số lần mượn:
        <%= request.getAttribute("totalLoans") != null ? request.getAttribute("totalLoans") : 0 %>
    </div>

    <div class="btn-container">
        <a href="manager-home.jsp" class="btn-back">⬅ Quay lại</a>
    </div>
</div>
</body>
</html>
