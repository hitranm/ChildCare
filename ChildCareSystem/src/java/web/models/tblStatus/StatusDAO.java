/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblStatus;

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
 * @author DELL
 */
public class StatusDAO implements Serializable {
    public List<StatusDTO> viewBlogCategory() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select StatusID, StatusName "
                    + "From tblStatus";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            List<StatusDTO> list = new ArrayList<>();
            while (rs.next()) {
                String statusID = rs.getString("StatusID");
                String statusName = rs.getString("StatusName");
                StatusDTO dto = new StatusDTO(statusID, statusName);
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
}
