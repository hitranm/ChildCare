/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblOpenTime;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.models.tblSpecialty.SpecialtyDTO;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class OpenTimeDAO implements Serializable {

    private List<OpenTimeDTO> listTime;

    public List<OpenTimeDTO> getListTime() {
        return listTime;
    }

    public List<OpenTimeDTO> viewTimeList() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select OpenTimeID, OpenTime "
                    + "From tblOpenTime";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            List<OpenTimeDTO> list = new ArrayList<>();
            while (rs.next()) {
                String openTimeId = rs.getString("OpenTimeID");
                Time openTime = rs.getTime("OpenTime");
                OpenTimeDTO dto = new OpenTimeDTO(Integer.parseInt(openTimeId), openTime.toString());
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

    public String getTimeString(int openTimeId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String openTime = "";
        try {
            con = DBHelpers.makeConnection();
            String sql = "Select OpenTime "
                    + "From tblOpenTime "
                    + "Where OpenTimeID=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, openTimeId);
            rs = stm.executeQuery();
            if (rs.next()) {
                openTime = rs.getTime("OpenTime").toString();
                return openTime;
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
        return openTime;
    }
}
