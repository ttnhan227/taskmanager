<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TaskManager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css" type="text/css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 5rem auto;
            padding: 2rem;
        }
        .login-card {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            padding: 2.5rem;
            border: 1px solid rgba(37, 117, 252, 0.1);
        }
        .login-title {
            color: #1a237e;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            margin-bottom: 1.25rem;
        }
        .form-control:focus {
            border-color: #a0c4ff;
            box-shadow: 0 0 0 0.25rem rgba(160, 196, 255, 0.25);
        }
        .btn-login {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            background: linear-gradient(90deg, #2575fc, #6a11cb);
            border: none;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(37, 117, 252, 0.3);
        }
        .login-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
        }
        .login-footer a {
            color: #2575fc;
            text-decoration: none;
            font-weight: 500;
        }
        .login-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="home">TaskManager</a>
        </div>
    </nav>

    <div class="container login-container">
        <div class="login-card">
            <h2 class="login-title">Welcome Back</h2>
            <form method="post" action="j_security_check">
                <div class="mb-3">
                    <input type="text" class="form-control" name="j_username" placeholder="Username" required>
                </div>
                <div class="mb-4">
                    <input type="password" class="form-control" name="j_password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-login">Sign In</button>
            </form>
            <div class="login-footer">
                <p>Don't have an account? <a href="#">Contact administrator</a></p>
            </div>
        </div>
    </div>

    <footer class="footer text-center">
        <div class="container">
            <p class="mb-0">&copy; 2023 TaskManager. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>