<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>Camera Verification</title>

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

width:460px;

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

/* VIDEO */

video{

border:3px solid #38bdf8;

border-radius:12px;

margin-top:10px;

}

/* BUTTON */

button{

margin-top:15px;

padding:12px 20px;

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

/* BACK BUTTON */

.back{

display:inline-block;

margin-top:15px;

padding:10px 18px;

border-radius:8px;

background:#64748b;

color:white;

text-decoration:none;

}

.back:hover{

background:#475569;

}

canvas{
display:none;
}

</style>

</head>

<body>

<div class="card">

<h2>
<span class="material-icons" style="vertical-align:middle;">photo_camera</span>
Camera Verification
</h2>

<video id="video" width="400" height="300" autoplay></video>

<br>

<button onclick="capture()">Capture & Verify</button>

<canvas id="canvas" width="400" height="300"></canvas>

<form id="imageForm" action="/verify-camera" method="post">

<input type="hidden" name="imageData" id="imageData">

</form>

<br>

<a href="/home" class="back">⬅ Back to Home</a>

</div>

<script>

const video = document.getElementById('video');

navigator.mediaDevices.getUserMedia({ video: true })
.then(stream => {
    video.srcObject = stream;
})
.catch(err => {
    alert("Camera access denied!");
});

function capture(){

const canvas = document.getElementById('canvas');

const context = canvas.getContext('2d');

context.drawImage(video,0,0,400,300);

const imageData = canvas.toDataURL('image/png');

document.getElementById('imageData').value=imageData;

document.getElementById('imageForm').submit();

}

</script>

</body>
</html>