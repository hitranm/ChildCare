/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblService;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class ServiceDAO implements Serializable {
    public boolean AddNewService(ServiceDTO serviceDTO) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            //1. Connect Db;
            con =  DBHelpers.makeConnection();
            //2. Create query string
            String query = "INSERT INTO "
                    + "tblService (ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            //3 Create statement and assign value
            stm = con.prepareStatement(query);
            stm.setString(1, serviceDTO.getServiceName());
            stm.setString(2, serviceDTO.getSpecialtyId());
            stm.setString(3, serviceDTO.getThumbnail());
            stm.setString(4, serviceDTO.getDescription());
            stm.setDouble(5, serviceDTO.getPrice());
            stm.setDouble(6, serviceDTO.getSalePrice());
            stm.setString(7, serviceDTO.getStatusId());
            stm.setString(8, serviceDTO.getCreatedDate());
            stm.setString(9, serviceDTO.getCreatePersonId());
            
            //4 Execute query
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
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
