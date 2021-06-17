/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblOpenTime;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class OpenTimeDTO implements Serializable{
    private int openTimeId;
    private String openTime;

    public OpenTimeDTO() {
    }

    public OpenTimeDTO(int openTimeId, String openTime) {
        this.openTimeId = openTimeId;
        this.openTime = openTime;
    }
    
    public int getOpenTimeId() {
        return openTimeId;
    }

    public void setOpenTimeId(int openTimeId) {
        this.openTimeId = openTimeId;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }
    
    
}
