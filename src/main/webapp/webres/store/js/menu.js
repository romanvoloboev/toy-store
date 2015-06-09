var str;

$(function(){
    $.ajax({
        type: "post",
        url: "/load_categories_menu",
        success: function(response) {
            $.each(response, function() {
                if (this.subcategories.length > 0) {
                    str = "<li class='parent dropdown pav-parrent'>"+
                        "<a href='/category?id="+this.id+"' class='dropdown-toggle' data-toggle='dropdown'>" +
                        "<span class='menu-title'>"+this.name+"</span><b class='caret'></b></a>" +
                        "<div class='dropdown-menu level1'>" +
                        "<div class='dropdown-menu-inner'>" +
                        "<div class='row'>" +
                        "<div class='mega-col col-xs-12 col-sm-12 col-md-12' data-type='menu'>" +
                        "<div class='mega-col-inner'>" +
                        "<ul>";

                    $.each(this.subcategories, function(){
                        str += "<li><a href='/subcategory?id="+this.id+"'>"+this.name+"</a></li>";
                    });

                    str += "</ul>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</li>";

                    $(".nav.navbar-nav.megamenu").append(str);
                    str = "";
                }
            });
        },
        error: function() {
            $.notify("<b>Ошибка запроса меню.</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
});