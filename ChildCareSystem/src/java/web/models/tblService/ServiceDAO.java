/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblService;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.models.tblSpecialty.SpecialtyDTO;
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
            con = DBHelpers.makeConnection();
            //2. Create query string
            String query = "INSERT INTO "
                    + "tblService (ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, UpdatedDate, CreatedPersonID) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            stm.setString(9, serviceDTO.getUpdatedDate());
            stm.setString(10, serviceDTO.getCreatePersonId());

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

    public int countService() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblService WHERE StatusID=1";
                //3. create statement and assign value to parameters
                stm = con.prepareStatement(sql);
                //4. execute query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    return rs.getInt(1);
                } //end while traversing result
            } //end if con iss opened
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
        return 0;
    }
    private List<ServiceDTO> serviceList;

    public List<ServiceDTO> getServiceList() {
        return serviceList;
    }

    public void viewServiceList(int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "select ServiceID, ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID "
                    + "from (select ROW_NUMBER() over (order by ServiceID asc) as r, * "
                    + "from tblService) as x "
                    + "where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setInt(1, index);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyID = rs.getString("SpecialtyID");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                Double price = rs.getDouble("Price");
                Double sale = rs.getDouble("SalePrice");
                String authorID = rs.getString("CreatedPersonID");
                String date = rs.getString("CreatedDate");
                String statusID = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date);
                if (this.serviceList == null) {
                    this.serviceList = new ArrayList<>();
                }
                this.serviceList.add(dto);
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

    public void viewServicebyStatus(int index, String statusID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "select ServiceID, ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID "
                    + "from (select ROW_NUMBER() over (order by ServiceID asc) as r, * "
                    + "from tblService WHERE StatusID=?) as x "
                    + "where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setString(1, statusID);
            stm.setInt(2, index);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyID = rs.getString("SpecialtyID");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                Double price = rs.getDouble("Price");
                Double sale = rs.getDouble("SalePrice");
                String authorID = rs.getString("CreatedPersonID");
                String date = rs.getString("CreatedDate");
                ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date);
                if (this.serviceList == null) {
                    this.serviceList = new ArrayList<>();
                }
                this.serviceList.add(dto);
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

    public ServiceDTO getServiceDetail(String serviceID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Select ServiceID, ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID "
                        + "From tblService Where ServiceID = ?";
                stm = con.prepareStatement(sql);

                stm.setString(1, serviceID);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String serviceName = rs.getString("ServiceName");
                    String specialtyID = rs.getString("SpecialtyID");
                    String thumbnail = rs.getString("Thumbnail");
                    String description = rs.getString("Description");
                    Double price = rs.getDouble("Price");
                    Double sale = rs.getDouble("SalePrice");
                    String authorID = rs.getString("CreatedPersonID");
                    String date = rs.getString("CreatedDate");
                    String statusID = rs.getString("StatusID");
                    ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date);
                    return dto;
                }
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
        return null;
    }

    public int countSearch(String searchValue) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblService "
                        + "Where ServiceName Like ?";
                //3. create statement and assign value to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. execute query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    return rs.getInt(1);
                } //end while traversing result
            } //end if con iss opened
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
        return 0;
    }

    public void searchService(String searchValue, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            String sql = "select ServiceID, ServiceName, SpecialtyID, Thumbnail, Description, Price, SalePrice, StatusID, CreatedDate, CreatedPersonID "
                    + "from (select ROW_NUMBER() over (order by ServiceID asc) as r, * \n"
                    + "from tblService where ServiceName like ?) as x where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyID = rs.getString("SpecialtyID");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                Double price = rs.getDouble("Price");
                Double sale = rs.getDouble("SalePrice");
                String authorID = rs.getString("CreatedPersonID");
                String date = rs.getString("CreatedDate");
                String statusID = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date);
                if (this.serviceList == null) {
                    this.serviceList = new ArrayList<>();
                }
                this.serviceList.add(dto);

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

    public void viewServiceList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select ServiceID, ServiceName, SpecialtyID, Thumbnail, "
                    + "Description, Price, SalePrice, StatusID, CreatedDate, UpdatedDate, CreatedPersonID "
                    + "From tblService ORDER BY UpdatedDate DESC";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyID = rs.getString("SpecialtyID");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                Double price = rs.getDouble("Price");
                Double sale = rs.getDouble("SalePrice");
                String authorID = rs.getString("CreatedPersonID");
                String date = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");
                String statusID = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date, updatedDate);
                if (this.serviceList == null) {
                    this.serviceList = new ArrayList<>();
                }
                this.serviceList.add(dto);

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

    public List<ServiceDTO> getTopXServiceList(int top) throws SQLException, NamingException {
        List<ServiceDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP(?) ServiceID, ServiceName,Thumbnail,CreatedDate"
                        + " FROM tblService ORDER BY CreatedDate DESC ";
                stm = conn.prepareStatement(sql);
                            int numberOfBlogView = 6;
                stm.setInt(1, top);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String serviceID = rs.getString("ServiceID");
                    String serviceName = rs.getString("ServiceName");
                    String thumbnail = rs.getString("Thumbnail");
                    String createdDate = rs.getString("CreatedDate");
                    ServiceDTO dto = new ServiceDTO(serviceID,serviceName, thumbnail, createdDate);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<ServiceDTO> getListService() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select ServiceID, ServiceName, SpecialtyID, Price, StatusID "
                    + "From tblService";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            List<ServiceDTO> list = new ArrayList<>();
            while (rs.next()) {
                String serivceId = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyId = rs.getString("SpecialtyID");
                double price = Double.parseDouble(rs.getString("Price"));
                String statusId = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serivceId, serviceName, specialtyId, price, statusId);
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

    public ServiceDTO getServiceInfo(int serviceId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            String sql = "Select ServiceID, ServiceName, SpecialtyID, Price, StatusID "
                    + "From tblService "
                    + "Where ServiceID=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, serviceId);
            rs = stm.executeQuery();

            if (rs.next()) {
                String serivceId = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyId = rs.getString("SpecialtyID");
                double price = Double.parseDouble(rs.getString("Price"));
                String statusId = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serivceId, serviceName, specialtyId, price, statusId);
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

    public String getServiceNameById(int serviceId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            String sql = "Select ServiceName "
                    + "From tblService "
                    + "Where ServiceID=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, serviceId);
            rs = stm.executeQuery();

            if (rs.next()) {
                String serviceName = rs.getString("ServiceName");
                return serviceName;
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

    public boolean updateService(ServiceDTO serviceDTO) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            //1. Connect Db;
            con = DBHelpers.makeConnection();
            //2. Create query string
            String query = "UPDATE tblService "
                    + "SET ServiceName=?, SpecialtyID=?, Thumbnail=?, "
                    + "Description=?, Price=?, SalePrice=?, StatusID=?, UpdatedDate=? "
                    + "WHERE ServiceID=?";

            //3 Create statement and assign value
            stm = con.prepareStatement(query);
            stm.setString(1, serviceDTO.getServiceName());
            stm.setString(2, serviceDTO.getSpecialtyId());
            stm.setString(3, serviceDTO.getThumbnail());
            stm.setString(4, serviceDTO.getDescription());
            stm.setDouble(5, serviceDTO.getPrice());
            stm.setDouble(6, serviceDTO.getSalePrice());
            stm.setString(7, serviceDTO.getStatusId());
            stm.setString(8, serviceDTO.getUpdatedDate());
            stm.setString(9, serviceDTO.getServiceId());

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

    public boolean deleteService(String serviceID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblService WHERE ServiceID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, serviceID);
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

    public boolean setStatus(String serviceID, String statusID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Update tblService "
                        + "Set StatusID=? "
                        + "Where ServiceID=?";

                stm = con.prepareStatement(sql);
                stm.setString(1, statusID);
                stm.setString(2, serviceID);
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

    public void getServicebyStaff(String staffID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select ServiceID, ServiceName, SpecialtyID, Thumbnail, "
                    + "Description, Price, SalePrice, StatusID, CreatedDate, UpdatedDate, CreatedPersonID "
                    + "From tblService ORDER BY UpdatedDate DESC";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String serviceID = rs.getString("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String specialtyID = rs.getString("SpecialtyID");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                Double price = rs.getDouble("Price");
                Double sale = rs.getDouble("SalePrice");
                String authorID = rs.getString("CreatedPersonID");
                String date = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");
                String statusID = rs.getString("StatusID");
                ServiceDTO dto = new ServiceDTO(serviceID, serviceName, specialtyID, thumbnail, description, price, sale, statusID, authorID, date, updatedDate);
                if (this.serviceList == null) {
                    this.serviceList = new ArrayList<>();
                }
                this.serviceList.add(dto);
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

    public double getServicePriceById(int serviceId) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            String sql = "Select Price "
                    + "From tblService "
                    + "Where ServiceID=?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, serviceId);
            rs = stm.executeQuery();

            if (rs.next()) {
                double price = rs.getFloat("Price");
                return price;
            } else return 0;
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
