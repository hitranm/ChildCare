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
public class PatientError {

    private String patientNameError;
    private String genderError;
    private String birthdayError;

    public String getPatientNameError() {
        return patientNameError;
    }

    public void setPatientNameError(String patientNameError) {
        this.patientNameError = patientNameError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

}
