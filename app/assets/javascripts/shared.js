$(document).ready(function() {
    $('body').on('click', '.table-hover tr', function() {
        var href = $(this).attr("href");
        if(href) {
            window.location = href;
        }
    });
});