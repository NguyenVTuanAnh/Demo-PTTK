<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javaweb.libman.model.DocumentReport" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê tài liệu</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
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

        form {
            text-align: center;
            margin-bottom: 25px;
        }

        input[type="date"], input[type="submit"], .btn-back {
            padding: 8px 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin: 0 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #2980b9;
        }

        .btn-back {
            background: #95a5a6;
            color: white;
            text-decoration: none;
        }

        .btn-back:hover {
            background: #7f8c8d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
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

        .total {
            margin-top: 20px;
            font-weight: bold;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📊 Báo cáo thống kê tài liệu</h2>

    <form action="document-report" method="post">
        <label>Từ ngày:</label>
        <input type="date" name="startDate" placeholder="dd/mm/yyyy" value=<%=request.getAttribute("startDate") != null
                    ? request.getAttribute("startDate") : null%> >

        <label>Đến ngày:</label>
        <input type="date" name="endDate" placeholder="dd/mm/yyyy" value=<%=request.getAttribute("endDate") != null
                    ? request.getAttribute("endDate") : null%> >
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
                <a href="document-detail-report?documentId=<%= d.getDocumentId() %>&documentName=<%= d.getDocumentName() %>"
                   style="color: #2980b9; text-decoration: none;">
                    <%= d.getDocumentId() %>
                </a>
            </td>
            <td><%= d.getDocumentName() %></td>
            <td><%= d.getTotalLoans() %></td>
        </tr>
        <%  }} else { %>
        <tr><td colspan="5">Không có dữ liệu</td></tr>
        <% } %>
    </table>

    <div class="total">
        Tổng số lần mượn: <%= request.getAttribute("totalLoans") != null ? request.getAttribute("totalLoans") : 0 %>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="home-manager.jsp" class="btn-back">⬅ Quay lại</a>
    </div>
</div>
</body>

</html>
