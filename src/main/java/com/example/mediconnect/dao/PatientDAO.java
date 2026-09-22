package com.example.mediconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.example.mediconnect.model.Patient;

public class PatientDAO {

    public boolean registerPatient(Patient p) {

        String sql = "INSERT INTO patient(name, email, password, phone, gender) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPassword());
            ps.setString(4, p.getPhone());
            ps.setString(5, p.getGender());

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