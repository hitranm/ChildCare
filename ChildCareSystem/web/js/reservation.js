/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const nextYear = new Date().getFullYear() + 1;
const nextMonth = new Date().getMonth() + 1;
const nexDay = new Date();
const today = new Date();
const tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);


const myCalender = new CalendarPicker('#myCalendarWrapper', {
    min: today,
    max: new Date(nextYear, 1),
});

//-----------------------------------------------------------------
//


function submitReservation() {
    var patientList = $('.list-group-item').toArray();
    let chosenPatientId;
    var serviceId = $("#service-specialty option:selected").val();
    var timeId = $("#reservation-time option:selected").val();
    var date = myCalender.value.toLocaleDateString();

    //Date validation
    patientList.forEach(patient => {
        if (patient.ariaSelected) {
            chosenPatientId = patient.id;
        }
    });
    if (chosenPatientId == undefined) {
        $("#patientError").attr("hidden", false);
        return;
    } else {
        $("#txtServiceId").val(serviceId);
        $("#txtPatientId").val(chosenPatientId);
        $("#txtTimeId").val(timeId);
        $("#txtDate").val(date);
        $("#reservationForm").submit();
    }


    //---------------------------------------------


}