package com.example.mediconnect.servlet;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.mediconnect.dao.DoctorAvailabilityDAO;

@WebServlet("/GetAvailableSlotsServlet")
public class GetAvailableSlotsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String doctorIdText =
            request.getParameter("doctorId");

        String dayOfWeek =
            request.getParameter("dayOfWeek");

        String appointmentDate =
            request.getParameter("appointmentDate");

        if (doctorIdText == null ||
            dayOfWeek == null ||
            appointmentDate == null ||
            doctorIdText.isEmpty() ||
            dayOfWeek.isEmpty() ||
            appointmentDate.isEmpty()) {

            return;
        }

        int doctorId =
            Integer.parseInt(doctorIdText);

        DoctorAvailabilityDAO dao =
            new DoctorAvailabilityDAO();

        List<String[]> availability =
            dao.getAvailability(doctorId, dayOfWeek);

        DateTimeFormatter formatter =
            DateTimeFormatter.ofPattern("HH:mm:ss");

        for (String[] time : availability) {

            LocalTime start =
                LocalTime.parse(time[0], formatter);

            LocalTime end =
                LocalTime.parse(time[1], formatter);

            LocalTime current = start;

            while (current.isBefore(end)) {

                String slot =
                    current.toString();

                boolean booked =
                    dao.isSlotBooked(
                        doctorId,
                        appointmentDate,
                        slot
                    );

                if (!booked) {

                    String display =
                        current.format(
                            DateTimeFormatter.ofPattern(
                                "hh:mm a"
                            )
                        );

                    response.getWriter().println(
                        "<option value=\"" +
                        slot +
                        "\">" +
                        display +
                        "</option>"
                    );
                }

                current =
                    current.plusMinutes(30);
            }
        }
    }
}

