<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <title>MediConnect Pro</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

<div class="hero">
    <div class="medical-icon">🩺</div>

    <h1>MediConnect Pro</h1>

    <p>An Integrated Digital Healthcare Portal</p>

    <span>Connecting Patients with Trusted Doctors</span>
</div>

<div class="role-container">

    <div class="role-card">

        <div class="role-header">
            <span class="role-icon">🧑‍⚕️</span>
            <h3>Doctor</h3>
        </div>

        <p>
            Manage appointments and connect with patients
            through our digital healthcare platform.
        </p>

        <a class="dashboard-link" href="doctorSignup.jsp">
            Doctor Registration
        </a>

        <a class="dashboard-link" href="doctorLogin.jsp">
            Doctor Login
        </a>

    </div>


    <div class="role-card">

        <div class="role-header">
            <span class="role-icon">👤</span>
            <h3>Patient</h3>
        </div>

        <p>
            Find doctors, book appointments and manage
            your healthcare easily.
        </p>

        <a class="dashboard-link" href="patientSignup.jsp">
            Patient Registration
        </a>

        <a class="dashboard-link" href="patientLogin.jsp">
            Patient Login
        </a>

    </div>

</div>

<div class="footer">
    <p>© 2026 MediConnect Pro | Digital Healthcare Portal</p>
</div>


</div>

</body>
</html>
