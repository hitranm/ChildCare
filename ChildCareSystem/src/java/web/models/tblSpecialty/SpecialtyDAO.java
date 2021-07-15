/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblSpecialty;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class SpecialtyDAO implements Serializable {

    private List<SpecialtyDTO> listSpecialty;

    public List<SpecialtyDTO> getListSpecialty() {
        return listSpecialty;
    }

    public void displaySpecialtyList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            //2. Create query string
            String sql = "SELECT SpecialtyID, SpecialtyName "
                    + "FROM tblSpecialty";

            //3 Create statement
            stm = con.prepareStatement(sql);
            //4 Execute query
            rs = stm.executeQuery();
            //5 Process result set
            while (rs.next()) {
                int specialtyId = rs.getInt("SpecialtyID");
                String specialtyName = rs.getString("SpecialtyName");
                SpecialtyDTO dto = new SpecialtyDTO(specialtyId, specialtyName);
                if (this.listSpecialty == null) {
                    this.listSpecialty = new ArrayList<>();
                }
                this.listSpecialty.add(dto);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
    }

    public List<SpecialtyDTO> viewSpecialtyList() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select SpecialtyID, SpecialtyName "
                    + "From tblSpecialty";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            List<SpecialtyDTO> list = new ArrayList<>();
            while (rs.next()) {
                String specialID = rs.getString("SpecialtyID");
                String specialName = rs.getString("SpecialtyName");
                SpecialtyDTO dto = new SpecialtyDTO(Integer.parseInt(specialID), specialName);
                list.add(dto);
            }
            return list;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public SpecialtyDTO getSpecialtyById(int specialtyId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();

            String sql = "Select SpecialtyID, SpecialtyName "
                    + "From tblSpecialty "
                    + "Where SpecialtyID=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, specialtyId);
            rs = stm.executeQuery();
            if (rs.next()) {
                int specialID = rs.getInt("SpecialtyID");
                String specialName = rs.getString("SpecialtyName");
                SpecialtyDTO dto = new SpecialtyDTO(specialID, specialName);
                return dto;
            } else {
                return null;
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public SpecialtyDTO getSpecialtyName(String specialtyId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();

            String sql = "Select SpecialtyID, SpecialtyName "
                    + "From tblSpecialty "
                    + "Where SpecialtyID=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, specialtyId);
            rs = stm.executeQuery();
            if (rs.next()) {
                int specialID = rs.getInt("SpecialtyID");
                String specialName = rs.getString("SpecialtyName");
                SpecialtyDTO dto = new SpecialtyDTO(specialID, specialName);
                return dto;
            } else {
                return null;
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
        }
    }

    public boolean addSpecialty(String specialtyName) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblSpecialty "
                        + "(SpecialtyName) values(?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, specialtyName);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteSpecialty(String specialtyID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblSpecialty WHERE SpecialtyID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, specialtyID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public boolean updateSpecialty(String specialtyID, String specialtyName) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblSpecialty SET SpecialtyName=? "
                        + " WHERE SpecialtyID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, specialtyName);
                stm.setString(2, specialtyID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
