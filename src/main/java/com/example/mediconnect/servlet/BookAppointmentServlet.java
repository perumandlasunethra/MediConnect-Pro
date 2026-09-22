package com.example.mediconnect.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.mediconnect.dao.AppointmentDAO;
import com.example.mediconnect.model.Appointment;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("patientId") == null) {

            response.sendRedirect("patientLogin.jsp");
            return;
        }

        int patientId =
            (Integer) session.getAttribute("patientId");

        int doctorId =
            Integer.parseInt(
                request.getParameter("doctorId")
            );

        String appointmentDate =
            request.getParameter("appointmentDate");

        String appointmentTime =
            request.getParameter("appointmentTime");

        Appointment appointment =
            new Appointment(
                patientId,
                doctorId,
                appointmentDate,
                appointmentTime,
                "Pending"
            );

        AppointmentDAO dao =
            new AppointmentDAO();

        String result =
            dao.bookAppointment(appointment);


        if (result.equals("success")) {

            response.sendRedirect(
                "viewAppointments.jsp"
            );


        } else if (result.equals("duplicate")) {

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<!DOCTYPE html>" +
                "<html>" +

                "<head>" +

                "<title>Slot Already Booked</title>" +

                "<link rel='stylesheet' " +
                "href='css/style.css'>" +

                "</head>" +

                "<body>" +

                "<div class='booking-error-container'>" +

                "<div class='booking-error-card'>" +

                "<h2>This time slot is already booked.</h2>" +

                "<p>Please select another available time slot.</p>" +

                "<a class='back-dashboard-btn' " +
                "href='LoadDoctorsServlet'>" +

                "Back to Booking" +

                "</a>" +

                "</div>" +

                "</div>" +

                "</body>" +

                "</html>"
            );


        } else {

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<!DOCTYPE html>" +
                "<html>" +

                "<head>" +

                "<title>Booking Failed</title>" +

                "<link rel='stylesheet' " +
                "href='css/style.css'>" +

                "</head>" +

                "<body>" +

                "<div class='booking-error-container'>" +

                "<div class='booking-error-card'>" +

                "<h2>Appointment Booking Failed</h2>" +

                "<p>Something went wrong. Please try again.</p>" +

                "<a class='back-dashboard-btn' " +
                "href='LoadDoctorsServlet'>" +

                "Back to Booking" +

                "</a>" +

                "</div>" +

                "</div>" +

                "</body>" +

                "</html>"
            );
        }
    }
}

