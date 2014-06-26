// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
(function( $, undefined ) {
    $.notification = function(options) {
        var opts = $.extend({}, {type: 'notice', time: 3000}, options);
        var o    = opts;

        timeout          = setTimeout('$.notification.removebar()', o.time);
        var message_span = $('<span />').addClass('alert alert-info').html(o.message);
        var wrap_bar     = $('<div />').addClass('alert alert-info').css("cursor", "pointer");

    if (o.type == 'error') {
          wrap_bar.css({"color": "#D8000C"})
        };

        wrap_bar.click(function(){
            $.notification.removebar()
        });

        wrap_bar.append(message_span).hide()
            .insertAfter($('.flash')).fadeIn('fast');
    };


    var timeout;
    $.notification.removebar    = function(txt) {
        if($('.alert').length){
            clearTimeout(timeout);

            $('.alert').fadeOut('fast',function(){
                $(this).remove();
            });
        }   
    };


})(jQuery);