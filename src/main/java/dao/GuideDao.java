/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.GuideTour;
import model.Tour;

/**
 *
 * @author DELL
 */
public class GuideDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public GuideDao(Connection con) {
        this.con = con;
    }

    public GuideDao() {
    }

    public List<GuideTour> getAllGuides() {

        List<GuideTour> guides = new ArrayList<GuideTour>();
        try {

            query = " SELECT * from tourGuider";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                GuideTour row = new GuideTour();
                row.setGuideId(rs.getInt("guideId"));
                row.setGuideName(rs.getString("guideName"));
                row.setGuideAge(rs.getInt("guideAge"));
                row.setGuideImage(rs.getString("guideImage"));

                row.setGuideEmail(rs.getString("guideEmail"));
                row.setGuidePhone(rs.getString("guidePhone"));

                guides.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return guides;
    }

}
