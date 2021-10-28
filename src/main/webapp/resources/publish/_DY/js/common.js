$(function(){

    //PC 메뉴
    $('#gnb ul > li').on('click', function(){
        $('#gnb ul > li').removeClass('on');
        $(this).addClass('on');

        menuBar();
    })
    if (!Mobile()){// 모바일일 경우
    	 menuBar();
    }
   

    function menuBar(){
        var gnbLiWidth, gnbLipos, number;

        gnbLiWidth = parseInt($('#gnb ul > li.on').css('width'))
        gnbLipos = $('#gnb ul > li.on').offset().left;
    
        number = gnbLipos + gnbLiWidth;
    
        $('.menu_bar').css('width',number);
    }
    

    // 모바일 메뉴
    $('.mo_menu').on('click',function(){
        if($(this).hasClass('on')){
            $(this).removeClass('on')
            $('#gnb').removeClass('on')
        } else {
            $(this).addClass('on')
            $('#gnb').addClass('on')
        }
    })


})


function Mobile(){
	return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);}



//탭부분
function tab(e, num) {
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e + '_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('active');
    con.hide();
    con.eq(num).show();

    menu.click(function () {
        if (select !== null) {
            select.removeClass("active");
            con.eq(i).hide();
        }

        select = $(this);
        i = $(this).index();

        select.addClass('active');
        con.eq(i).show();
    });
}