/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblStatus;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class StatusDTO implements Serializable {
    private String statusID;
    private String statusName;

    public StatusDTO() {
    }

    public StatusDTO(String statusID, String statusName) {
        this.statusID = statusID;
        this.statusName = statusName;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    
}
