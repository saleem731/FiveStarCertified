/*Loop Slide*/
function slide2right(){
    var nextImg = $('.slider-source img.active').next().attr('src');

    if ($('.active').is(':last-child')) {
        nextImg = $('.slider-source img:first').attr('src')
        $('.slider-source .active').removeClass('active');
        $('.slider-source img:first, .slider-source div:first').addClass('active');
    }
    else{
        $('.slider-source .active').next().addClass('active');
        $('.slider-source .active').prev().removeClass('active');
    }

    $('.slider-mask').css('background-image', 'url('+nextImg+')');
    $('.slider-source').addClass('trans-l');

    setTimeout(function(){
        $('.slider-source').css('background-image','url('+nextImg+')').removeClass('trans-l');
    }, 1000);
}
function slide2left(){
    var nextImg = $('.slider-source img.active').prev().attr('src');

    if ($('.active').is(':first-child')) {
        nextImg = $('.slider-source img:last').attr('src')
        $('.slider-source .active').removeClass('active');
        $('.slider-source img:last, .slider-source div:last').addClass('active');
    }
    else{
        $('.slider-source .active').prev().addClass('active');
        $('.slider-source .active').next().removeClass('active');
    }
    $('.slider-mask').css('background-image', 'url('+nextImg+')');
    $('.slider-source').addClass('trans-r');

    setTimeout(function(){
        $('.slider-source').css('background-image','url('+nextImg+')').removeClass('trans-r');
    }, 1000);
}


$('#slider .nav-r').click(function(){
    slide2right();
});

$('#slider .nav-l').click(function(){
    slide2left();
});
