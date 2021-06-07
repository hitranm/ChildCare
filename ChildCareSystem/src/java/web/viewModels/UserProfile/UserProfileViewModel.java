/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.UserProfile;

import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDTO;

/**
 *
 * @author HOANGKHOI
 */
public class UserProfileViewModel {
    private IdentityDTO identityDTO;
    private String fullName;
    private String phoneNum;
    private String address;
    private String birthday;
    private String citizenId;
    private int specialtyId;

    public UserProfileViewModel() {
    }

    public UserProfileViewModel(IdentityDTO identityDTO, String fullName, String phoneNum, String address, String birthday, String citizenId) {
        this.identityDTO = identityDTO;
        this.fullName = fullName;
        this.phoneNum = phoneNum;
        this.address = address;
        this.birthday = birthday;
        this.citizenId = citizenId;
    }

    public UserProfileViewModel(IdentityDTO identityDTO, String fullName, String phoneNum, String address, String birthday, String citizenId, int specialtyId) {
        this.identityDTO = identityDTO;
        this.fullName = fullName;
        this.phoneNum = phoneNum;
        this.address = address;
        this.birthday = birthday;
        this.citizenId = citizenId;
        this.specialtyId = specialtyId;
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

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
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

    public String getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(String citizenId) {
        this.citizenId = citizenId;
    }

    public int getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(int specialtyId) {
        this.specialtyId = specialtyId;
    }

    @Override
    public String toString() {
        return "UserProfileViewModel{" + "identityDTO=" + identityDTO + ", fullName=" + fullName + ", phoneNum=" + phoneNum + ", address=" + address + ", birthday=" + birthday + ", citizenId=" + citizenId + ", specialtyId=" + specialtyId + '}';
    }
    
}
