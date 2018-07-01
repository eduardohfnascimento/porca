$(document).ready(function() {
    $('.table-hover tr').click(function() {
        var href = $(this).attr("href");
        if(href) {
            window.location = href;
        }
    });
});