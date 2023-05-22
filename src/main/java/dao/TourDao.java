/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

        List<Tour> tours = new ArrayList<Tour>();
        try {

            query = "SELECT *, place.placeName, hotel.hotelName\n"
                    + "FROM tour\n"
                    + "JOIN place ON tour.placeId = place.placeId \n"
                    + "JOIN hotel ON tour.hotelId = hotel.hotelId";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Tour row = new Tour();
                row.setTourName(rs.getString("name"));
                row.setTourId(rs.getInt("tourId"));
                row.setImageTour(rs.getString("image"));
                row.setPrice(rs.getFloat("price"));
                row.setDateStart(rs.getDate("dateStart"));
                row.setDateEnd(rs.getDate("dateEnd"));
                row.setDetailTour(rs.getString("detail"));
                row.setStatusTour(rs.getBoolean("status"));
                row.setPlaceName(rs.getString("placeName"));
                row.setHotelName(rs.getString("hotelName"));

                tours.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return tours;
    }

//    public List<Tour> getTours(ArrayList<Tour> tourList) {
//        List<Tour> tours = new ArrayList<>();
//        try {
//            if (tourList.size() > 0) {
//                for (Tour item : tourList) {
//                    query = "select * from tour where id=?";
//                    pst = this.con.prepareStatement(query);
//                    pst.setInt(1, item.getId());
//                    rs = pst.executeQuery();
//                    while (rs.next()) {
//                        Cart row = new Cart();
//                        row.setImg_link(rs.getString("img_link"));
//                        row.setId(rs.getInt("id"));
//                        row.setName(rs.getString("name"));
//                        row.setPrice(rs.getDouble("price") * item.getQuantity());
//                        row.setQuantity(item.getQuantity());
//                        products.add(row);
//                    }
//
//                }
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//        return products;
//    }
    public Tour getSingleTour(int id) {
        Tour row = null;
        try {
            query = "select * from tour where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Tour();
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

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
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
}
