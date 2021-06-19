/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const nextYear = new Date().getFullYear() + 1;
const nextMonth = new Date().getMonth() + 1;

const myCalender = new CalendarPicker('#myCalendarWrapper', {
    min: new Date(),
    max: new Date(nextYear, 10)
});

function submitReservation() {
    var patientList = $('.list-group-item').toArray();
    let chosenPatientId;
    var serviceId = $("#service-specialty option:selected").val();
    var timeId = $("#reservation-time option:selected").val();
    var customerId = $("#customerId").text();
    var date = myCalender.value.toLocaleDateString();
    

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

    // send form to servlet
//    $.ajax(
//            {
//                type: 'POST',
//                data: {txtPatientId: chosenPatientId,
//                    txtServiceId: serviceId,
//                    txtCustomerId: customerId,
//                    txtTimeId: timeId,
//                    txtDate: date
//                },
//                url: 'AddServiceToCartServlet',
//                success: function (url) {
//                    console.log(url);
//                    window.location.replace("http://localhost:8080/ChildCareSystem/" + url);
//                }
//            }
//    );

}