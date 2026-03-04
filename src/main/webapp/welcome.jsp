<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

<title>SecureVault | Enterprise Password Management</title>

<link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3064/3064197.png">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
min-height:100vh;
background:linear-gradient(135deg,#020617,#0f172a,#1e40af);
overflow-x:hidden;
color:white;
}

/* BLOBS */

.blob{
position:absolute;
border-radius:50%;
filter:blur(90px);
opacity:.5;
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
max-width:1000px;

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

/* HERO */

.hero{
padding-top:100px;
display:flex;
align-items:center;
justify-content:space-between;
padding:0 120px;
min-height:110vh;
}

.hero-text{
width:50%;
}

.hero-text h1{
font-size:48px;
line-height:1.2;
}

.hero-text p{
margin-top:20px;
font-size:18px;
color:#cbd5f5;
}

/* BUTTON */

.hero-btn{
margin-top:30px;

background:linear-gradient(135deg,#6366f1,#0baac2);
color:white;

padding:14px 28px;

border:none;
border-radius:12px;

font-size:16px;
font-weight:600;

cursor:pointer;

transition:.35s;

box-shadow:0 10px 25px rgba(0,0,0,0.4);
}

.hero-btn:hover{
transform:translateY(-4px);
box-shadow:0 15px 35px rgba(0,0,0,0.6);
}

.hero-image{
width:40%;
}

.hero-image img{
width:100%;
border-radius:14px;
}

/* FEATURES SECTION */

.features{
padding:120px 120px;
text-align:center;
}

.features h2{
font-size:40px;
margin-bottom:80px;
}

/* FEATURE GRID */

.feature-grid{
display:flex;
justify-content:center;
gap:40px;
flex-wrap:wrap;
}

/* FEATURE CARD */

.feature-card{

width:110px;
height:110px;

background:rgba(255,255,255,0.08);

border-radius:18px;

display:flex;
align-items:center;
justify-content:center;

flex-direction:column;

cursor:pointer;

transition:all .4s ease;

border:1px solid rgba(255,255,255,0.15);

backdrop-filter:blur(14px);

overflow:hidden;
}

/* ICON */

.feature-card i{
font-size:32px;
color:#38bdf8;
}

/* CONTENT HIDDEN */

.feature-card h3,
.feature-card p{
opacity:0;
height:0;
transition:.3s;
}

/* HOVER EXPAND */

.feature-card:hover{

width:260px;
height:200px;

padding:20px;

box-shadow:
0 20px 50px rgba(0,0,0,0.5),
0 0 20px rgba(56,189,248,0.3);

}

/* SHOW CONTENT */

.feature-card:hover h3,
.feature-card:hover p{
opacity:1;
height:auto;
margin-top:10px;
}

.feature-card h3{
font-size:20px;
}

.feature-card p{
font-size:14px;
color:#cbd5f5;
line-height:1.5;
}
/* glass cards */

.feature-content{

background:rgba(255,255,255,0.08);

backdrop-filter:blur(18px);

border:1px solid rgba(255,255,255,0.18);

border-radius:18px;

padding:35px 40px;

box-shadow:
0 15px 40px rgba(0,0,0,0.4),
inset 0 1px rgba(255,255,255,0.15);

transition:.35s;

}

.feature-content:hover{

transform:translateY(-6px) scale(1.02);

box-shadow:
0 20px 50px rgba(0,0,0,0.6),
0 0 25px rgba(99,102,241,0.3);

}

.feature-content h3{
font-size:22px;
margin-bottom:10px;
}

.feature-content p{
color:#cbd5f5;
}

/* ICON */

.feature-icon{
font-size:28px;
color:#38bdf8;
margin-bottom:12px;
display:block;
}

/* TRUSTED */

.trusted{
padding:90px 20px;
text-align:center;
}

.trusted h2{
margin-bottom:30px;
font-size:30px;
}

.logo-row{
display:flex;
justify-content:center;
gap:40px;
flex-wrap:wrap;
}

.logo-row img{
height:45px;
opacity:.8;
transition:.3s;
}

.logo-row img:hover{
transform:scale(1.1);
opacity:1;
}

/* FOOTER */

footer{
text-align:center;
padding:30px;
color:#cbd5f5;
}

/* MOBILE */

@media(max-width:900px){

.hero{
flex-direction:column;
text-align:center;
padding:140px 40px;
}

.hero-text{
width:100%;
}

.hero-image{
width:80%;
margin-top:40px;
}

.feature-item{
width:100%;
left:0;
text-align:left;
}

.feature-timeline::before{
display:none;
}

}

</style>

</head>

<body>

<div class="blob blob1"></div>
<div class="blob blob2"></div>

<div class="navbar">

<div class="logo">
<i class="fa-solid fa-shield-halved"></i> SecureVault
</div>

<div class="nav-links">
<a href="/login">Login</a>
<a href="/register">Register</a>
</div>

</div>

<section class="hero">

<div class="hero-text">

<h1>
Enterprise Password Management<br>
with Safe Link Intelligence
</h1>

<p>
Secure credentials, detect malicious URLs and protect enterprise systems
from cyber threats using SecureVault.
</p>

<button class="hero-btn"
onclick="window.location.href='/register'">
Get Started
</button>

</div>

<div class="hero-image">
<img src="https://assets.designtemplate.io/Flat-Design-Cyber-Security-Character-Illustration-700.webp">
</div>

</section>

<section class="features">

<h2>Enterprise Security Features</h2>

<div class="feature-grid">

<div class="feature-card">
<i class="fa-solid fa-user-shield"></i>
<h3>Enterprise SSO</h3>
<p>Integrate seamlessly with Azure AD and Google Workspace.</p>
</div>

<div class="feature-card">
<i class="fa-solid fa-lock"></i>
<h3>Role-Based Access</h3>
<p>Control access permissions for secure credential management.</p>
</div>

<div class="feature-card">
<i class="fa-solid fa-shield-halved"></i>
<h3>256-Bit Encryption</h3>
<p>Industry-grade AES encryption keeps credentials secure.</p>
</div>

<div class="feature-card">
<i class="fa-solid fa-link"></i>
<h3>Safe URL Detection</h3>
<p>Detect and block malicious URLs before accessing them.</p>
</div>

</div>

</section>

<section class="trusted">

<h2>Trusted by Teams Worldwide</h2>

<div class="logo-row">

<img src="https://cdn-icons-png.flaticon.com/512/5968/5968292.png">
<img src="https://cdn-icons-png.flaticon.com/512/5968/5968853.png">
<img src="https://cdn-icons-png.flaticon.com/512/888/888848.png">
<img src="https://cdn-icons-png.flaticon.com/512/5968/5968705.png">

</div>

</section>

<footer>
© 2026 SecureVault
</footer>

</body>
</html> 