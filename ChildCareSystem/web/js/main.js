/* -- Back to top --- */
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.back-to-top').fadeIn('slow');

    } else {
        $('.back-to-top').fadeOut('slow');
    }
});

$('.back-to-top').click(function () {
    $('html, body').animate({
        scrollTop: 0
    }, 1500, 'easeInOutExpo');
    return false;
});
function deleteConfirm() {
    var r = confirm("Mọi tác vụ sẽ không thể hoàn tác. Bạn có chắc chắn muốn xóa bài viết?");
    return r;
}

function cancelConfirm() {
    var r = confirm("Các thay đổi sẽ không được lưu. Bạn có chắc chắn muốn hủy bài viết?");
    return r;
}

function feedback(time, id) {
    var reservationDate = new Date(time);
    var today = new Date();
    var timeInterval = today - reservationDate;
    if(timeInterval > 0) {
        location.replace(`gop-y-dich-vu?id=${id}`);
    } else {
        $(`#${id}`).attr("hidden", false);
    }
}