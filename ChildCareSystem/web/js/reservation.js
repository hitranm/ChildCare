/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const nextYear = new Date().getFullYear() + 1;
const myCalender = new CalendarPicker('#myCalendarWrapper', {
    min: new Date(),
    max: new Date(nextYear, 10)
});

function submitReservation() {
    console.log("Submit form");
    var patientList = $('.list-group-item').toArray();
    let chosenPatientId;
    
    patientList.forEach(patient => {
        if (patient.ariaSelected) {
            chosenPatientId = patient.id;
        }
    });
    if (chosenPatientId == undefined) {
        console.log(chosenPatientId);
        $("#patientError").attr("hidden", false);
    }

}