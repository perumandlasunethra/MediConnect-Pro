package com.example.mediconnect.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.mediconnect.dao.DoctorAvailabilityDAO;
import com.example.mediconnect.model.DoctorAvailability;

@WebServlet("/DoctorAvailabilityServlet")
public class DoctorAvailabilityServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("doctorId") == null) {

            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        int doctorId =
            (Integer) session.getAttribute("doctorId");

        DoctorAvailabilityDAO dao =
            new DoctorAvailabilityDAO();

        request.setAttribute(
            "weeklyAvailability",
            dao.getWeeklyAvailability(doctorId)
        );

        request.getRequestDispatcher(
            "doctorAvailability.jsp"
        ).forward(request, response);
    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("doctorId") == null) {

            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        int doctorId =
            (Integer) session.getAttribute("doctorId");

        String[] days =
            request.getParameterValues("days");

        DoctorAvailabilityDAO dao =
            new DoctorAvailabilityDAO();

        boolean success = true;

        if (!dao.deleteWeeklyAvailability(doctorId)) {

            success = false;
        }

        if (success && days != null) {

            for (String day : days) {

                String startTime =
                    request.getParameter(
                        day + "Start"
                    );

                String endTime =
                    request.getParameter(
                        day + "End"
                    );

                if (startTime == null ||
                    endTime == null ||
                    startTime.isEmpty() ||
                    endTime.isEmpty()) {

                    success = false;
                    continue;
                }

                DoctorAvailability availability =
                    new DoctorAvailability(
                        doctorId,
                        day,
                        startTime,
                        endTime
                    );

                if (!dao.saveAvailability(
                        availability)) {

                    success = false;
                }
            }
        }

        if (success) {

            response.sendRedirect(
                "DoctorAvailabilityServlet"
            );

        } else {

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<h3>Unable to save weekly schedule.</h3>" +
                "<a href='DoctorAvailabilityServlet'>" +
                "Go Back" +
                "</a>"
            );
        }
    }
}

