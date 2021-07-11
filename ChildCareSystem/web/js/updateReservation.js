/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const nextYear = new Date().getFullYear() + 1;
const nextMonth = new Date().getMonth() + 1;
const today = new Date();
const tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1);


var date = $("#checkInTime").text();
const chooseDate = new Date(date);

const myCalender = new CalendarPicker('#myCalendarWrapper', {
    min: tomorrow,
    max: new Date(nextYear, 1),
    selectedDate: chooseDate
});


