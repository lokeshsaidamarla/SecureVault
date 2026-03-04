<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Reset Password</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <h2>🔁 Reset Password</h2>
    <form action="updatePassword" method="post">
        <input type="password" name="newPassword" placeholder="🔑 New Password" required><br>
        <button type="submit">Update Password</button>
    </form>
    <p style="color:red">${error}</p>
    <p style="color:green">${msg}</p>
</div>
</body>
</html>
