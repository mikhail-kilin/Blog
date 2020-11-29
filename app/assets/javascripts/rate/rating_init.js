if ($("#review").length > 0) {

    $("#review").rating({
        "click":function (e) {
            if (e.stars > 0 && e.stars <= 5) {
                if ($("#new_rating").length > 0) {
                    $("#rating_rate").val(e.stars);
                    $("#new_rating").submit();
                } else {
                    $("#rating_rate").val(e.stars);
                    $(".edit_rating").submit();
                }
            }
        }
    });
}
