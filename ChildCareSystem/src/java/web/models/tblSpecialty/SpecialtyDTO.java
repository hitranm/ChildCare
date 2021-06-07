/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblSpecialty;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class SpecialtyDTO implements Serializable {
    private int specialtyId;
    private String specialtyName;

    public SpecialtyDTO() {
    }

    public SpecialtyDTO(int specialtyId, String specialtyName) {
        this.specialtyId = specialtyId;
        this.specialtyName = specialtyName;
    }

    public int getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(int specialtyId) {
        this.specialtyId = specialtyId;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }
    
    
}
