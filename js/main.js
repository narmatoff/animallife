(function($) {
    $.fn.tabs = function() {
        return this.each(function() {
            var _this = $(this);
            _this.find('.tabs-h li').each(function(index) {
                $(this).wrapInner('<a href="#:tab-' + (index + 1) + '"/>');
            }).end().find('.tabs-c > div').each(function(index) {
                $(this).attr('id', 'tab-' + (index + 1));
            }).end().find(".tabs-h a").click(function() {
                var hash = $(this).attr('href').split(':')[1];
                $(this).parent().addClass("active").siblings('.active').removeClass("active");
                _this.find(".tabs-c > div").hide();
                $('#' + hash).show();
                window.location.hash = ':' + hash;
                return false;
            })
            /*.eq(0).parent().addClass('active').end().end()
             .find('.tabs-content>div:not(:first)').hide();*/
            if (window.location.hash[1] == ':') {
                _this.find('.tabs-h li a[href="' + window.location.hash + '"]').trigger("click");
            } else {
                // _this.find('.tabs-h a:eq(0)').trigger("click");
            }
        })
    };
})(jQuery);
// (function($) {
//  *//*bad-neutral-good*//*
//  $.fn.ratingBar = function(){
//      return this.each(function(){
//          var _this = $(this),
//              data = _this.html().split('-'),
//              sum = 0,
//              i,
//              html = '';
//          for(i in data) sum += parseInt(data[i]);
//          for(i in data){
//              data[i] > 0 && (html += '<div class="bar-'+i+'" style="width:'+(Math.round(data[i]/sum*100))+'%"></div>');
//          }
//          _this.html(html);
//      })
//  };
// })(jQuery);
(function($) {
    var logo_pos = 0;
    var speed = 500;
    var delay = 5000;
    var go = function(obj) {
        setTimeout(function() {
            logo_pos -= 60;
            if (logo_pos <= -240) logo_pos = 0;
            obj.animate({
                top: logo_pos
            }, speed, function() {
                go($(this));
            })
        }, delay);
    };
    $.fn.logo = function() {
        return this.each(function() {
            go($(this));
        })
    };
})(jQuery);
$(function() {
    $('.tab-me').tabs();
    $('.style-me').styler({
        selectVisibleOptions: 5
    });
    $('.firm-ymap a.underdotted').click(function(e) {
        $(this).next().slideToggle('slow');
        e.stopPropagation();
        return false;
    });
    //var logo_pos = 0;
    $('.h-logo div img').logo();
    $('.w-close').click(function(e) {
        $('.popup-window').fadeOut('slow');
        e.preventDefault();
        return false;
    });
    $('.i-reg').click(function(e) {
        $('.popup-window').fadeIn('slow');
        e.preventDefault();
        return false;
    });
    $('a.top-m-more').on('click', function() {
        $('#more').toggle(2000, 'easeOutElastic');
    });
    $('.fancybox').fancybox({
        openEffect: 'none',
        closeEffect: 'none'
    });
    // $('.obj-rating-bar').ratingBar();
    /*
     *<RED MENU>
     **/
    //    $('<div>\
    //        <a href="index.html">Главная</a>\
    //        <a href="ads.html">объявления</a>\
    //        <a href="firm_page.html">страница фирмы</a>\
    //        <a href="office.html">личный кабинет</a>\
    //        <a href="vet_cliniks.html">ветклиники</a>\
    //     </div>').appendTo('body')
    //        .css({
    //            backgroundColor:'red',
    //            width:140,
    //            position:'absolute',
    //            top:0,
    //            left:0
    //        }).find('a').css('display', 'block')
    //        console.log('DELETE RED MENU BEFORE DEVELOPMENT in main.js at the end of "ready" function!')
    //    /*
    //     *</RED MENU>
    //     **/
});
