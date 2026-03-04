<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Password Manager</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<!-- GOOGLE MATERIAL ICONS -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>

*{
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
background:linear-gradient(135deg,#020617,#0f172a,#1e3a8a);
color:white;
padding:40px;
}

/* TITLE */

.page-title{
text-align:center;
font-size:28px;
margin-bottom:35px;
color:#38bdf8;
}

/* LAYOUT */

.wrapper{
display:flex;
gap:40px;
}

/* GLASS CARD */

.form-box,.table-box{

background:rgba(255,255,255,0.05);
backdrop-filter:blur(15px);

border:1px solid rgba(255,255,255,0.1);

border-radius:16px;

padding:25px;

box-shadow:0 10px 40px rgba(0,0,0,0.5);

}

.form-box{ width:35%; }
.table-box{ width:65%; }

/* INPUTS */

input{
width:100%;
padding:12px;
margin-top:10px;
border-radius:8px;
border:1px solid rgba(255,255,255,0.15);
background:#020617;
color:white;
}

/* GENERATE LINK */

.generate-link{
margin-top:10px;
display:inline-block;
color:#38bdf8;
cursor:pointer;
text-decoration:underline;
}

/* SAVE BUTTON */

.save-btn{
margin-top:15px;
padding:10px 16px;
border:none;
border-radius:8px;
background:#38bdf8;
cursor:pointer;
color:black;
font-weight:500;
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
margin-top:10px;
}

th,td{
padding:12px;
text-align:center;
border-bottom:1px solid rgba(255,255,255,0.1);
}

th{
color:#38bdf8;
}

/* ICONS */

.icon{
font-size:20px;
cursor:pointer;
margin-left:8px;
color:#38bdf8;
}

.icon:hover{
color:white;
}

/* ACTION BUTTONS */

.actions{
display:flex;
justify-content:center;
gap:12px;
}

.action-btn{
width:36px;
height:36px;
border-radius:8px;
background:#38bdf8;
display:flex;
align-items:center;
justify-content:center;
text-decoration:none;
color:black;
}

.action-btn:hover{
background:#0ea5e9;
}

.delete-btn{
background:#ef4444;
color:white;
}

.delete-btn:hover{
background:#dc2626;
}

/* SEARCH */

.search-box{
margin-bottom:10px;
}

/* PASSWORD STRENGTH */

.strength-bar{
height:6px;
border-radius:4px;
margin-top:6px;
background:#333;
overflow:hidden;
}

.strength-fill{
height:100%;
width:0%;
transition:.3s;
}

/* BACK BUTTON */

.back-home{
text-align:center;
margin-top:25px;
}

.back-home a{
padding:10px 16px;
background:#38bdf8;
border-radius:8px;
color:black;
text-decoration:none;
}

</style>
</head>

<body>

<h2 class="page-title">🔐 Password Manager</h2>

<div class="wrapper">

<!-- LEFT FORM -->

<div class="form-box">

<h3>Add Password</h3>

<form action="/add-password" method="post">

<input type="text" name="siteName" placeholder="Site Name" required>

<input type="text" name="siteUrl" placeholder="Site URL" required>

<input type="text" name="siteUsername" placeholder="Username" required>

<input id="passwordInput"
type="password"
name="sitePassword"
placeholder="Password"
onkeyup="checkStrength()"
required>

<span class="generate-link" onclick="generatePassword()">Generate ?</span>

<div class="strength-bar">
<div id="strengthFill" class="strength-fill"></div>
</div>

<button type="submit" class="save-btn">Save</button>

</form>

</div>

<!-- RIGHT TABLE -->

<div class="table-box">

<h3>Saved Passwords</h3>

<div class="search-box">
<input type="text" id="search" placeholder="🔍 Search passwords..." onkeyup="searchPasswords()">
</div>

<table id="passwordTable">

<tr>
<th>Site</th>
<th>URL</th>
<th>Username</th>
<th>Password</th>
<th>Actions</th>
</tr>

<c:forEach var="p" items="${passwords}" varStatus="loop">

<tr>

<td>${p.siteName}</td>
<td>${p.siteUrl}</td>
<td>${p.siteUsername}</td>

<td>

<span id="pass-${loop.index}">********</span>
<span class="material-icons icon"
data-pass="${p.sitePassword}"
data-index="${loop.index}"
onclick="togglePassword(this)">visibility</span>

<span class="material-icons icon"
data-pass="${p.sitePassword}"
onclick="copyPassword(this)">content_copy</span>

</td>

<td class="actions">

<a href="/edit-password/${p.id}" class="action-btn">
<span class="material-icons">edit</span>
</a>

<a href="/delete-password/${p.id}" class="action-btn delete-btn">
<span class="material-icons">delete</span>
</a>

</td>

</tr>

</c:forEach>

</table>

</div>

</div>

<div class="back-home">
<a href="/home">🏠 Back to Home</a>
</div>

<script>

/* SHOW / HIDE PASSWORD */

function togglePassword(element){

let index = element.getAttribute("data-index");
let span = document.getElementById("pass-" + index);
let realPassword = element.getAttribute("data-pass");

if(span.innerText === "********"){
    span.innerText = realPassword;
}else{
    span.innerText = "********";
}

}

/* COPY PASSWORD */

function copyPassword(element){

let password=element.getAttribute("data-pass");

navigator.clipboard.writeText(password);

alert("Password copied!");

}

/* SEARCH */

function searchPasswords(){

let input=document.getElementById("search").value.toLowerCase();

let rows=document.querySelectorAll("#passwordTable tr");

rows.forEach((row,i)=>{

if(i===0)return;

let text=row.innerText.toLowerCase();

row.style.display=text.includes(input)?"":"none";

});

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

if(pass.length>=8)strength++;
if(/[A-Z]/.test(pass))strength++;
if(/[0-9]/.test(pass))strength++;
if(/[!@#$%^&*]/.test(pass))strength++;

let width=strength*25;

bar.style.width=width+"%";

if(width<=25)bar.style.background="red";
else if(width<=50)bar.style.background="orange";
else if(width<=75)bar.style.background="yellow";
else bar.style.background="lime";

}

</script>

</body>
</html>