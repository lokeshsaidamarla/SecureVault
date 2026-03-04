<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body { font-family: Arial; background: #0f172a; color: white; }
        .form-container { background: #1e293b; padding: 20px; border-radius: 12px; width: 400px; margin: 50px auto; }
        label { display: block; margin-top: 10px; }
        input { width: 100%; padding: 8px; border: none; border-radius: 6px; margin-top: 5px; }
        button { margin-top: 15px; background: #16a34a; color: white; padding: 10px; border: none; border-radius: 6px; cursor: pointer; }
        button:hover { background: #15803d; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Profile</h2>
        <form action="${pageContext.request.contextPath}/profile/update" method="post">
            <input type="hidden" name="id" value="${user.id}" />

            <label>Full Name</label>
            <input type="text" name="fullName" value="${user.fullName}" />

            <label>Email</label>
            <input type="email" name="email" value="${user.email}" />

            <label>Phone</label>
            <input type="text" name="phone" value="${user.phone}" />


            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
