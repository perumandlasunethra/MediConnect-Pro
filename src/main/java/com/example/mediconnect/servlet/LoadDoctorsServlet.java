package com.example.mediconnect.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.mediconnect.dao.DBConnection;
import com.example.mediconnect.model.Doctor;

@WebServlet("/LoadDoctorsServlet")
public class LoadDoctorsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Doctor> doctors = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM doctor";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Doctor d = new Doctor();

                d.setDoctorId(rs.getInt("doctor_id"));
                d.setName(rs.getString("name"));
                d.setEmail(rs.getString("email"));
                d.setSpecialization(rs.getString("specialization"));
                d.setPhone(rs.getString("phone"));

                doctors.add(d);
            }

            rs.close();
            ps.close();
            con.close();

            request.setAttribute("doctors", doctors);

            request.getRequestDispatcher("bookAppointment.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Unable to load doctors");
        }
    }
}
