package com.example.mediconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.mediconnect.model.DoctorAvailability;

public class DoctorAvailabilityDAO {

    public boolean saveAvailability(DoctorAvailability a) {

        String sql =
            "INSERT INTO doctor_availability " +
            "(doctor_id, day_of_week, start_time, end_time) " +
            "VALUES (?, ?, ?, ?)";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, a.getDoctorId());
            ps.setString(2, a.getDayOfWeek());
            ps.setString(3, a.getStartTime());
            ps.setString(4, a.getEndTime());

            int rows =
                ps.executeUpdate();

            ps.close();
            con.close();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    public List<String[]> getAvailability(
            int doctorId,
            String dayOfWeek) {

        List<String[]> availability =
            new ArrayList<>();

        String sql =
            "SELECT start_time, end_time " +
            "FROM doctor_availability " +
            "WHERE doctor_id = ? " +
            "AND day_of_week = ?";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, doctorId);
            ps.setString(2, dayOfWeek);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                String[] time =
                    new String[2];

                time[0] =
                    rs.getString("start_time");

                time[1] =
                    rs.getString("end_time");

                availability.add(time);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return availability;
    }


    public boolean isSlotBooked(
            int doctorId,
            String appointmentDate,
            String appointmentTime) {

        String sql =
            "SELECT appointment_id " +
            "FROM appointment " +
            "WHERE doctor_id = ? " +
            "AND appointment_date = ? " +
            "AND appointment_time = ?";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, doctorId);
            ps.setString(2, appointmentDate);
            ps.setString(3, appointmentTime);

            ResultSet rs =
                ps.executeQuery();

            boolean booked =
                rs.next();

            rs.close();
            ps.close();
            con.close();

            return booked;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    public List<DoctorAvailability> getWeeklyAvailability(
            int doctorId) {

        List<DoctorAvailability> list =
            new ArrayList<>();

        String sql =
            "SELECT availability_id, doctor_id, " +
            "day_of_week, start_time, end_time " +
            "FROM doctor_availability " +
            "WHERE doctor_id = ? " +
            "ORDER BY availability_id";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, doctorId);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                DoctorAvailability a =
                    new DoctorAvailability();

                a.setAvailabilityId(
                    rs.getInt("availability_id")
                );

                a.setDoctorId(
                    rs.getInt("doctor_id")
                );

                a.setDayOfWeek(
                    rs.getString("day_of_week")
                );

                a.setStartTime(
                    rs.getString("start_time")
                );

                a.setEndTime(
                    rs.getString("end_time")
                );

                list.add(a);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }


    public boolean deleteWeeklyAvailability(
            int doctorId) {

        String sql =
            "DELETE FROM doctor_availability " +
            "WHERE doctor_id = ?";

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, doctorId);

            ps.executeUpdate();

            ps.close();
            con.close();

            return true;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}

