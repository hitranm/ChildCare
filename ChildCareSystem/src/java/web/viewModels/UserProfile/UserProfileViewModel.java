/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.UserProfile;

import web.models.tblIdentity.IdentityDTO;

/**
 *
 * @author HOANGKHOI
 */
public class UserProfileViewModel {
    private IdentityDTO identityDTO;
    private String fullName;
    private String phoneNumber;
    private String address;
    private String birthday;
    private String citizenID;
    private String specialtyID;

    public UserProfileViewModel() {
    }

    public UserProfileViewModel(IdentityDTO identityDTO, String fullName, String phoneNumber, String address, String birthday, String citizenID) {
        this.identityDTO = identityDTO;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.birthday = birthday;
        this.citizenID = citizenID;
    }

    public UserProfileViewModel(IdentityDTO identityDTO, String fullName, String phoneNumber, String address, String birthday, String citizenID, String specialtyID) {
        this.identityDTO = identityDTO;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.birthday = birthday;
        this.citizenID = citizenID;
        this.specialtyID = specialtyID;
    }

    public IdentityDTO getIdentityDTO() {
        return identityDTO;
    }

    public void setIdentityDTO(IdentityDTO identityDTO) {
        this.identityDTO = identityDTO;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNumber = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCitizenID() {
        return citizenID;
    }

    public void setCitizenID(String citizenID) {
        this.citizenID = citizenID;
    }

    public String getSpecialtyID() {
        return specialtyID;
    }

    public void setSpecialtyID(String specialtyID) {
        this.specialtyID = specialtyID;
    }

    @Override
    public String toString() {
        return "UserProfileViewModel{" + "identityDTO=" + identityDTO + ", fullName=" + fullName + ", phoneNum=" + phoneNumber + ", address=" + address + ", birthday=" + birthday + ", citizenId=" + citizenID + ", specialtyId=" + specialtyID + '}';
    }
    
}
