<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Edit Password</title>

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
margin-bottom:25px;

}

/* LABEL */

label{

display:block;
text-align:left;
margin-top:12px;
margin-bottom:4px;

color:#cbd5f5;

}

/* INPUT */

input{

width:100%;
padding:12px;

border-radius:8px;

border:1px solid rgba(255,255,255,0.15);

background:#020617;

color:white;

}

/* PASSWORD FIELD */

.password-box{
position:relative;
}

.eye{

position:absolute;
right:10px;
top:10px;

cursor:pointer;
color:#38bdf8;

}

/* GENERATE */

.generate{

margin-top:6px;

display:inline-block;

font-size:14px;

color:#38bdf8;

cursor:pointer;

text-decoration:underline;

}

/* STRENGTH BAR */

.strength-bar{

height:6px;
border-radius:4px;

background:#333;

margin-top:6px;

overflow:hidden;

}

.strength-fill{

height:100%;
width:0%;
transition:.3s;

}

/* BUTTON */

button{

margin-top:18px;

padding:10px 20px;

border:none;

border-radius:8px;

background:#38bdf8;

color:black;

font-weight:500;

cursor:pointer;

}

button:hover{
background:#0ea5e9;
}

/* BACK */

.back{

margin-top:18px;
display:block;

color:#38bdf8;

text-decoration:none;

}

</style>
</head>

<body>

<div class="card">

<h2>✏ Edit Password</h2>

<form action="/update-password" method="post">

<input type="hidden" name="id" value="${sp.id}">

<label>Site Name</label>
<input type="text" name="siteName" value="${sp.siteName}" required>

<label>Site URL</label>
<input type="text" name="siteUrl" value="${sp.siteUrl}" required>

<label>Username</label>
<input type="text" name="siteUsername" value="${sp.siteUsername}" required>

<label>Password</label>

<div class="password-box">

<input
id="passwordInput"
type="password"
name="sitePassword"
value="${sp.sitePassword}"
onkeyup="checkStrength()"
required>

<span class="material-icons eye" onclick="togglePassword()">visibility</span>

</div>

<span class="generate" onclick="generatePassword()">Generate ?</span>

<div class="strength-bar">
<div id="strengthFill" class="strength-fill"></div>
</div>

<button type="submit">Update</button>

</form>

<a href="/add-password" class="back">← Back</a>

</div>

<script>

/* SHOW HIDE PASSWORD */

function togglePassword(){

let input=document.getElementById("passwordInput");

if(input.type==="password"){
input.type="text";
}else{
input.type="password";
}

}

/* GENERATE PASSWORD */

function generatePassword(){

let chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";

let pass="";

for(let i=0;i<12;i++){

pass+=chars.charAt(Math.floor(Math.random()*chars.length));

}

document.getElementById("passwordInput").value=pass;

checkStrength();

}

/* PASSWORD STRENGTH */

function checkStrength(){

let pass=document.getElementById("passwordInput").value;

let bar=document.getElementById("strengthFill");

let strength=0;

if(pass.length>=8) strength++;
if(/[A-Z]/.test(pass)) strength++;
if(/[0-9]/.test(pass)) strength++;
if(/[!@#$%^&*]/.test(pass)) strength++;

let width=strength*25;

bar.style.width=width+"%";

if(width<=25) bar.style.background="red";
else if(width<=50) bar.style.background="orange";
else if(width<=75) bar.style.background="yellow";
else bar.style.background="lime";

}

</script>

</body>
</html>