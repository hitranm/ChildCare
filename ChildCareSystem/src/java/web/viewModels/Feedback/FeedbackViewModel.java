/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.Feedback;

import java.io.Serializable;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDTO;

/**
 *
 * @author HOANGKHOI
 */
public class FeedbackViewModel implements Serializable {

    private PatientDTO patientDTO;
    private ServiceDTO serviceDTO;
    private ReservationDTO reservationDTO;
    private CustomerDTO customerDTO;

    public FeedbackViewModel() {
    }

    public FeedbackViewModel(PatientDTO patientDTO, ServiceDTO serviceDTO, ReservationDTO reservationDTO, CustomerDTO customerDTO) {
        this.patientDTO = patientDTO;
        this.serviceDTO = serviceDTO;
        this.reservationDTO = reservationDTO;
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

    public ReservationDTO getReservationDTO() {
        return reservationDTO;
    }

    public void setReservationDTO(ReservationDTO reservationDTO) {
        this.reservationDTO = reservationDTO;
    }

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

}
