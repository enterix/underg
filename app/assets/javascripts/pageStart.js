function pageStart() {
    $(document).pjax('[data-pjax] a, a[data-pjax], .data-pjax-link', '#main');   //pjaxConfiguration

    $(document).on('submit', '.data-pjax', function (event) {
        $.pjax.submit(event, '#main')
    })

    $(document).on('pjax:send', function () {
        $('#loading_mark').css('display', 'block');
    });

    $(document).on('pjax:complete', function () {
        $('#loading_mark').css('display', 'none');
    });

    $(document).on('pjax:beforeReplace', function () {
        $('#main').css('display', 'none');
        $('#main').fadeIn(750);
    });

    $(document).on('pjax:success', function () {	//scroll
        $(function () {
            $('.scroll-pane').jScrollPane();
        });
    });

    $(document).on('pjax:error', function () {
        console.log('pjax:error');
    });
    $(function () {
        $(window).on('resize', fix_size);

        $('.scroll-pane').jScrollPane();	//scroll

        enableMenuAnimantio('#menu_1');		//menu
        enableMenuAnimantio('#menu_2');
        enableMenuAnimantio('#menu_3');
        enableMenuAnimantio('#menu_4');
    });
}