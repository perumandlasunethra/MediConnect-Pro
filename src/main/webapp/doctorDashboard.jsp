
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("doctorId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    String doctorName = (String) session.getAttribute("doctorName");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Doctor Dashboard - MediConnect Pro</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="dashboard-container">

    <div class="dashboard-header">

        <div>

            <h1>Welcome, Dr. <%= doctorName %></h1>

            <p>
                Your professional healthcare dashboard
            </p>

        </div>

        <a class="logout-btn"
           href="LogoutServlet">
            Logout
        </a>

    </div>


    <div class="doctor-banner">

        <div class="doctor-avatar">
            Doctor
        </div>

        <div>

            <h2>Doctor Portal</h2>

            <p>
                Manage your appointments, availability
                and stay connected with your patients
                through MediConnect Pro.
            </p>

        </div>

    </div>


    <h2 class="section-title">
        Doctor Services
    </h2>


    <div class="dashboard-cards">


        <!-- My Appointments -->

        <div class="dashboard-card">

            <div class="card-icon">
                Appointment
            </div>

            <h3>
                My Appointments
            </h3>

            <p>
                View your scheduled appointments
                and check patient details.
            </p>

            <a href="doctorAppointments.jsp">
                View Appointments
            </a>

        </div>


        <!-- Patient Connections -->

        <div class="dashboard-card">

            <div class="card-icon">
                Patients
            </div>

            <h3>
                Patient Connections
            </h3>

            <p>
                View patients who have booked
                appointments with you.
            </p>

            <span class="available">
                Active
            </span>

        </div>


        <!-- Professional Portal -->

        <div class="dashboard-card">

            <div class="card-icon">
                Healthcare
            </div>

            <h3>
                Professional Portal
            </h3>

            <p>
                Manage your healthcare services
                and appointment activities.
            </p>

            <span class="available">
                Online
            </span>

        </div>


        <!-- Manage Availability -->

        <div class="dashboard-card">

            <div class="card-icon">
                Schedule
            </div>

            <h3>
                Manage Availability
            </h3>

            <p>
                Set your available days and
                consultation hours for patients.
            </p>

            <a href="doctorAvailability.jsp">
                Manage Availability
            </a>

        </div>


    </div>


    <div class="doctor-tip">

        <div class="tip-icon">
            Tip
        </div>

        <div>

            <h3>
                Doctor Reminder
            </h3>

            <p>
                Set your available days and working
                hours regularly so patients can
                book suitable appointment slots.
            </p>

        </div>

    </div>


    <div class="dashboard-footer">

        <p>
            © 2026 MediConnect Pro |
            Doctor Healthcare Portal
        </p>

    </div>


</div>

</body>

</html>
