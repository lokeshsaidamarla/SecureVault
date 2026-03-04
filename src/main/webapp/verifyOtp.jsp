<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
    <link rel="stylesheet" href="css/otp.css">
    
</head>
<body>
    <h2>Enter OTP</h2>
    <form action="verifyOtp" method="post">
        <input type="text" name="otp" placeholder="Enter OTP" required>
        <br><br>
        <button type="submit">Verify OTP</button>
    </form>
    <p style="color:red">${error}</p>
    <p style="color:green">${msg}</p>
</body>
</html>