/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.Cart;

import java.io.Serializable;
import web.models.Cart.CartItem;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDTO;
import web.models.tblSpecialty.SpecialtyDTO;

/**
 *
 * @author HOANGKHOI
 */
public class CartViewModel implements Serializable{
    private CustomerDTO customerDTO;
    private PatientDTO patientDTO;
    private ServiceDTO serviceDTO;
    private SpecialtyDTO specialtyDTO;
    private CartItem cartItem;
    
    public CartViewModel() {
    }

    public CartViewModel(CustomerDTO customerDTO, PatientDTO patientDTO, ServiceDTO serviceDTO, SpecialtyDTO specialtyDTO, CartItem cartItem) {
        this.customerDTO = customerDTO;
        this.patientDTO = patientDTO;
        this.serviceDTO = serviceDTO;
        this.specialtyDTO = specialtyDTO;
        this.cartItem = cartItem;
    }

    
    public CartViewModel(CustomerDTO customerDTO, PatientDTO patientDTO, ServiceDTO serviceDTO, CartItem cartItem) {
        this.customerDTO = customerDTO;
        this.patientDTO = patientDTO;
        this.serviceDTO = serviceDTO;
        this.cartItem = cartItem;
    }

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public PatientDTO getPatientDTO() {
        return patientDTO;
    }

    public void setPatientDTO(PatientDTO patientDTO) {
        this.patientDTO = patientDTO;
    }

    public ServiceDTO getServiceDTO() {
        return serviceDTO;
    }

    public void setServiceDTO(ServiceDTO serviceDTO) {
        this.serviceDTO = serviceDTO;
    }

    public SpecialtyDTO getSpecialtyDTO() {
        return specialtyDTO;
    }

    public void setSpecialtyDTO(SpecialtyDTO specialtyDTO) {
        this.specialtyDTO = specialtyDTO;
    }
    
    
    
    

    public CartItem getCartItem() {
        return cartItem;
    }

    public void setCartItem(CartItem cartItem) {
        this.cartItem = cartItem;
    }
    
    

    
    
    
    
}
