package com.example.mediconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.example.mediconnect.model.Doctor;

public class DoctorDAO {

    public boolean registerDoctor(Doctor d) {

        String sql = "INSERT INTO doctor(name, email, password, specialization, phone) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, d.getName());
            ps.setString(2, d.getEmail());
            ps.setString(3, d.getPassword());
            ps.setString(4, d.getSpecialization());
            ps.setString(5, d.getPhone());

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
