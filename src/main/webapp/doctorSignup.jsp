<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>


<title>Doctor Registration - MediConnect Pro</title>

<link rel="stylesheet" href="css/style.css">


</head>

<body>

<div class="container">


<div class="hero registration-hero">

    <div class="medical-icon">🧑‍⚕️</div>

<h1>Doctor Registration</h1>

<p>Join MediConnect Pro and connect with your patients</p>

</div>


<div class="role-card form-card">

    <form action="DoctorSignupServlet" method="post">

        <label>Doctor Name</label>

        <input type="text"
               name="name"
               placeholder="Enter your name"
               required>


        <label>Email</label>

        <input type="email"
               name="email"
               placeholder="Enter your email"
               required>


        <label>Password</label>

       <input type="password" name="password" placeholder="Create a strong password" 
       pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#$%]).{8,}" 
       title="Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character" required>


        <label>Specialization</label>

        <select name="specialization" required>

            <option value="">Select Specialization</option>

            <option value="Cardiologist">Cardiologist</option>
            <option value="Dermatologist">Dermatologist</option>
            <option value="Neurologist">Neurologist</option>
            <option value="Pediatrician">Pediatrician</option>
            <option value="Orthopedic">Orthopedic</option>
            <option value="General Physician">General Physician</option>

        </select>


        <label>Phone</label>

          <input type="tel"
       name="phone"
       placeholder="Enter 10-digit phone number"
       pattern="[6-9][0-9]{9}"
       maxlength="10"
       required>

        <input type="submit"
               class="dashboard-link"
               value="Create Doctor Account">

    </form>


    <p>
        Already registered as a doctor?
    </p>


    <a class="dashboard-link"
       href="doctorLogin.jsp">
        Doctor Login
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
