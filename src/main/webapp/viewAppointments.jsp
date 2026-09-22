<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.mediconnect.dao.DBConnection" %>

<%
if (session.getAttribute("patientId") == null) {
response.sendRedirect("patientLogin.jsp");
return;
}


int patientId = (Integer) session.getAttribute("patientId");


%>

<!DOCTYPE html>

<html>

<head>


<title>My Appointments - MediConnect Pro</title>

<link rel="stylesheet" href="css/style.css">


</head>

<body>

<div class="dashboard-container">

<div class="dashboard-header">

    <div>
        <h1>My Appointments </h1>
        <p>View and manage your scheduled appointments</p>
    </div>

    <a class="logout-btn" href="LogoutServlet">
        Logout
    </a>

</div>


<div class="appointment-intro">

    <div class="appointment-icon">
        
    </div>

    <div>
        <h2>Appointment History</h2>

        <p>
            Here you can view your doctor, appointment date,
            time and current status.
        </p>
    </div>

</div>


<div class="appointment-table-container">

    <table class="appointment-table">

        <tr>
            <th>Doctor</th>
            <th>Specialization</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>


<%
boolean hasAppointments = false;


try {

    Connection con = DBConnection.getConnection();

    String sql = "SELECT d.name, d.specialization, " +
                 "a.appointment_date, a.appointment_time, a.status " +
                 "FROM appointment a " +
                 "JOIN doctor d ON a.doctor_id = d.doctor_id " +
                 "WHERE a.patient_id = ? " +
                 "ORDER BY a.appointment_date, a.appointment_time";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setInt(1, patientId);

    ResultSet rs = ps.executeQuery();

    while (rs.next()) {

        hasAppointments = true;

        String status = rs.getString("status");


%>


        <tr>

            <td>
                <strong>Dr. <%= rs.getString("name") %></strong>
            </td>

            <td>
                <%= rs.getString("specialization") %>
            </td>

            <td>
                <%= rs.getDate("appointment_date") %>
            </td>

            <td>
                <%= rs.getTime("appointment_time") %>
            </td>

            <td>

                <span class="status-badge">
                    <%= status %>
                </span>

            </td>

        </tr>


<%
}


    rs.close();
    ps.close();
    con.close();

    if (!hasAppointments) {


%>


        <tr>

            <td colspan="5" class="no-appointments">
                📭 No appointments found
            </td>

        </tr>


<%
}


} catch (Exception e) {


%>


        <tr>

            <td colspan="5" class="no-appointments">
                Unable to load appointments
            </td>

        </tr>


<%
e.printStackTrace();
}
%>


</table>

</div>


<div class="appointment-actions">


<a class="book-btn" href="LoadDoctorsServlet">
    Book New Appointment
</a>

<a class="back-dashboard-btn" href="patientDashboard.jsp">
    Back to Dashboard
</a>


</div>



<div class="dashboard-footer">

    <p>
        © 2026 MediConnect Pro | Patient Healthcare Portal
    </p>

</div>


</div>

</body>

</html>
