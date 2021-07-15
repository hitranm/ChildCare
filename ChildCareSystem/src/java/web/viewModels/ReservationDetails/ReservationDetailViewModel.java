/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.ReservationDetails;

import web.models.tblCustomer.CustomerDTO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDTO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author Admin
 */
public class ReservationDetailViewModel {

    private CustomerDTO customerDTO;
    private PatientDTO patientDTO;
    private ServiceDTO serviceDTO;
    private StaffDTO staffDTO;
    private String SpecialtyName;
    private ReservationDTO reservationDTO;

    public ReservationDetailViewModel() {
    }

    public ReservationDetailViewModel(CustomerDTO customerDTO, PatientDTO patientDTO, ServiceDTO serviceDTO, StaffDTO staffDTO, String SpecialtyName, ReservationDTO reservationDTO) {
        this.customerDTO = customerDTO;
        this.patientDTO = patientDTO;
        this.serviceDTO = serviceDTO;
        this.staffDTO = staffDTO;
        this.SpecialtyName = SpecialtyName;
        this.reservationDTO = reservationDTO;
    }

    public String getSpecialtyName() {
        return SpecialtyName;
    }

    public void setSpecialtyName(String SpecialtyName) {
        this.SpecialtyName = SpecialtyName;
    }

    public PatientDTO getPatientDTO() {
        return patientDTO;
    }

    public ServiceDTO getServiceDTO() {
        return serviceDTO;
    }

    public StaffDTO getStaffDTO() {
        return staffDTO;
    }

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public void setPatientDTO(PatientDTO patientDTO) {
        this.patientDTO = patientDTO;
    }

    public void setServiceDTO(ServiceDTO serviceDTO) {
        this.serviceDTO = serviceDTO;
    }

    public void setStaffDTO(StaffDTO staffDTO) {
        this.staffDTO = staffDTO;
    }

    public ReservationDTO getReservationDTO() {
        return reservationDTO;
    }

    public void setReservationDTO(ReservationDTO reservationDTO) {
        this.reservationDTO = reservationDTO;
    }

}
