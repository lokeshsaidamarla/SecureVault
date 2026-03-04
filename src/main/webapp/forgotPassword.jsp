<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container">
    <h2>🔑 Forgot Password</h2>
    <form action="sendOtp" method="post">
        <input type="email" name="email" placeholder="📧 Enter your registered email" required><br>
        <button type="submit">Send OTP</button>
    </form>
    <p style="color:red">${error}</p>
    <p style="color:green">${msg}</p>
</div>
</body>
</html>
