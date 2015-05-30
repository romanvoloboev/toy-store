$(function() {

    // Set last page opened on the menu
    $('#menu a[href]').on('click', function() {
        sessionStorage.setItem('menu', $(this).attr('href'));
    });

    if (!sessionStorage.getItem('menu')) {
        $('#menu #dashboard').addClass('active');
    } else {
        // Sets active and open to selected page in the left column menu.
        $('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').addClass('active open');
    }

    if (localStorage.getItem('column-left') == 'active') {
        $('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');

        $('#column-left').addClass('active');

        // Slide Down Menu
        $('#menu li.active').has('ul').children('ul').addClass('collapse in');
        $('#menu li').not('.active').has('ul').children('ul').addClass('collapse');
    } else {
        $('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');

        $('#menu li li.active').has('ul').children('ul').addClass('collapse in');
        $('#menu li li').not('.active').has('ul').children('ul').addClass('collapse');
    }

    // Menu button
    $('#button-menu').on('click', function() {
        // Checks if the left column is active or not.
        if ($('#column-left').hasClass('active')) {
            localStorage.setItem('column-left', '');

            $('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');

            $('#column-left').removeClass('active');

            $('#menu > li > ul').removeClass('in collapse');
            $('#menu > li > ul').removeAttr('style');
        } else {
            localStorage.setItem('column-left', 'active');

            $('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');

            $('#column-left').addClass('active');

            // Add the slide down to open menu items
            $('#menu li.open').has('ul').children('ul').addClass('collapse in');
            $('#menu li').not('.open').has('ul').children('ul').addClass('collapse');
        }
    });

    // Menu
    $('#menu').find('li').has('ul').children('a').on('click', function() {
        if ($('#column-left').hasClass('active')) {
            $(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
            $(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
        } else if (!$(this).parent().parent().is('#menu')) {
            $(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
            $(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
        }
    });


    // tooltips on hover
    $('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});
    $('[data-toggle=\'dropdown\']').tooltip({container: 'body', html: true});

    // Makes tooltips work on ajax generated content
    $(document).ajaxStop(function() {
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    });
});


