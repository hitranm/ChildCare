/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblPatient;

/**
 *
 * @author nguye
 */
public class PatientDTO {

    private String patientID;
    private String patientName;
    private String gender;
    private String birthday;
    private String customerID;
    
    public PatientDTO(){
        
    }

    public PatientDTO(String patientID, String patientName, String gender, String birthday, String customerID) {
        this.patientID = patientID;
        this.patientName = patientName;
        this.gender = gender;
        this.birthday = birthday;
        this.customerID = customerID;
    }

    public PatientDTO(String patientName, String gender, String birthday, String customerID) {
        this.patientName = patientName;
        this.gender = gender;
        this.birthday = birthday;
        this.customerID = customerID;
    }
    
    
    public String getPatientID() {
        return patientID;
    }

    public void setPatientID(String patientID) {
        this.patientID = patientID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }
    
}
