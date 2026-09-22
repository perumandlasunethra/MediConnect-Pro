<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if (session.getAttribute("patientId") == null) {
response.sendRedirect("patientLogin.jsp");
return;
}

String patientName = (String) session.getAttribute("patientName");


%>

<!DOCTYPE html>

<html>

<head>

<title>Patient Dashboard - MediConnect Pro</title>

<link rel="stylesheet" href="css/style.css">


</head>

<body>

<div class="dashboard-container">

<div class="dashboard-header">

    <div>
        <h1>Welcome, <%= patientName %> 👋</h1>
        <p>Your personal healthcare dashboard</p>
    </div>

    <a class="logout-btn" href="LogoutServlet">
        Logout
    </a>

</div>


<div class="patient-banner">

    <div class="patient-avatar">
        👤
    </div>

    <div>
        <h2>Patient Portal</h2>

        <p>
            Manage your appointments and connect with doctors
            easily through MediConnect Pro.
        </p>
    </div>

</div>


<h2 class="section-title">Quick Actions</h2>


<div class="dashboard-cards">

    <div class="dashboard-card">

        <div class="card-icon">
            📅
        </div>

        <h3>Book Appointment</h3>

        <p>
            Find a doctor and schedule your appointment
            at a convenient date and time.
        </p>

        <a href="LoadDoctorsServlet">
            Book Now →
        </a>

    </div>


    <div class="dashboard-card">

        <div class="card-icon">
            📋
        </div>

        <h3>My Appointments</h3>

        <p>
            View your scheduled appointments,
            doctor details and appointment status.
        </p>

        <a href="viewAppointments.jsp">
            View Appointments →
        </a>

    </div>


    <div class="dashboard-card">

        <div class="card-icon">
            🩺
        </div>

        <h3>Healthcare Support</h3>

        <p>
            Access your healthcare services through
            the MediConnect Pro portal.
        </p>

        <span class="available">
            ● Available
        </span>

    </div>

</div>


<div class="health-tip">

    <div class="tip-icon">
        💡
    </div>

    <div>

        <h3>Health Reminder</h3>

        <p>
            Keep your appointments updated and follow
            the instructions provided by your doctor.
        </p>

    </div>

</div>


<div class="dashboard-footer">

    <p>
        © 2026 MediConnect Pro | Patient Healthcare Portal
    </p>

</div>

</div>

</body>

</html>
