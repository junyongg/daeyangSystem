<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<main>
 <head>
    <meta charset='utf-8' />
    <script src='/resources/publish/_BD/js/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
    	  $(function () {
              var request = $.ajax({
                  url: "/bd/calender/Calender_Data.do",
                  method: "GET",
                  dataType: "json"
              });
              
              request.done(function(responseValue) {
            	  
	          	responseValue.forEach(function(event) {
                    if (event.title.includes('사업허가만료일')) {
                        event.color = '#FF6F61'; // 사업허가만료일은 파란색
                    } else if (event.title.includes('개발행위만료일')) {
                        event.color = '#D32F2F'; // 개발행위만료일은 빨간색
                    }
	            });
//             	console.log(JSON.stringify(responseValue, null, 2));
//             	console.log(responseValue);
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	buttonText: { //버튼 이름 설정
		        		dayGridMonth : '월간',
		        		multiMonthYear : '연간',
	        			today : '오늘로 이동'
		        	},
		        	headerToolbar: { //위쪽 툴바 설정
		                left: 'prevYear,prev,today,next,nextYear',
		                center: 'title',
		                right : 'dayGridMonth,multiMonthYear'
		            },
					initialView: 'dayGridMonth', //달력 조회 방식
					locale: "ko",
					navLinks: true,
		            selectable: true,
		            selectMirror: true,
		            events : responseValue,
		            editable: true,
		            dayMaxEvents: true,
		            eventDrop: function(info){ //일정 드래그 앤 드랍
		           	  
		           	  console.log(info.event)
		           	  var title = info.event.title;
		           	  var id = info.event.id;
		           	  var dataToSend;
		           	  
		           	  //단일 날짜일 경우 드래그 앤 드랍시 end가 null이 되므로 null일시 start를 end에 넣어줌
		           	  var end = info.event.endStr ? info.event.endStr : info.event.startStr;
		           	  
		           	  if (title.includes('사업허가만료일')) {
		           	        dataToSend = 'bus';
		           	  }else if(title.includes('개발행위만료일')) {
		           	        dataToSend = 'dev';   		  
		           	  }
		           	  
		           	  
		              if(confirm('일정을 수정하시겠습니까 ? ')) {// 확인 클릭 시
		            	  $.ajax({
		                      url: '/bd/calender/Calender_Edit.do?${_csrf.parameterName}=${_csrf.token}',
		                      method: 'POST',
		                      contentType: 'application/json',
		                      data: JSON.stringify({
		                    	  id: id,
		                          title: title,
		                          value: dataToSend,
		                          start: info.event.startStr,
		                          end: end
		                      }),
		                      success: function(response) {
		                          
		                      },
		                      error: function(xhr, status, error) {
		                          console.error('에러내용:', error);
		                          alert('오류가 발생했습니다. 연구소에 문의해주세요.');
		                          info.revert(); // 오류가 발생하면 변경 취소
		                      }
		        		});
		             }else{
		            	  info.revert();
		             }
		           },//eventDrop
			 });  
		     calendar.render();
		  });
		});
      }); 
      /* eventClick: function(arg) { //이벤트 클릭 시 
          if (confirm('일정을 삭제하시겠습니까?')) {
            arg.event.remove()
          }
        }, */
        
        /* select: function(arg) { //클릭시 일정추가(추후 업데이트)
            var title = prompt('일정추가');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
      	}, */
      	
</script>

<script type="text/javascript">

	/* window.onload = function () {
	    if (window.Notification) {
	        Notification.requestPermission().then(function (permission) {
	            if (permission === 'granted') {
	                fetchNotificationData();
	            } else {
	                alert('notification is disabled');
	            }
	        });
	    }
	}
	
	function fetchNotificationData() {
		console.log("fetchNotificationDataok");
		var request = $.ajax({
            url: "/bd/calender/Calender_pushAlim.do",
            method: "GET",
            dataType: "json"
        });
        
        request.done(function(response) {
                setTimeout(function () {
                    notify(response);
                }, 3000);
        });
	}
	
	function notify(data) {
	    data.forEach((item, index) => {
	    	 if (item.text !== "") {
		        var notification = new Notification('', {
		        	icon : 'http://www.dymonitering.co.kr/resources/favicon.ico',
		            body : item.text,
		            requireInteraction : true,
		        });
	            notification.addEventListener('click', handleClick);
	    	 }
	    });
	}
	
	function handleClick() {
// 		 location.href = '/bd/license/registration.do';
		 this.close();
	} */
	
	window.onload = function () {
		showNotification();
	}
	
	function showNotification() {
		
		var container = document.getElementById('notification-container');
		
		var request = $.ajax({
            url: "/bd/calender/Calender_pushAlim.do",
            method: "GET",
            dataType: "json"
        });
		request.done(function(response) {
			response.forEach((item, index) => {
		    	 if (item.text !== "") {
		    		 var notification = document.createElement('div');
                     notification.className = 'notification';
                     notification.innerText = item.text;

		    	        setTimeout(function() {
		    	            notification.classList.add('show');
		    	        }, index * 500);
		    	        
		    	        notification.addEventListener('click', function() {
                            notification.classList.remove('show');
                            
                            setTimeout(function() {
                                container.removeChild(notification); //클릭 시 알림 삭제
                            }, 500);
		    	        });
                     container.appendChild(notification);
		    	   }
		    });
		});
    }
</script>
<style>

/* 일요일 날짜 */
.fc-day-sun a {color: red;}
  
/* 토요일 날짜 */
.fc-day-sat a {color: blue;}

body {
  font-size: 14px;
}

#calendar {
  max-width: 1100px;
  margin: 0 auto;
}
.notification-container {
            position: fixed;
            bottom: 10px;
            right: 10px;
            z-index: 1000;
            display: flex;
            flex-direction: column-reverse;;
            align-items: flex-end;
             max-height: 400px; 
            overflow-y: auto;
        }
       
.notification {
            display: none;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            opacity: 0;
            transform: translateY(100%);
            transition: opacity 0.5s, transform 0.5s;
            cursor: pointer;
            margin-top: 10px;
        }
        
.notification.show {
	  display: block;
	  opacity: 1;
	  transform: translateY(0);
	  }
</style>
  </head>
  <body>
    <div id='calendar'></div>
    <div id="notification-container" class="notification-container"></div>
  </body>
</main>
	