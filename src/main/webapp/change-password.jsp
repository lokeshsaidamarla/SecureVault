<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>Password Management</title>

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

/* ---------- Body ---------- */

body{
display:flex;
align-items:center;
justify-content:center;
height:100vh;
color:white;
}

/* ---------- Glass Container ---------- */

.container{

width:420px;
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

/* ---------- Headings ---------- */

h2{
color:#1da1ff;
margin-bottom:25px;
font-weight:600;
}

h3{
margin-bottom:15px;
color:#ddd;
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

/* ---------- Strength Text ---------- */

.strength{
margin-top:6px;
font-size:14px;
}

/* ---------- Tooltip ---------- */

.password-field{
position:relative;
}

.tooltip{

position:absolute;
top:110%;
left:0;

background:#020617;
color:#cbd5f5;

padding:10px;
border-radius:8px;

font-size:13px;
line-height:20px;

width:240px;

display:none;

box-shadow:0 6px 20px rgba(0,0,0,0.4);

border:1px solid rgba(255,255,255,0.1);

}

.password-field input:focus + .tooltip{
display:block;
}

/* ---------- Policy Box ---------- */

.policy-box{
margin-top:20px;
background:rgba(255,255,255,0.05);
border-radius:10px;
padding:12px 16px;
border:1px solid rgba(255,255,255,0.08);
}

.policy-item{
font-size:14px;
color:#cbd5f5;
margin:6px 0;
display:flex;
align-items:center;
gap:8px;
}

/* ---------- Cancel Button ---------- */
.cancel-btn{

margin-top:10px;

background:rgba(255,255,255,0.1);

border:1px solid rgba(255,255,255,0.2);

}

.cancel-btn:hover{

background:rgba(255,255,255,0.2);

}

/* ---------- Messages ---------- */

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

<script>

function checkStrength(){

let password=document.getElementById("password").value;
let strengthText=document.getElementById("strength");

let strength=0;

if(password.length>=8) strength++;
if(/[A-Z]/.test(password)) strength++;
if(/[0-9]/.test(password)) strength++;
if(/[!@#$%^&*]/.test(password)) strength++;

if(password.length==0){
strengthText.innerHTML="";
return;
}

if(strength<=1){
strengthText.innerHTML="Weak Password";
strengthText.style.color="red";
}
else if(strength==2 || strength==3){
strengthText.innerHTML="Medium Password";
strengthText.style.color="orange";
}
else{
strengthText.innerHTML="Strong Password";
strengthText.style.color="lime";
}

}

</script>

</head>

<body>

<!-- Background Video -->
<video autoplay muted loop id="bg-video">
<source src="images/v1.mp4" type="video/mp4">
</video>

<div class="overlay"></div>

<div class="container">

<h2>🔐 Password Management</h2>

<h3>🔄 Change Password</h3>

<form action="change-password" method="post">

<input type="text" name="username" placeholder="👤 Username" required>

<div class="password-field">

<input type="password"
name="newPassword"
id="password"
placeholder="🔑 New Password"
onkeyup="checkStrength()"
required>

<div class="tooltip">

<b>Password Requirements</b><br>
• At least 8 characters<br>
• One uppercase letter<br>
• One number<br>
• One special character

</div>

</div>

<div id="strength" class="strength"></div>

<button type="submit">Update Password</button>

<button type="button" class="cancel-btn" onclick="window.location.href='home'">
Cancel
</button>
</form>

<p class="error">${error}</p>
<p class="msg">${msg}</p>

<div class="policy-box">

<div class="policy-item">
⏳ Password expires every <b>90 days</b>
</div>

<div class="policy-item">
🚫 Reusing last <b>3 passwords</b> is not allowed
</div>

</div>

</div>

</body>
</html>