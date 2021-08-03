// JavaScript Document
$(function(){
	
	// 모바일 메뉴 나타나기
	$('.btn-mobileMenu').on('click',function() {
		$('#black-b-mobileMenu').fadeIn();
		$('#mobile-menu-wrap').stop().animate({
			right: "0px"
		})
	})

	// 모바일 메뉴 닫기
	$('#black-b-mobileMenu').on('click',function() {
		$('#black-b-mobileMenu').fadeOut();
		$('#mobile-menu-wrap').stop().animate({
			right: "-280px"
		})
    });

    $("#datepicker1").datepicker();
    $("#datepicker2").datepicker();

});




// 사용자 추가 
function userPopAddShow() {
    $('.user-pop-add').show();
}

function userPopAddHide() {
    $('.user-pop-add').hide();
}

// 사용자 추가 
function userPopModiShow() {
    $('.user-pop-modify').show();
}

function userPopModiHide() {
    $('.user-pop-modify').hide();
}


// 사용자 삭제
function userPopDeleteShow() {
    $('.user-pop-delete').show();
}

function userPopAddDeleteHide() {
    $('.user-pop-delete').hide();
}







//동그라미 그래프

window.onload = function() {





//	//도너츠 그래프
//    Chart.types.Doughnut.extend({
//        name: "DoughnutAlt",
//        initialize: function(data) {
//            Chart.types.Doughnut.prototype.initialize.apply(this, arguments);
//
//            // save the actual clear method
//            var originalClear = this.clear;
//            // override the clear method to draw the background after each clear
//            this.clear = function() {
//                originalClear.apply(this, arguments)
//
//                var ctx = this.chart.ctx;
//                // use any one of the segments to get the inner and outer radius and center x and y
//                var firstSegment = this.segments[0];
//                // adjust 0.3 to increaase / decrease the width of the background
//                var gap = (firstSegment.outerRadius - firstSegment.innerRadius) * (1 - 1) / 2;
//
//                ctx.save();
//                ctx.fillStyle = "#dcddde";
//                ctx.beginPath();
//                ctx.arc(firstSegment.x, firstSegment.y, firstSegment.outerRadius - gap, 0, 2 * Math.PI);
//                ctx.arc(firstSegment.x, firstSegment.y, firstSegment.innerRadius + gap, 0, 2 * Math.PI, true);
//                ctx.closePath();
//                ctx.fill();
//                ctx.restore();
//            }
//        }
//    });
//
//
//
//
//
//    // 동그라미 1
//    var pointsUsed1 = [{
//            value: 44250,
//            color: "#4981c2",
//        },
//        {
//            value: 100000,
//            color: "transparent",
//        },
//    ];
//
//    var pointsUsed_ctx1 = document.getElementById("circleGraph1").getContext("2d");
//
//    var pointsUsed = new Chart(pointsUsed_ctx1).DoughnutAlt(pointsUsed1, {
//        segmentShowStroke: false,
//        segmentStrokeWidth: 0,
//        percentageInnerCutout: 70,
//        showTooltips: false,
//        animationEasing: 'easeInOutCubic',
//        responsive: true
//    });
//
//
//    // 동그라미 2
//    var pointsUsed2 = [{
//            value: 25000,
//            color: "#80b539",
//        },
//        {
//            value: 100000,
//            color: "transparent",
//        },
//    ];
//
//    var pointsUsed_ctx2 = document.getElementById("circleGraph2").getContext("2d");
//
//    var pointsUsed = new Chart(pointsUsed_ctx2).DoughnutAlt(pointsUsed2, {
//        segmentShowStroke: false,
//        segmentStrokeWidth: 0,
//        percentageInnerCutout: 70,
//        showTooltips: false,
//        animationEasing: 'easeInOutCubic',
//        responsive: true
//    });
//
//
//    // 동그라미 3
//    var pointsUsed3 = [{
//            value: 50000,
//            color: "#faa61a",
//        },
//        {
//            value: 100000,
//            color: "transparent",
//        },
//    ];
//
//    var pointsUsed_ctx3 = document.getElementById("circleGraph3").getContext("2d");
//
//    var pointsUsed = new Chart(pointsUsed_ctx3).DoughnutAlt(pointsUsed3, {
//        segmentShowStroke: false,
//        segmentStrokeWidth: 0,
//        percentageInnerCutout: 70,
//        showTooltips: false,
//        animationEasing: 'easeInOutCubic',
//        responsive: true
//    });







}








//누르면 페이지 위로 올라감.
function browserTop() {
	$("html, body").stop().animate({
		scrollTop:0
	},500,"easeInOutCubic")
}


// 탭 부분
var sc = "";
var a = "";

function tabFucNomal(tabTitle,tabContents) {
	
	init(tabTitle,tabContents);

	$(tabTitle).on('click',function(){
		init(tabTitle,tabContents);
		setTab($(this).index());
		return false;
	});	
}


function init(tabTitle,tabContents) {
	sc = $(tabContents);
	a = $(tabTitle);
	a.eq(0).addClass('active');
	sc.hide();
	sc.eq(0).show();	
}


function setTab(index) {
	sc.hide();
	sc.eq(index).fadeIn();
	a.removeClass('active');
	a.eq(index).addClass('active');	
}