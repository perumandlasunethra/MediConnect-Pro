package com.example.mediconnect.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.mediconnect.dao.DoctorDAO;
import com.example.mediconnect.model.Doctor;

@WebServlet("/DoctorSignupServlet")
public class DoctorSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone");
       
        if (!phone.matches("[6-9][0-9]{9}")) {
            response.getWriter().println("Invalid phone number");
            return;
        }

        if (!password.matches("(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#$%]).{8,}")) {
            response.getWriter().println(
                "Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character"
            );
            return;
        }
     


        Doctor d = new Doctor(name, email, password, specialization, phone);

        DoctorDAO dao = new DoctorDAO();

        if (dao.registerDoctor(d)) {
            response.sendRedirect("doctorLogin.jsp");
        } else {
            response.getWriter().println("Registration failed");
        }
    }
}