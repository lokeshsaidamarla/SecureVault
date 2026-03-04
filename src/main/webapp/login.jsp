<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>🔐 Secure Login</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

/* ---------- Background Video ---------- */

#bg-video{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
object-fit:cover;
z-index:-2;
}

.overlay{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:linear-gradient(135deg,#0a0020,#020617);
opacity:0.75;
z-index:-1;
}

/* ---------- Center Container ---------- */

body{
display:flex;
align-items:center;
justify-content:center;
height:100vh;
}

/* ---------- Glass Card ---------- */

.container{

width:380px;
padding:40px;

border-radius:20px;

background:rgba(255,255,255,0.05);
backdrop-filter:blur(18px);
-webkit-backdrop-filter:blur(18px);

border:1px solid rgba(255,255,255,0.1);

box-shadow:
0 0 40px rgba(0,140,255,0.15),
inset 0 0 20px rgba(255,255,255,0.02);

text-align:center;

animation:fadeIn 1s ease;
}

/* ---------- Heading ---------- */

.container h2{
color:#1da1ff;
margin-bottom:30px;
font-weight:600;
letter-spacing:1px;
}

/* ---------- Inputs ---------- */

input{

width:100%;
padding:14px 16px;
margin:12px 0;

border:none;
border-radius:10px;

background:rgba(255,255,255,0.08);

color:white;
font-size:15px;

outline:none;

transition:all .3s ease;

}

input::placeholder{
color:#bbb;
}

input:focus{

background:rgba(255,255,255,0.15);

box-shadow:
0 0 0 2px rgba(0,140,255,0.4),
0 0 15px rgba(0,140,255,0.4);

}

/* ---------- Button ---------- */

button{

width:100%;
padding:14px;

margin-top:15px;

border:none;
border-radius:10px;

background:linear-gradient(135deg,#1da1ff,#0072ff);

color:white;
font-size:16px;
font-weight:500;

cursor:pointer;

transition:all .35s ease;

}

button:hover{

transform:translateY(-2px);

box-shadow:
0 10px 25px rgba(0,140,255,0.35);

background:linear-gradient(135deg,#3db2ff,#1a7dff);

}

/* ---------- Links ---------- */

.container p{
margin-top:15px;
color:#ccc;
font-size:14px;
}

.container a{
color:#00eaff;
text-decoration:none;
font-weight:500;
}

.container a:hover{
text-decoration:underline;
}

/* ---------- Error Messages ---------- */

.error{
color:#ff5a5a;
margin-top:10px;
}

.msg{
color:#00ff9c;
margin-top:10px;
}

/* ---------- Animation ---------- */

@keyframes fadeIn{

from{
opacity:0;
transform:translateY(20px);
}

to{
opacity:1;
transform:translateY(0);
}

}

</style>
</head>

<body>

<!-- Background Video -->
<video autoplay muted loop id="bg-video">
<source src="images/v1.mp4" type="video/mp4">
</video>

<div class="overlay"></div>

<div class="container">

<h2>🔐 Secure Login</h2>

<form action="login" method="post">

<input type="text" name="username" placeholder="👤 Username" required>

<input type="password" name="password" placeholder="🔑 Password" required>

<button type="submit">Login</button>

</form>

<p class="error">${error}</p>
<p class="msg">${msg}</p>

<p>Don't have an account? <a href="register">Register Here</a></p>

<p><a href="forgotPassword">Forgot Password?</a></p>

</div>

</body>
</html>