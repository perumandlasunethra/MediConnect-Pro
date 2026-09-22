<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<title>Doctor Login - MediConnect Pro</title>

<link rel="stylesheet" href="css/style.css">


</head>

<body>

<div class="container">


<div class="hero registration-hero">

    <div class="medical-icon">🧑‍⚕️</div>

    <h1>Doctor Login</h1>

    <p>Welcome back to MediConnect Pro</p>

</div>


<div class="role-card form-card">

    <form action="DoctorLoginServlet" method="post">

        <label>Email</label>

        <input type="email"
               name="email"
               placeholder="Enter your email"
               required>


        <label>Password</label>

        <input type="password"
               name="password"
               placeholder="Enter your password"
               required>


        <input type="submit"
               class="dashboard-link"
               value="Login">

    </form>


    <p>
        Don't have a doctor account?
    </p>


    <a class="dashboard-link"
       href="doctorSignup.jsp">
        Create Doctor Account
    </a>

    <br>


    <a href="index.jsp">
        Back to Home
    </a>

</div>


<div class="footer">

    <p>
        © 2026 MediConnect Pro | Digital Healthcare Portal
    </p>

</div>


</div>

</body>

</html>
