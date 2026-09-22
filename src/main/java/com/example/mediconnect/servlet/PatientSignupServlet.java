package com.example.mediconnect.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.mediconnect.dao.PatientDAO;
import com.example.mediconnect.model.Patient;

@WebServlet("/PatientSignupServlet")
public class PatientSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        if (!phone.matches("[6-9][0-9]{9}")) 
        { response.getWriter().println("Invalid phone number"); 
        return; } 
        if (!password.matches("(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@#$%]).{8,}")) 
        { response.getWriter().println( "Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character" ); 
        return; }

        Patient p = new Patient(name, email, password, phone, gender);

        PatientDAO dao = new PatientDAO();

        if (dao.registerPatient(p)) {
            response.sendRedirect("patientLogin.jsp");
        } else {
            response.getWriter().println("Registration failed");
        }
    }
}
