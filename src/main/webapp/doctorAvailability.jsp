<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.example.mediconnect.model.DoctorAvailability" %>

<%
    if (session.getAttribute("doctorId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    List<DoctorAvailability> weeklyAvailability =
        (List<DoctorAvailability>)
        request.getAttribute("weeklyAvailability");

    String[] days = {
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    };
%>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Weekly Availability - MediConnect Pro</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        .weekly-schedule-box {
            width: 850px;
            max-width: 95%;
            margin: 30px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.10);
        }

        .weekly-schedule-box h2 {
            margin-bottom: 10px;
        }

        .weekly-schedule-box p {
            margin-bottom: 25px;
        }

        .schedule-table {
            width: 100%;
            border-collapse: collapse;
        }

        .schedule-table th,
        .schedule-table td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .schedule-table th {
            font-weight: bold;
        }

        .schedule-table input[type="time"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .schedule-table input[type="checkbox"] {
            transform: scale(1.2);
        }

        .save-week-btn {
            margin-top: 25px;
            padding: 13px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        .schedule-actions {
            text-align: center;
            margin-top: 20px;
        }

    </style>


    <script>

        function enableTime(day) {

            var checkbox =
                document.getElementById(
                    day + "Available"
                );

            var start =
                document.getElementById(
                    day + "Start"
                );

            var end =
                document.getElementById(
                    day + "End"
                );

            if (checkbox.checked) {

                start.disabled = false;
                end.disabled = false;

            } else {

                start.disabled = true;
                end.disabled = true;

                start.value = "";
                end.value = "";
            }
        }

    </script>

</head>


<body>

<div class="dashboard-container">


    <div class="dashboard-header">

        <div>

            <h1>Manage Weekly Availability</h1>

            <p>
                Set and update your complete weekly
                consultation schedule
            </p>

        </div>

        <a class="logout-btn"
           href="LogoutServlet">

            Logout

        </a>

    </div>


    <div class="weekly-schedule-box">

        <h2>Weekly Doctor Schedule</h2>

        <p>
            Select the days you are available and
            enter your consultation timings.
        </p>


        <form action="DoctorAvailabilityServlet"
              method="post">


            <table class="schedule-table">

                <tr>

                    <th>Day</th>

                    <th>Available</th>

                    <th>Start Time</th>

                    <th>End Time</th>

                </tr>


<%
    for (String day : days) {

        boolean available = false;

        String startTime = "";
        String endTime = "";

        if (weeklyAvailability != null) {

            for (DoctorAvailability a :
                 weeklyAvailability) {

                if (day.equals(
                    a.getDayOfWeek())) {

                    available = true;

                    startTime =
                        a.getStartTime();

                    endTime =
                        a.getEndTime();

                    break;
                }
            }
        }
%>

                <tr>

                    <td>
                        <%= day %>
                    </td>


                    <td>

                        <input type="checkbox"
                               id="<%= day %>Available"
                               name="days"
                               value="<%= day %>"
                               onclick="enableTime('<%= day %>')"
                               <%= available ? "checked" : "" %>>

                    </td>


                    <td>

                        <input type="time"
                               id="<%= day %>Start"
                               name="<%= day %>Start"
                               value="<%= startTime %>"
                               <%= available ? "" : "disabled" %>>

                    </td>


                    <td>

                        <input type="time"
                               id="<%= day %>End"
                               name="<%= day %>End"
                               value="<%= endTime %>"
                               <%= available ? "" : "disabled" %>>

                    </td>

                </tr>

<%
    }
%>

            </table>


            <div class="schedule-actions">

                <input type="submit"
                       class="save-week-btn"
                       value="Save Weekly Schedule">

            </div>

        </form>

    </div>


    <div class="booking-actions">

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

