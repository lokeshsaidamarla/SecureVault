<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>Error</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>

*{
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{

height:100vh;

display:flex;
justify-content:center;
align-items:center;

background:linear-gradient(135deg,#020617,#0f172a,#1e3a8a);

color:white;

}

/* CARD */

.container{

width:420px;

background:rgba(255,255,255,0.05);

backdrop-filter:blur(15px);

border:1px solid rgba(255,255,255,0.1);

border-radius:16px;

padding:30px;

box-shadow:0 10px 40px rgba(0,0,0,0.6);

text-align:center;

}

/* ICON */

.icon{

font-size:60px;

color:#ef4444;

margin-bottom:10px;

}

/* TITLE */

h2{

color:#ef4444;

margin-bottom:10px;

}

/* DETAILS */

.details{

margin-top:15px;

font-size:14px;

color:#cbd5f5;

}

/* BUTTONS */

.buttons{

margin-top:20px;

display:flex;

justify-content:center;

gap:15px;

}

.btn{

padding:10px 18px;

border-radius:8px;

background:#38bdf8;

color:black;

text-decoration:none;

font-weight:500;

transition:.3s;

}

.btn:hover{

background:#0ea5e9;

}

.btn.secondary{

background:#64748b;

color:white;

}

.btn.secondary:hover{

background:#475569;

}

</style>

</head>

<body>

<div class="container">

<div class="icon">
<span class="material-icons">error</span>
</div>

<h2>Oops — Something went wrong</h2>

<div class="details">

<p><strong>Status:</strong> ${status}</p>

<p><strong>Message:</strong> ${message}</p>

</div>

<div class="buttons">

<a href="${pageContext.request.contextPath}/login" class="btn">
Login
</a>

<a href="${pageContext.request.contextPath}/home" class="btn secondary">
Home
</a>

</div>

</div>

</body>
</html>