/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.Reservation;

import java.io.Serializable;
import java.util.List;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDTO;
import web.models.tblPatient.PatientDTO;

/**
 *
 * @author HOANGKHOI
 */
public class ReservationViewModel implements Serializable {

    private CustomerDTO customerDTO;
    private IdentityDTO identityDTO;
    private List<PatientDTO> listPatient;

    public ReservationViewModel() {
    }

    public ReservationViewModel(CustomerDTO customerDTO, List<PatientDTO> listPatient, IdentityDTO identityDTO) {
        this.customerDTO = customerDTO;
        this.listPatient = listPatient;
        this.identityDTO = identityDTO;
    }

    public ReservationViewModel(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public List<PatientDTO> getListPatient() {
        return listPatient;
    }

    public void setListPatient(List<PatientDTO> listPatient) {
        this.listPatient = listPatient;
    }

    public IdentityDTO getIdentityDTO() {
        return identityDTO;
    }

    public void setIdentityDTO(IdentityDTO identityDTO) {
        this.identityDTO = identityDTO;
    }

}
