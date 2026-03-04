<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Safe Link Checker</title>

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

.card{

width:420px;

background:rgba(255,255,255,0.05);
backdrop-filter:blur(15px);

border:1px solid rgba(255,255,255,0.1);

border-radius:16px;

padding:30px;

box-shadow:0 10px 40px rgba(0,0,0,0.6);

text-align:center;

}

/* TITLE */

.card h2{
color:#38bdf8;
margin-bottom:20px;
}

/* INPUT */

input{
width:100%;
padding:12px;
border-radius:8px;
border:1px solid rgba(255,255,255,0.15);
background:#020617;
color:white;
outline:none;
margin-top:10px;
}

input:focus{
box-shadow:0 0 0 2px rgba(56,189,248,0.4);
}

/* BUTTON */

button{

margin-top:15px;

width:100%;

padding:12px;

border:none;

border-radius:8px;

background:#38bdf8;

color:black;

font-weight:500;

cursor:pointer;

transition:.3s;

}

button:hover{
background:#0ea5e9;
}

/* RESULT */

.result{
margin-top:20px;
padding:12px;
border-radius:10px;
font-size:15px;
}

.safe{
background:#10b981;
}

.unsafe{
background:#ef4444;
}

/* BACK BUTTON */

.back-btn{
margin-top:18px;
display:inline-block;
padding:10px 18px;
border-radius:8px;
background:#38bdf8;
color:black;
text-decoration:none;
font-weight:500;
transition:.3s;
}

.back-btn:hover{
background:#0ea5e9;
}

</style>

</head>

<body>

<div class="card">

<h2>
<span class="material-icons" style="vertical-align:middle;">link</span>
Safe Link Checker
</h2>

<form method="post" action="/check-link">

<input type="text" name="url" placeholder="Enter URL to check" required>

<button type="submit">Check Safety</button>

</form>

<c:if test="${not empty result}">

<div class="result ${result == 'Safe' ? 'safe' : 'unsafe'}">

<strong>Result:</strong> ${result}

<br>

<small>Checked URL: ${url}</small>

</div>

</c:if>

<!-- BACK BUTTON -->

<a href="/home" class="back-btn">🏠 Back to Home</a>

</div>

</body>
</html>