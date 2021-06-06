/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblStaff;

/**
 *
 * @author DELL
 */
public class StaffDTO {
    private String IdentityID;
    private String FullName;
    private String Email;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String SpecialtyID;
    
    

    public StaffDTO() {
    }

    public StaffDTO(String IdentityID, String FullName, String Email, String Address, String Birthday, String CitizenID, String SpecialtyID) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Email = Email;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.SpecialtyID = SpecialtyID;
    }
    
    public StaffDTO(String IdentityID, String FullName, String Address, String Birthday) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
    }

    /**
     * @return the IdentityID
     */
    public String getIdentityID() {
        return IdentityID;
    }

    /**
     * @param IdentityID the IdentityID to set
     */
    public void setIdentityID(String IdentityID) {
        this.IdentityID = IdentityID;
    }

    /**
     * @return the FullName
     */
    public String getFullName() {
        return FullName;
    }

    /**
     * @param FullName the FullName to set
     */
    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return the Address
     */
    public String getAddress() {
        return Address;
    }

    /**
     * @param Address the Address to set
     */
    public void setAddress(String Address) {
        this.Address = Address;
    }

    /**
     * @return the Birthday
     */
    public String getBirthday() {
        return Birthday;
    }

    /**
     * @param Birthday the Birthday to set
     */
    public void setBirthday(String Birthday) {
        this.Birthday = Birthday;
    }

    /**
     * @return the CitizenID
     */
    public String getCitizenID() {
        return CitizenID;
    }

    /**
     * @param CitizenID the CitizenID to set
     */
    public void setCitizenID(String CitizenID) {
        this.CitizenID = CitizenID;
    }

    /**
     * @return the SpecialtyID
     */
    public String getSpecialtyID() {
        return SpecialtyID;
    }

    /**
     * @param SpecialtyID the SpecialtyID to set
     */
    public void setSpecialtyID(String SpecialtyID) {
        this.SpecialtyID = SpecialtyID;
    }

    @Override
    public String toString() {
        return "StaffDTO{" + "IdentityID=" + IdentityID + ", FullName=" + FullName + ", Email=" + Email + ", Address=" + Address + ", Birthday=" + Birthday + ", CitizenID=" + CitizenID + ", SpecialtyID=" + SpecialtyID + '}';
    }

    
    
    
}
