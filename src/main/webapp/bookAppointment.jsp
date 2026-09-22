
<%@ page import="java.util.List" %>
<%@ page import="com.example.mediconnect.model.Doctor" %>

<%
    if (session.getAttribute("patientId") == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }

    List<Doctor> doctors =
        (List<Doctor>) request.getAttribute("doctors");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Book Appointment - MediConnect Pro</title>

    <link rel="stylesheet" href="css/style.css">

    <script>

        function loadSlots() {

            var doctor =
                document.getElementById("doctorId").value;

            var date =
                document.getElementById("appointmentDate").value;

            var slot =
                document.getElementById("appointmentTime");

            slot.innerHTML =
                '<option value="">Select Time Slot</option>';

            if (doctor === "" || date === "") {
                return;
            }

            var selectedDate =
                new Date(date + "T00:00:00");

            var days = [
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday"
            ];

            var dayOfWeek =
                days[selectedDate.getDay()];

            fetch(
            	    "GetAvailableSlotsServlet?doctorId=" +
            	    doctor +
            	    "&dayOfWeek=" +
            	    dayOfWeek +
            	    "&appointmentDate=" +
            	    date
            	)
            .then(response => response.text())
            .then(data => {

                if (data.trim() === "") {

                    slot.innerHTML =
                        '<option value="">Doctor not available on this day</option>';

                } else {

                    slot.innerHTML =
                        '<option value="">Select Time Slot</option>' +
                        data;
                }

            })
            .catch(error => {

                slot.innerHTML =
                    '<option value="">Unable to load slots</option>';

            });
        }

    </script>

</head>

<body>

<div class="dashboard-container">

    <div class="dashboard-header">

        <div>

            <h1>Book Appointment</h1>

            <p>
                Schedule an appointment with your doctor
            </p>

        </div>

        <a class="logout-btn"
           href="LogoutServlet">
            Logout
        </a>

    </div>


    <div class="booking-box">

        <div class="booking-title">

            <div class="booking-icon">
                Health
            </div>

            <div>

                <h2>Your Health, Your Time</h2>

                <p>
                    Choose a doctor, date and available
                    consultation slot.
                </p>

            </div>

        </div>


        <form action="BookAppointmentServlet"
              method="post">


            <label>Select Doctor</label>

            <select id="doctorId"
                    name="doctorId"
                    onchange="loadSlots()"
                    required>

                <option value="">
                    Select Doctor
                </option>

                <%
                    if (doctors != null) {

                        for (Doctor d : doctors) {
                %>

                <option value="<%= d.getDoctorId() %>">

                    Dr. <%= d.getName() %> -
                    <%= d.getSpecialization() %>

                </option>

                <%
                        }
                    }
                %>

            </select>


            <label>
                Appointment Date
            </label>

            <input type="date"
                   id="appointmentDate"
                   name="appointmentDate"
                   onchange="loadSlots()"
                   required>


            <label>
                Available Time Slot
            </label>

            <select id="appointmentTime"
                    name="appointmentTime"
                    required>

                <option value="">
                    Select Doctor and Date First
                </option>

            </select>


            <input type="submit"
                   class="book-appointment-btn"
                   value="Book Appointment">

        </form>

    </div>


    <div class="booking-actions">

        <a class="back-dashboard-btn"
           href="patientDashboard.jsp">
            Back to Dashboard
        </a>

        <a class="back-dashboard-btn"
           href="viewAppointments.jsp">
            My Appointments
        </a>

    </div>


    <div class="dashboard-footer">

        <p>
            © 2026 MediConnect Pro |
            Patient Healthcare Portal
        </p>

    </div>

</div>

</body>

</html>
