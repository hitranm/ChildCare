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
            while (rs != null) {
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
}
