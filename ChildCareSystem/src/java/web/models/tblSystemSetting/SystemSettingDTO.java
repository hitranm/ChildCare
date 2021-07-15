/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblSystemSetting;

/**
 *
 * @author nguye
 */
public class SystemSettingDTO {

    private int settingID;
    private String settingName;
    private String settingValue;
    private int adminID;
    private String createdDate;
    private String updatedDate;

    public SystemSettingDTO() {

    }

    public SystemSettingDTO(int settingID, String settingName, String settingValue, int adminID, String createdDate, String updatedDate) {
        this.settingID = settingID;
        this.settingName = settingName;
        this.settingValue = settingValue;
        this.adminID = adminID;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public SystemSettingDTO(int settingID, String settingName, String settingValue) {
        this.settingID = settingID;
        this.settingName = settingName;
        this.settingValue = settingValue;
    }

    public int getSettingID() {
        return settingID;
    }

    public void setSettingID(int settingID) {
        this.settingID = settingID;
    }

    public String getSettingName() {
        return settingName;
    }

    public void setSettingName(String settingName) {
        this.settingName = settingName;
    }

    public String getSettingValue() {
        return settingValue;
    }

    public void setSettingValue(String settingValue) {
        this.settingValue = settingValue;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
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
