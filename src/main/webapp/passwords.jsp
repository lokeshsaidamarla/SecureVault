<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-dark text-light">

<div class="container mt-4">
    <h2 class="text-center">🔐 Saved Passwords</h2>
    <a class="btn btn-success mb-3" href="${pageContext.request.contextPath}/passwords/add">➕ Add New Password</a>

    <table class="table table-striped table-dark table-bordered">
        <thead>
        <tr>
            <th>Site</th>
            <th>Username</th>
            <th>Password (Encrypted)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="entry" items="${passwords}">
            <tr>
                <td>${entry.site}</td>
                <td>${entry.username}</td>
                <td>********</td>
                <td>
                    <a href="${pageContext.request.contextPath}/passwords/edit/${entry.id}" class="btn btn-warning btn-sm">✏ Edit</a>
                    <a href="${pageContext.request.contextPath}/passwords/delete/${entry.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
