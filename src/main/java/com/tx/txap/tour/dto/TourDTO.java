package com.tx.txap.tour.dto;

import com.tx.common.dto.Common;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class TourDTO extends Common {
	
	private static final long serialVersionUID = -8716753312865665515L;

	//관광 공통요소 테이블
	private String  TC_KEYNO            
					,TC_TITLE            
					,TC_SUBTITLE         
					,TC_TAG             
					,TC_THUMBNAIL         
					,TC_SUMMARY          
					,TC_CONTENTS          
					,TC_PLACE            
					,TC_ADDR             
					,TC_ADDR2            
					,TC_CONTACT            
					,TC_POST             
					,TC_MANAGER          
					,TC_DEPARTMENT       
					,TC_CONTACTS
					,TC_CONTACT2        
					,TC_LAT         
					,TC_LNG        
					,TC_UP_CNT           
					,TC_DICTIONARY       
					,TC_HOME_URL         
					,TC_BLOG_URL         
					,TC_SNS_URL          
					,TC_RESERVATION_URL  
					,TC_WAY_JAGA         
					,TC_WAY_PUBLIC       
					,TC_WAY_GUIDE        
					,TC_TYPE             
					,TC_USE
					,TC_SHOW_COLUMN
					,TC_REGDT
					,TC_REGNM
					,TC_MODDT
					,TC_MODNM
					,TC_REPLY_YN;
	//이용안내 테이블
	private String   TI_KEYNO               
					,TI_TIME                
					,TI_DETAIL              
					,TI_ENTRANCE_FEE        
					,TI_CLOSED_DAY          
					,TI_PARKING_YN          
					,TI_PARKING_PLACE       
					,TI_BUDAE_SISEOL   
					,TI_CONVENIENCE_SISEOL        
					,TI_ETC_SISEOL 
					,TI_ETC_DETAIL          
					,TI_LANG_SERVICE;
	
	//T_TOURISM_THEME
	private String  TT_KEYNO
					,TT_TC_KEYNO
					,TT_TI_KEYNO
					,TT_DIVISION
					,TT_APPLY
					,TT_CHE_DIVISION
					,TT_FAX
					,TT_TARGET
					,TT_BAE_NAME
					,TT_BAE_CAPTAIN
					,TT_INWON
					,TT_BAE_TON
					,TT_BAE_START_TIME
					,TT_TIME
					,TT_BAE_PLACE
					,TT_BAE_END_TIME
					,TT_COURCE
					,TT_WALK_DISTANCE
					,TT_START_PLACE
					,TT_END_PLACE
					,TT_WALK_MIDDLE_PLACE
					,TT_WALK_NANIDO
					,TT_WALK_BOLGEOLI
					,TT_TEMPLE_GUIDE
					,TT_TEMPLE_BOOKS_WAY
					,TT_TEMPLE_PROGRAM_NAME
					,TT_TEMPLE_PROGRAM_CONTANT
					,TT_TEMPLE_EFFECT
					,TT_TOWN_ORIGIN
					,TT_TOWN_GREETING
					,TT_TOWN_SPECIALTY
					,TT_TOWN_KEYNO
					,TT_TOWN_SALGEOLI
					,TT_SUP_MANAGE
					,TT_SUP_KINDS;              
	
	//T_TOURISM_CULTURAL_HERITAGE
	private String  TCH_KEYNO
					,TCH_TC_KEYNO
					,TCH_TI_KEYNO
					,TCH_DIVISION
					,TCH_TYPE
					,TCH_LOCATION
					,TCH_JIJEONG_DAY
					,TCH_JIJEONG_NUM
					,TCH_ERA
					,TCH_STRING1
					,TCH_STRING2
					,TCH_STRING3;  
	
	//T_TOURISM_FESTIVAL
	private String 	TF_KEYNO
					,TF_TC_KEYNO
					,TF_TI_KEYNO
					,TF_DIVISION
					,TF_START_TIME
					,TF_END_TIME
					,TF_JUGWAN
					,TF_PURPOSE
					,TF_PROGRAM
					,TF_TERM
					,TF_NIGHT_STARTIME
					,TF_NIGHT_ENDTIME
					,TF_CONTENTS
					,TF_PLACE;
	
	//T_TOURISM_COURSE_MAIN
	private String 	 TCM_KEYNO
					,TCM_TC_KEYNO
					,TCM_TI_KEYNO
					,TCM_SEASON
					,TCM_TYPE
					,TCM_TIME;
	
	//T_TOURISM_COURSE_SUB
	private String   TCS_LAT
					,TCS_LNG
					,TCS_LEVEL
					,TCS_COMMENT
					,TCS_TYPE
					,TCS_TYPE_KEYNO
					,TCS_TITLE
					,TCS_AUTO_DISTANCE
					,TCS_DISTANCE
					,TCS_TIME
					,TCS_POSITON_TYPE;
	
	//T_TOURISM_DESTINATION
	private String  TA_KEYNO             
					,TA_TC_KEYNO          
					,TA_TI_KEYNO          
					,TA_DIVISION          
					,TA_GIGAN             
					,TA_YAGAN             
					,TA_SEASON            
					,TA_SAN_SOGCHING      
					,TA_SAN_SCALE        
					,TA_SAN_HANJANAME     
					,TA_BEACH_AREA        
					,TA_BEACH_LONG        
					,TA_BEACH_WIDTH       
					,TA_BEACH_SHAPE       
					,TA_BEACH_SLOPE       
					,TA_BEACH_SAFE_DISTANCE
					,TA_SUM_AREA          
					,TA_SUM_GAGU_CNT    
					,TA_SUM_TYPE    
					,TA_SUM_COASTLINE
					,TA_TIME;
	
	
	//T_TOURISM_MENU
	private String  TM_KEYNO
					,TM_TR_KEYNO
					,TM_NAME
					,TM_PRICE
					,TM_IMG
					,TM_SUMMARY
					,TM_ORDER
					,TM_MAINYN;   
	
	//T_TOURISM_GUESTROOM
	private String 	TG_KEYNO
					,TG_TL_KEYNO
					,TG_NAME             
					,TG_SIZE_METER       
					,TG_PRICE_CONTENT            
					,TG_SURCHARGE        
					,TG_LOW_SEASON_FEE   
					,TG_SUMMER_SEASON_FEE
					,TG_WINTER_SEASON_FEE
					,TG_INWON_MIN_CNT    
					,TG_GIJUN_INWON      
					,TG_INWON_MAX_CNT   
					,TG_IMG              
					,TG_SUMMARY          
					,TG_SIZE_FLAT        
					,TG_ORDER;
	
	//T_TOURISM_LODGMENT
	private String   TL_KEYNO
					,TL_DIVISION
					,TL_TEL
					,TL_IBSIL_TIME
					,TL_TOESIL_TIME
					,TL_GUBI_SISEOL
					,TL_USE_JOGEON
					,TL_USE_RULE
					,TL_BREAKFAST_YN
					,TL_BEDROOM_CNT
					,TL_ONDOLROOM_CNT
					,TL_GROUPROOM_CNT
					,TL_CAMPING_SISEOL
					,TL_WIFI_YN
					,TL_TC_KEYNO
					,TL_PRICE_CONTENT
					,TL_AREA
					,TL_EUB
					,TL_OWNER;
	
	//T_TOURISM_RESTAURANT
	private String  TR_KEYNO
					,TR_DIVISION
					,TR_TC_KEYNO
					,TR_START_TIME
					,TR_END_TIME
					,TR_GUBI_SISEOL
					,TR_FOOD_TYPE
					,TR_PACKING_YN
					,TR_HOLIDAY
					,TR_PETS_YN
					,TR_WIFI_YN
					,TR_STROLLER_YN
					,TR_ROOM_CNT
					,TR_SMOKING_CNT
					,TR_PARKING
					,TR_SEAT_CNT
					,TR_BOOKING
					,TR_MAIN_MENU
					,TR_OWNER;
	
	//T_TOURISM_IMAGE
	private String 	TIM_TC_KEYNO
					, TIM_TM_KEYNO
					, TIM_TG_KEYNO
					, TIM_FS_KEYNO
					, TIM_ORDER;
	
	
	//메뉴 등록되어있는지 체크
	private String MENUYN;
	private boolean MENUCK = true;
	
}
