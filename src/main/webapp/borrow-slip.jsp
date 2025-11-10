<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javaweb.libman.model.BorrowSlip" %>
<%@ page import="com.javaweb.libman.model.BorrowDetail" %>
<%@ page import="com.javaweb.libman.model.Document" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết phiếu mượn</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .container {
            background: #fff;
            width: 850px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px 50px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-weight: 600;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 10px 15px;
            font-size: 15px;
        }

        th {
            text-align: left;
            background-color: #f1f3f5;
            color: #333;
            font-weight: 600;
        }

        td {
            color: #444;
        }

        .section-title {
            background-color: #f8f9fa;
            font-weight: 600;
            text-transform: uppercase;
            color: #555;
        }

        .document-table th {
            text-align: center;
        }

        .document-table td {
            text-align: center;
        }

        .footer {
            text-align: right;
            font-size: 14px;
            color: #777;
            margin-top: 15px;
        }

        .highlight {
            color: #007bff;
            font-weight: 600;
        }

        .btn-back {
            display: inline-block;
            background: black;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-back:hover {
            background: white;
            color: black;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Chi tiết phiếu mượn</h2>

    <%
        BorrowSlip borrowSlip = (BorrowSlip) request.getAttribute("borrowSlip");
        if (borrowSlip == null) {
    %>
    <p style="text-align:center; color:red;"> Không tìm thấy phiếu mượn.</p>
    <%
    } else {
    %>

    <table>
        <tr>
            <th>Ngày Mượn:</th>
            <td><%= borrowSlip.getBorrowDate() != null ? borrowSlip.getBorrowDate() : "-" %></td>
        </tr>
        <tr>
            <th>Ngày Hẹn Trả:</th>
            <td><%= borrowSlip.getDueDate() != null ? borrowSlip.getDueDate() : "-" %></td>
        </tr>

        <tr>
            <td colspan="2" class="section-title">Thông Tin Bạn Đọc</td>
        </tr>
        <tr>
            <th>Mã Bạn Đọc:</th>
            <td><%= borrowSlip.getReader() != null ? borrowSlip.getReader().getId() : "-" %></td>
        </tr>
        <tr>
            <th>Tên Bạn Đọc:</th>
            <td><%= borrowSlip.getReader() != null ? borrowSlip.getReader().getName() : "-" %></td>
        </tr>

        <tr>
            <td colspan="2" class="section-title">Thông Tin Nhân Viên</td>
        </tr>
        <tr>
            <th>Mã Nhân Viên:</th>
            <td><%= borrowSlip.getStaff() != null ? borrowSlip.getStaff().getId() : "-" %></td>
        </tr>
        <tr>
            <th>Tên Nhân Viên:</th>
            <td><%= borrowSlip.getStaff() != null ? borrowSlip.getStaff().getName() : "-" %></td>
        </tr>
    </table>

    <table class="document-table">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã Tài Liệu</th>
            <th>Tên Tài Liệu</th>
            <th>Ghi chú</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<BorrowDetail> list = borrowSlip.getBorrowDetails();
            if (list != null && !list.isEmpty()) {
                int i = 1;
                for (BorrowDetail detail : list) {
                    Document document = detail.getDocument();
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= document != null ? document.getId() : "-" %></td>
            <td><%= document != null ? document.getName() : "-" %></td>
            <td></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3">Không có tài liệu mượn.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div style="text-align:center;">
        <a href="javascript:history.back()" class="btn-back">⬅ Quay lại</a>
    </div>

    <% } %>
</div>
</body>
</html>
