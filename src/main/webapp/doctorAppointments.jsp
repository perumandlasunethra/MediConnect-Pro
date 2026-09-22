<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.mediconnect.dao.DBConnection" %>

<%
    if (session.getAttribute("doctorId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    int doctorId =
        (Integer) session.getAttribute("doctorId");
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

            <h1>My Appointments</h1>

            <p>
                View appointments booked by your patients
            </p>

        </div>

        <a class="logout-btn"
           href="LogoutServlet">

            Logout

        </a>

    </div>


    <div class="appointment-intro">

        <div>

            <h2>Patient Appointments</h2>

            <p>
                View your scheduled patient appointments,
                contact details, date, time and status.
            </p>

        </div>

    </div>


    <div class="appointment-table-container">

        <table class="appointment-table">

            <tr>

                <th>Patient Name</th>

                <th>Phone</th>

                <th>Date</th>

                <th>Time</th>

                <th>Status</th>

                <th>Action</th>

            </tr>


<%

    boolean hasAppointments = false;

    try {

        Connection con =
            DBConnection.getConnection();

        String sql =
            "SELECT a.appointment_id, " +
            "p.name, p.phone, " +
            "a.appointment_date, " +
            "a.appointment_time, " +
            "a.status " +
            "FROM appointment a " +
            "JOIN patient p " +
            "ON a.patient_id = p.patient_id " +
            "WHERE a.doctor_id = ? " +
            "ORDER BY a.appointment_date, " +
            "a.appointment_time";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, doctorId);

        ResultSet rs =
            ps.executeQuery();


        while (rs.next()) {

            hasAppointments = true;

            int appointmentId =
                rs.getInt("appointment_id");

            String status =
                rs.getString("status");

%>

            <tr>

                <td>

                    <strong>
                        <%= rs.getString("name") %>
                    </strong>

                </td>


                <td>

                    <%= rs.getString("phone") %>

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


                <td>

<%

                if ("Pending".equalsIgnoreCase(status)) {

%>

                    <form action="UpdateAppointmentStatusServlet"
                          method="post"
                          style="display:inline;">

                        <input type="hidden"
                               name="appointmentId"
                               value="<%= appointmentId %>">

                        <input type="hidden"
                               name="status"
                               value="Accepted">

                        <button type="submit"
                                class="accept-btn">

                            Accept

                        </button>

                    </form>


                    <form action="UpdateAppointmentStatusServlet"
                          method="post"
                          style="display:inline;">

                        <input type="hidden"
                               name="appointmentId"
                               value="<%= appointmentId %>">

                        <input type="hidden"
                               name="status"
                               value="Rejected">

                        <button type="submit"
                                class="reject-btn">

                            Reject

                        </button>

                    </form>

<%

                } else {

%>

                    <span>
                        No Action
                    </span>

<%

                }

%>

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

                <td colspan="6"
                    class="no-appointments">

                    No appointments found

                </td>

            </tr>

<%

        }


    } catch (Exception e) {

%>

        <tr>

            <td colspan="6"
                class="no-appointments">

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

        <a class="back-dashboard-btn"
           href="doctorDashboard.jsp">

            Back to Dashboard

        </a>

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

