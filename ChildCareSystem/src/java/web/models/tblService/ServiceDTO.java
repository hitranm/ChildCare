/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblService;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class ServiceDTO implements Serializable {

    private String serviceId;
    private String serviceName;
    private String specialtyId;
    private String thumbnail;
    private String description;
    private double price;
    private String statusId;
    private String createPersonId;
    private String createdDate;
    private String updatedDate;

    public ServiceDTO() {
    }

    public ServiceDTO(String serviceId, String serviceName, String specialtyId, String thumbnail, String description, double price, String statusId, String createPersonId, String createdDate, String updatedDate) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.statusId = statusId;
        this.createPersonId = createPersonId;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }
    

    public ServiceDTO(String serviceID, String serviceName, String specialtyId, String thumbnail, String description, double price, String statusId, String createPersonId, String createdDate) {
        this.serviceId = serviceID;
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.statusId = statusId;
        this.createPersonId = createPersonId;
        this.createdDate = createdDate;
    }

    public ServiceDTO(String serviceName, String specialtyId, String thumbnail, String description, double price, String statusId, String createPersonId, String createdDate, String updatedDate) {
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.statusId = statusId;
        this.createPersonId = createPersonId;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }


    public ServiceDTO(String serviceName, String specialtyId, String thumbnail, String description, double price, String statusId, String createPersonId, String createdDate) {
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.statusId = statusId;
        this.createPersonId = createPersonId;
        this.createdDate = createdDate;
    }

    public ServiceDTO(String serviceId, String serviceName, String thumbnail, String createdDate) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.thumbnail = thumbnail;
        this.createdDate = createdDate;
    }

    public ServiceDTO(String serviceId, String serviceName, String specialtyId, double price, String statusId) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.price = price;
        this.statusId = statusId;
    }

    public ServiceDTO(String serviceId, String serviceName, String specialtyId, String thumbnail, String description, double price, String statusId, String updatedDate) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.specialtyId = specialtyId;
        this.thumbnail = thumbnail;
        this.description = description;
        this.price = price;
        this.statusId = statusId;
        this.updatedDate = updatedDate;
    }


    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(String specialtyId) {
        this.specialtyId = specialtyId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    public String getCreatePersonId() {
        return createPersonId;
    }

    public void setCreatePersonId(String createPersonId) {
        this.createPersonId = createPersonId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    


}
