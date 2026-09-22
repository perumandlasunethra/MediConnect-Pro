<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<title>Patient Registration - MediConnect Pro</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="container">

<div class="hero registration-hero">

    <div class="medical-icon">👤</div>

    <h1>Patient Registration</h1>

    <p>Create your MediConnect Pro account</p>

</div>


<div class="role-card form-card">

    <form action="PatientSignupServlet" method="post">

        <label>Name</label>
        <input type="text" name="name" placeholder="Enter your full name" required>


        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>


        <label>Password</label>
      
<input type="password"
       name="password"
       placeholder="Create a strong password"
       pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#$%]).{8,}"
       title="Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character"
       required>

        


        <label>Phone</label>
        <input type="tel"
       name="phone"
       placeholder="Enter 10-digit phone number"
       pattern="[6-9][0-9]{9}"
       maxlength="10"
       required>


        <label>Gender</label>

        <select name="gender" required>

            <option value="">Select Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>

        </select>


        <input class="dashboard-link" type="submit" value="Create Patient Account">

    </form>


    <p>
        Already have an account?
    </p>

    <a class="dashboard-link" href="patientLogin.jsp">
        Patient Login
    </a>

    <br>

    <a href="index.jsp">
        ← Back to Home
    </a>

</div>


<div class="footer">

    <p>© 2026 MediConnect Pro | Digital Healthcare Portal</p>

</div>

</div>

</body>
</html>
