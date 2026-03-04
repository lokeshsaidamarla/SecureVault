<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>SecureVault Dashboard</title>

<link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3064/3064197.png">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

/* BACKGROUND */

body{
min-height:100vh;
height:100vh;
background:linear-gradient(135deg,#020617,#0f172a,#1e40af);
color:white;
overflow:hidden;
}

/* BLOBS */

.blob{
position:absolute;
border-radius:50%;
filter:blur(90px);
opacity:.45;
animation:float 12s infinite ease-in-out;
}

.blob1{
width:420px;
height:420px;
background:#6366f1;
top:-150px;
left:-150px;
}

.blob2{
width:350px;
height:350px;
background:#22d3ee;
bottom:-120px;
right:-120px;
animation-delay:3s;
}

@keyframes float{
0%,100%{transform:translateY(0)}
50%{transform:translateY(-40px)}
}

/* NAVBAR */

.navbar{
position:fixed;
top:20px;
left:50%;
transform:translateX(-50%);
width:85%;
max-width:1100px;

display:flex;
justify-content:space-between;
align-items:center;

padding:14px 28px;

background:rgba(255,255,255,0.08);
backdrop-filter:blur(18px);

border-radius:30px;
border:1px solid rgba(255,255,255,0.15);

box-shadow:0 8px 30px rgba(0,0,0,0.4);

z-index:1000;
}

.logo{
font-weight:600;
font-size:18px;
}

.nav-links a{

text-decoration:none;
margin-left:16px;

padding:8px 18px;

border-radius:20px;

color:white;

font-weight:500;

transition:.3s;

}

.nav-links a:hover{
background:rgba(255,255,255,0.15);
}

/* LOGOUT HOVER */

.logout-btn:hover{
background:rgba(239,68,68,0.25);
color:#e43a3a;
}

/* PAGE CONTENT */

.container{

padding-top:140px;
padding-left:120px;
padding-right:120px;

}

.container h2{
font-size:30px;
margin-bottom:40px;
}

/* DASHBOARD GRID */

.dashboard{

display:grid;

grid-template-columns:repeat(auto-fit,minmax(260px,1fr));

gap:30px;

}

/* CARD STYLE */

.card{

background:rgba(255,255,255,0.08);

border:1px solid rgba(255,255,255,0.18);

border-radius:18px;

padding:35px;

text-align:center;

backdrop-filter:blur(18px);

box-shadow:
0 15px 40px rgba(0,0,0,0.4),
inset 0 1px rgba(255,255,255,0.15);

transition:.35s;

}

/* CARD HOVER */

.card:hover{

transform:translateY(-8px) scale(1.02);

box-shadow:
0 20px 50px rgba(0,0,0,0.6),
0 0 25px rgba(56,189,248,0.35);

}

/* ICON */

.card i{

font-size:36px;

color:#38bdf8;

margin-bottom:15px;

}

/* TEXT */

.card h3{
margin-bottom:10px;
}

.card p{
font-size:14px;
color:#cbd5f5;
margin-bottom:15px;
}

/* LINKS */

.card a{

color:#38bdf8;

text-decoration:none;

font-weight:500;

}

/* MOBILE */

@media(max-width:900px){

.container{
padding-left:40px;
padding-right:40px;
}

}

</style>

</head>

<body>

<div class="blob blob1"></div>
<div class="blob blob2"></div>

<!-- NAVBAR -->

<div class="navbar">

<div class="logo">
<i class="fa-solid fa-shield-halved"></i> SecureVault
</div>

<div class="nav-links">
<a href="/profile"><i class="fa fa-user"></i> Profile</a>
<a href="logout.jsp" class="logout-btn">
<i class="fa fa-sign-out"></i> Logout
</a>
</div>

</div>

<!-- CONTENT -->

<div class="container">

<h2>Welcome, ${sessionScope.loggedInUser.fullName} !!</h2>


<div class="dashboard">

<div class="card">
<i class="fa fa-key"></i>
<h3>Password Management</h3>
<p>Change password, view expiry policy, check password strength.</p>
<a href="/change-password">Go →</a>
</div>

<div class="card">
<i class="fa fa-lock"></i>
<h3>Add Passwords</h3>
<p>Securely store website credentials with encryption.</p>
<a href="/add-password">Go →</a>
</div>

<div class="card">
<i class="fa fa-shield-halved"></i>
<h3>Safe Link Checker</h3>
<p>Check if a website URL is safe or malicious.</p>
<a href="/check-link">Go →</a>
</div>

<div class="card">
<i class="fa fa-camera"></i>
<h3>Camera Verification</h3>
<p>Enable facial verification for secure access.</p>
<a href="/camera">Verify →</a>
</div>

</div>

</div>

</body>
</html>