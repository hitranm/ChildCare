/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblMedicalExamination;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author HOANGKHOI
 */
public class MedicalExaminationDTO implements Serializable {

    private int examinationId;
    private int reservationId;
    private int serviceId;
    private String prescription;
    private Date updatedDate;
    private Date createdDate;

    public MedicalExaminationDTO() {
    }

    public MedicalExaminationDTO(int examinationId, int reservationId, int serviceId, String prescription, Date updatedDate, Date createdDate) {
        this.examinationId = examinationId;
        this.reservationId = reservationId;
        this.serviceId = serviceId;
        this.prescription = prescription;
        this.updatedDate = updatedDate;
        this.createdDate = createdDate;
    }

    public MedicalExaminationDTO(int reservationId, int serviceId, String prescription, Date updatedDate, Date createdDate) {
        this.reservationId = reservationId;
        this.serviceId = serviceId;
        this.prescription = prescription;
        this.updatedDate = updatedDate;
        this.createdDate = createdDate;
    }

    public int getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(int examinationId) {
        this.examinationId = examinationId;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

}
