<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>

<title>My Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body{
font-family:Arial;
background:linear-gradient(135deg,#020617,#0f172a,#1e40af);
color:white;
height:100vh;
display:flex;
align-items:center;
justify-content:center;
}

.card{
background:rgba(255,255,255,0.08);
border:1px solid rgba(255,255,255,0.18);
border-radius:20px;
padding:35px;
width:420px;
backdrop-filter:blur(18px);
box-shadow:0 15px 40px rgba(0,0,0,0.5);
}

h2{
text-align:center;
margin-bottom:25px;
}

.info{
margin-bottom:15px;
}

.label{
color:#94a3b8;
}

.value{
font-weight:500;
}

.btn{
display:inline-block;
margin-top:20px;
padding:10px 20px;
background:#2563eb;
border-radius:8px;
color:white;
text-decoration:none;
margin-right:10px;
}

.btn:hover{
background:#1e40af;
}

.dashboard-btn{
background:#16a34a;
}

.dashboard-btn:hover{
background:#15803d;
}

.center{
text-align:center;
}

</style>

</head>

<body>

<div class="card">

<h2><i class="fa fa-user"></i> My Profile</h2>

<div class="info">
<span class="label">Username:</span>
<span class="value">${user.username}</span>
</div>

<div class="info">
<span class="label">Full Name:</span>
<span class="value">${user.fullName}</span>
</div>

<div class="info">
<span class="label">Email:</span>
<span class="value">${user.email}</span>
</div>

<div class="info">
<span class="label">Phone:</span>
<span class="value">${user.phone}</span>
</div>

<div class="center">

    <a href="${pageContext.request.contextPath}/home" class="btn dashboard-btn">
<i class="fa fa-arrow-left"></i> Return to Dashboard
</a>
<a href="${pageContext.request.contextPath}/profile/edit" class="btn">
<i class="fa fa-pen"></i> Edit Profile
</a>



</div>

</div>

</body>
</html>