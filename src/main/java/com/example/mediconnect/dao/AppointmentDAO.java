package com.example.mediconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import com.example.mediconnect.model.Appointment;

public class AppointmentDAO {

    public String bookAppointment(Appointment a) {

        String sql = "INSERT INTO appointment " +
                     "(patient_id, doctor_id, appointment_date, appointment_time, status) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, a.getPatientId());
            ps.setInt(2, a.getDoctorId());
            ps.setString(3, a.getAppointmentDate());
            ps.setString(4, a.getAppointmentTime());
            ps.setString(5, a.getStatus());

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {
                return "success";
            }

        } catch (SQLIntegrityConstraintViolationException e) {

            return "duplicate";

        } catch (Exception e) {

            e.printStackTrace();
        }

        return "error";
    }
}

