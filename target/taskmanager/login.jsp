<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
</head>
<body>
    <h1>Admin Login</h1>
    <form method="post" action="j_security_check">
        <input type="text" name="j_username" required>
        <input type="password" name="j_password" required>
        <button type="submit">Login</button>
    </form>
</body>
</html> 