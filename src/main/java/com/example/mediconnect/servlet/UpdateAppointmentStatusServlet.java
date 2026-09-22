package com.example.mediconnect.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.mediconnect.dao.DBConnection;

@WebServlet("/UpdateAppointmentStatusServlet")
public class UpdateAppointmentStatusServlet extends HttpServlet {

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

        int appointmentId =
            Integer.parseInt(
                request.getParameter("appointmentId")
            );

        String status =
            request.getParameter("status");

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "UPDATE appointment " +
                "SET status=? " +
                "WHERE appointment_id=? " +
                "AND doctor_id=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, appointmentId);
            ps.setInt(3, doctorId);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect(
                "doctorAppointments.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to update appointment status"
            );
        }
    }
}


