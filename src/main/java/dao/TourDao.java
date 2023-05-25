/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tour;

/**
 *
 * @author DELL
 */
public class TourDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public TourDao(Connection con) {
        this.con = con;
    }

    public TourDao() {
    }

    public List<Tour> getAllTours() {
        List<Tour> tours = new ArrayList<>();

        try ( PreparedStatement pst = con.prepareStatement(
                "SELECT *, place.placeName, hotel.hotelName\n"
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId\n"
                + "JOIN hotel ON tour.hotelId = hotel.hotelId\n"
                + "JOIN region ON tour.regionId = region.regionId");  ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Tour tour = extractTourFromResultSet(rs);
                tours.add(tour);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return tours;
    }

    private Tour extractTourFromResultSet(ResultSet rs) throws SQLException {
        Tour tour = new Tour();
        tour.setTourId(rs.getInt("tourId"));
        tour.setTourName(rs.getString("name"));
        tour.setImageTour(rs.getString("image"));
        tour.setPrice(rs.getFloat("price"));
        tour.setDateStart(rs.getDate("dateStart"));
        tour.setDateEnd(rs.getDate("dateEnd"));
        tour.setDetailTour(rs.getString("detail"));
        tour.setStatusTour(rs.getBoolean("status"));
        tour.setPlaceName(rs.getString("placeName"));
        tour.setHotelName(rs.getString("hotelName"));
        tour.setRegionName(rs.getString("regionName"));

        // Tính toán lịch trình từ dateStart đến dateEnd
        Date startDate = rs.getDate("dateStart");
        Date endDate = rs.getDate("dateEnd");
        int numberOfDays = calculateNumberOfDays(startDate, endDate);

        // Thiết lập lịch trình và số ngày chuyến đi
        List<String> schedule = generateSchedule(numberOfDays);
        tour.setSchedule(schedule);
        tour.setNumberDay(numberOfDays);

        return tour;
    }

    private int calculateNumberOfDays(Date startDate, Date endDate) {
        long timeDifference = endDate.getTime() - startDate.getTime();
        return (int) TimeUnit.DAYS.convert(timeDifference, TimeUnit.MILLISECONDS);
    }

    private List<String> generateSchedule(int numberOfDays) {
        List<String> schedule = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();

        for (int i = 0; i < numberOfDays; i++) {
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            String day = "Day " + (i + 1) + ": " + "Visit a tourist attraction";
            schedule.add(day);
        }

        return schedule;
    }

    public int getAllToursCount() {
        int count = 0;
        try {
            query = "SELECT COUNT(*) AS count FROM tour";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return count;
    }

    public Tour getTourByID(int id) {

        String query = "SELECT *, place.placeName, hotel.hotelName\n"
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId \n"
                + "JOIN hotel ON tour.hotelId = hotel.hotelId\n"
                + "where tourId = ?";
        try {
            this.con = DbCon.getConnection();

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                return new Tour(rs.getInt("tourId"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getDate("dateStart"),
                        rs.getDate("dateEnd"),
                        rs.getString("detail"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getString("placeName"),
                        rs.getString("hotelName"));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Tour getLast() {
//        String query = "select top 1 * from tour\n"
//                + "order by tourId desc";
        String query = "SELECT top 1 *, place.placeName, hotel.hotelName\n"
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId \n"
                + "JOIN hotel ON tour.hotelId = hotel.hotelId\n"
                + "order by tourId desc";
        try {
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                return new Tour(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Tour> getTop4() {
        List<Tour> list = new ArrayList<>();
        String query = "select top 4 * from tour";
        try {
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Tour(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10)));

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Tour> getSearch(String searchStr) {
        List<Tour> list = new ArrayList<>();

        String query = "SELECT *\n"
                + "FROM tour\n"
                + "JOIN place ON tour.placeId = place.placeId\n"
                + "JOIN hotel ON tour.hotelId = hotel.hotelId\n"
                + "JOIN region ON tour.regionId = region.regionId\n"
                + "WHERE name LIKE ?;";
        try {
            this.con = DbCon.getConnection();
            pst = this.con.prepareStatement(query);
            pst.setString(1, "%" + searchStr + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Tour row = new Tour();
                row.setTourId(rs.getInt("tourId"));
                row.setTourName(rs.getString("name"));
                row.setImageTour(rs.getString("image"));
                row.setPrice(rs.getFloat("price"));
                row.setDateStart(rs.getDate("dateStart"));
                row.setDateEnd(rs.getDate("dateEnd"));
                row.setDetailTour(rs.getString("detail"));
                row.setStatusTour(rs.getBoolean("status"));
                row.setPlaceName(rs.getString("placeName"));
                row.setHotelName(rs.getString("hotelName"));
                row.setRegionName(rs.getString("regionName"));

                list.add(row);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TourDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TourDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
