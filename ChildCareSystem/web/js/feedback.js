/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var count;
function starmark(item) {
  count = item.id[0];
  sessionStorage.starRating = count;
  var subid = item.id.substring(1);
  for (var i = 0; i < 5; i++) {
    if (i < count) {
      document.getElementById(i + 1 + subid).style.color = "#fed330";
    } else {
      document.getElementById(i + 1 + subid).style.color = "black";
    }
  }
}

$( "#submitButton" ).click(function() {
    $("#txtStar").val(count);
    $("#action").val("Create");
    var comment = $("#comment").val();
    $("#txtComment").val(comment);
    $("#feedbackForm").submit();
});