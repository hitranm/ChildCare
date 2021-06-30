/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblSystemSetting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author nguye
 */
public class SystemSettingDAO {
     public boolean addSystemSetting(SystemSettingDTO config) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblSystemSetting(SettingName, SettingValue, AdminID) VALUES(?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, config.getSettingName());
                stm.setString(2, config.getSettingValue());
                stm.setInt(3,config.getAdminID());
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
}
