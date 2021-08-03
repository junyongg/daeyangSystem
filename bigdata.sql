-- MySQL dump 10.16  Distrib 10.1.45-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bigdata
-- ------------------------------------------------------
-- Server version	10.1.45-MariaDB-1~xenial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `AUTHORITY_VIEW`
--

DROP TABLE IF EXISTS `AUTHORITY_VIEW`;
/*!50001 DROP VIEW IF EXISTS `AUTHORITY_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `AUTHORITY_VIEW` (
  `LEV` tinyint NOT NULL,
  `URL` tinyint NOT NULL,
  `AUTHORITY` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `B_BOARD_COLUMN`
--

DROP TABLE IF EXISTS `B_BOARD_COLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_COLUMN` (
  `BL_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BL_BT_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판 타입관리 키',
  `BL_COLUMN_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼명',
  `BL_COLUMN_SIZE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼 가로크기',
  `BL_COLUMN_LEVEL` int(2) DEFAULT NULL COMMENT '정렬순서',
  `BL_LISTVIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼정보 리스트에 노출여부',
  `BL_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼타입',
  `BL_OPTION_DATA` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼 옵션데이터(SELECT, RADIO)옵션',
  `BL_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BL_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `BL_VALIDATE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '폼 필수입력값',
  PRIMARY KEY (`BL_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 컬럼정보 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_COLUMN_DATA`
--

DROP TABLE IF EXISTS `B_BOARD_COLUMN_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_COLUMN_DATA` (
  `BD_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BD_BT_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판타입키',
  `BD_BN_KEYNO` int(11) DEFAULT NULL COMMENT '게시물키',
  `BD_BL_KEYNO` int(11) DEFAULT NULL COMMENT '게시판컬럼키',
  `BD_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `BD_BL_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼타입',
  `BD_DATA` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해당컬럼데이터',
  PRIMARY KEY (`BD_KEYNO`),
  KEY `BD_BN_KEYNO` (`BD_BN_KEYNO`),
  KEY `BD_BL_KEYNO` (`BD_BL_KEYNO`),
  KEY `BN_BL` (`BD_BN_KEYNO`,`BD_BL_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물등록시 각컬럼의 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_COLUMN_DATA_HISTORY`
--

DROP TABLE IF EXISTS `B_BOARD_COLUMN_DATA_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_COLUMN_DATA_HISTORY` (
  `BDH_BD_KEYNO` int(11) DEFAULT NULL COMMENT '컬럼데이터 기본키',
  `BDH_BD_BT_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판타입키',
  `BDH_BD_BN_KEYNO` int(11) DEFAULT NULL COMMENT '게시물키',
  `BDH_BD_BL_KEYNO` int(11) DEFAULT NULL COMMENT '게시판컬럼키',
  `BDH_BD_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `BDH_BD_BL_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '컬럼타입',
  `BDH_BD_DATA` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해당컬럼데이터',
  `BDH_BNH_KEYNO` int(11) DEFAULT NULL COMMENT '게시물 히스토리 게시물키'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물등록시 각컬럼의 데이터 - 기록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_COMMENT`
--

DROP TABLE IF EXISTS `B_BOARD_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_COMMENT` (
  `BC_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BC_BN_KEYNO` int(11) DEFAULT NULL COMMENT '게시물키',
  `BC_CONTENTS` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `BC_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BC_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `BC_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BC_DELDT` datetime DEFAULT NULL COMMENT '삭제일',
  `BC_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `BC_UP_CNT` int(10) DEFAULT '0' COMMENT '좋아요',
  `BC_DOWN_CNT` int(10) DEFAULT '0' COMMENT '싫어요',
  `BC_MAINKEY` int(11) DEFAULT NULL COMMENT '부모키',
  `BC_ROOTKEY` int(11) DEFAULT NULL COMMENT '최상단 부모키',
  `BC_SECRET_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '비밀댓글여부',
  PRIMARY KEY (`BC_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물 댓글관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_COMMENT_LIKE`
--

DROP TABLE IF EXISTS `B_BOARD_COMMENT_LIKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_COMMENT_LIKE` (
  `BCS_UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '유저키',
  `BCS_BC_KEYNO` int(11) NOT NULL COMMENT '댓글키',
  `BCS_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `BCS_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공감 타입',
  PRIMARY KEY (`BCS_UI_KEYNO`,`BCS_BC_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='댓글 공감갯수 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_INTRO_HTML`
--

DROP TABLE IF EXISTS `B_BOARD_INTRO_HTML`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_INTRO_HTML` (
  `BIH_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BIH_MN_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `BIH_BT_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판타입키',
  `BIH_CONTENTS` longtext COLLATE utf8mb4_unicode_ci COMMENT 'HTML내용',
  `BIH_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BIH_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `BIH_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `BIH_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BIH_DIV_LOCATION` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DIV위치',
  PRIMARY KEY (`BIH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판중 소개HTML이 필요한페이지 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_MAINMINI`
--

DROP TABLE IF EXISTS `B_BOARD_MAINMINI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_MAINMINI` (
  `BMM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `BMM_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판메뉴키',
  `BMM_SIZE` int(2) NOT NULL COMMENT '갯수',
  `BMM_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT '양식',
  `BMM_REGDT` datetime DEFAULT NULL COMMENT '등록날짜',
  `BMM_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BMM_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `BMM_MN_HOMEDIV_C` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지명',
  `BMM_SUBJECT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `BMM_SORT_COLUMN` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정렬 기준',
  `BMM_SORT_DIRECTION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '정렬 방향',
  PRIMARY KEY (`BMM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메인 미니게시판 관리	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_NOTICE`
--

DROP TABLE IF EXISTS `B_BOARD_NOTICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_NOTICE` (
  `BN_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BN_MN_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `BN_FM_KEYNO` int(11) DEFAULT NULL COMMENT '파일키',
  `BN_TITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `BN_CONTENTS` longtext COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `BN_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BN_PWD` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비회원 비밀번',
  `BN_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `BN_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `BN_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `BN_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BN_SECRET_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀글여부',
  `BN_THUMBNAIL` int(11) DEFAULT NULL COMMENT '썸네일',
  `BN_HITS` int(10) DEFAULT '0' COMMENT '조회수',
  `BN_IMPORTANT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '공지여부',
  `BN_IMPORTANT_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공지종료일',
  `BN_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `BN_MAINKEY` int(11) DEFAULT NULL COMMENT '메인 키',
  `BN_PARENTKEY` int(11) DEFAULT NULL COMMENT '부모 키',
  `BN_SEQ` int(3) DEFAULT NULL COMMENT '답글 순서',
  `BN_DEPTH` int(2) DEFAULT NULL COMMENT '답글 뎁스',
  `BN_MOVE_MEMO` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '이동 사유',
  `BN_GONGNULI_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공공누리 타입',
  `BN_CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 셀렉트',
  PRIMARY KEY (`BN_KEYNO`),
  KEY `BN_FM_KEYNO` (`BN_FM_KEYNO`),
  KEY `BN_MN_KEYNO` (`BN_MN_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_NOTICE_HISTORY`
--

DROP TABLE IF EXISTS `B_BOARD_NOTICE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_NOTICE_HISTORY` (
  `BNH_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `BNH_BN_KEYNO` int(11) DEFAULT NULL COMMENT '게시판 기본키',
  `BNH_BN_MN_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `BNH_BN_FM_KEYNO` int(11) DEFAULT NULL COMMENT '파일키',
  `BNH_BN_TITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `BNH_BN_CONTENTS` longtext COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `BNH_BN_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BNH_BN_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `BNH_BN_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `BNH_BN_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `BNH_BN_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BNH_BN_SECRET_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀글여부',
  `BNH_BN_THUMBNAIL` int(11) DEFAULT NULL COMMENT '썸네일',
  `BNH_BN_HITS` int(10) DEFAULT '0' COMMENT '조회수',
  `BNH_BN_IMPORTANT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '공지여부',
  `BNH_BN_IMPORTANT_DATE` datetime DEFAULT NULL COMMENT '공지종료일',
  PRIMARY KEY (`BNH_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물관리 - 기록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_SKIN_PACKAGE`
--

DROP TABLE IF EXISTS `B_BOARD_SKIN_PACKAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_SKIN_PACKAGE` (
  `BSP_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '패키지 키값',
  `BSP_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '패키지 명',
  `BSP_LIST_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '리스트키',
  `BSP_DETAIL_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세페이지 키',
  `BSP_INSERT_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록페이지 키',
  `BSP_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `BSP_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `BSP_DELETE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`BSP_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_SKIN_TEMPLATE`
--

DROP TABLE IF EXISTS `B_BOARD_SKIN_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_SKIN_TEMPLATE` (
  `BST_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '스킨키',
  `BST_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT '스킨데이터',
  `BST_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `BST_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `BST_DELETE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `BST_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '스킨명',
  `BST_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타입(list, insert, detail)',
  PRIMARY KEY (`BST_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 개별 스킨 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `B_BOARD_TYPE`
--

DROP TABLE IF EXISTS `B_BOARD_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_BOARD_TYPE` (
  `BT_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `BT_TYPE_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판타입 제목',
  `BT_CODEKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판 유형',
  `BT_REPLY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답글 사용여부',
  `BT_COMMENT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '댓글 사용여부',
  `BT_SECRET_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀글 사용여부',
  `BT_UPLOAD_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업로드 사용여부',
  `BT_FILE_CNT_LIMIT` int(11) DEFAULT NULL COMMENT '파일 수 제한',
  `BT_FILE_SIZE_LIMIT` int(11) DEFAULT NULL COMMENT '파일 크기 제한',
  `BT_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `BT_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `BT_MODNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `BT_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `BT_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `BT_EDU_PR_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약 프로그램 사용여부',
  `BT_TICKET_PR_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '티켓예매 프로그램 사용여부',
  `BT_SNS_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS공유 사용여부',
  `BT_RSS_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RSS 사용여부',
  `BT_HTML_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소개HTML사용여부',
  `BT_THUMBNAIL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '썸네일 사용여부',
  `BT_THUMBNAIL_WIDTH` int(4) DEFAULT NULL COMMENT '썸네일 리사이즈 width 값',
  `BT_THUMBNAIL_HEIGHT` int(4) DEFAULT NULL COMMENT '썸네일 리사이즈 height 값',
  `BT_PAGEUNIT` int(2) DEFAULT NULL COMMENT '한 페이지당 게시되는 게시물 건 수',
  `BT_PAGESIZE` int(2) DEFAULT NULL COMMENT '페이지 리스트에 게시되는 페이지 건수',
  `BT_DEL_LISTVIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '삭제된 게시물 리스트에 보여질지 여부',
  `BT_EMAIL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '글 등록시 이메일 수신여부',
  `BT_EMAIL_ADDRESS` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '글 등록시 이메일 수신할 주소',
  `BT_XSS_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT 'xss 필터 적용 여부',
  `BT_DEL_COMMENT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제된 댓글 보여질지 여부',
  `BT_HTMLMAKER_PLUS_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTML 메이커 추가여부',
  `BT_FILE_IMAGE_WIDTH` int(4) DEFAULT NULL COMMENT '파일 이미지 리사이즈 width값',
  `BT_FILE_IMAGE_HEIGHT` int(4) DEFAULT NULL COMMENT '파일 이미지 리사이즈 height값',
  `BT_FILE_EXT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일 확장자',
  `BT_NUMBERING_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '번호 넘버링(V: 가상번호, R: 실제번호)',
  `BT_SHOW_MINE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '자기가 쓴글만 보이기 여부',
  `BT_DEL_POLICY` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시물 삭제 정책(Y:논리삭제, N:물리삭제)',
  `BT_PERSONAL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '개인정보보안 여부',
  `BT_ZIP_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '파일 압축 여부',
  `BT_PERSONAL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보보안 종류',
  `BT_MOVIE_THUMBNAIL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '동영상 썸네일 생성 여부',
  `BT_CATEGORY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '카테고리 설정 여부',
  `BT_CATEGORY_INPUT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 요소 설정 |으로 구분',
  `BT_SECRET_COMMENT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '비밀댓글사용여부',
  `BT_THUMBNAIL_INSERT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '썸네일 자동생성여부',
  `BT_LIST_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '리스트 스킨 키값',
  `BT_DETAIL_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세페이지 스킨 키값',
  `BT_INSERT_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록페이지 스킨 키값',
  `BT_CALENDAR_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `BT_PREVIEW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '파일 미리보기 여부',
  `BT_PAGEUNIT_C` int(2) DEFAULT NULL COMMENT '한 페이지당 게시되는 댓글 건 수',
  `BT_PAGESIZE_C` int(2) DEFAULT NULL COMMENT '댓글 리스트에 게시되는 페이지 건 수',
  PRIMARY KEY (`BT_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 타입관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CURRENT_DATA`
--

DROP TABLE IF EXISTS `CURRENT_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURRENT_DATA` (
  `CN_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `CN_SOLATION` varchar(100) DEFAULT NULL,
  `CN_SUNSHINE` varchar(100) DEFAULT NULL,
  `CN_CLOUD` varchar(100) DEFAULT NULL,
  `CN_TEMP` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CN_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `C_CRAWLING`
--

DROP TABLE IF EXISTS `C_CRAWLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_CRAWLING` (
  `CR_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `CR_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CR_CONTENT` varchar(990) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CR_DATE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CR_RESULT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CR_TYPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CR_LINK` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CR_KEYNO`),
  FULLTEXT KEY `TEST_IDX` (`CR_CONTENT`),
  FULLTEXT KEY `CR_CONTENT` (`CR_CONTENT`,`CR_TITLE`),
  FULLTEXT KEY `CR_CONTENT_2` (`CR_CONTENT`)
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `C_CRAWLING_KEYWORD`
--

DROP TABLE IF EXISTS `C_CRAWLING_KEYWORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_CRAWLING_KEYWORD` (
  `CRK_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `CRK_WORD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRK_TYPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CRK_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ELECTRONIX`
--

DROP TABLE IF EXISTS `ELECTRONIX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ELECTRONIX` (
  `EL_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `EL_DATE` varchar(100) DEFAULT NULL,
  `EL_DATA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EL_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMS`
--

DROP TABLE IF EXISTS `EMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMS` (
  `SystemV` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `SystemC` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `SOC` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `SOH` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage3` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage4` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage5` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage6` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage7` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage8` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage9` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage10` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage11` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage12` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage13` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Voltage14` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp3` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp4` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp5` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp6` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp7` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp8` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Temp9` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Aram1` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Aram2` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onoff` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectData`
--

DROP TABLE IF EXISTS `ElectData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElectData` (
  `ED_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `ED_DATE` varchar(100) DEFAULT NULL,
  `ED_ELECTRIC` varchar(100) DEFAULT NULL,
  `ED_TYPE` varchar(100) DEFAULT 'young',
  PRIMARY KEY (`ED_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2734 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectDateData`
--

DROP TABLE IF EXISTS `ElectDateData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElectDateData` (
  `AND_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `AND_DATE` varchar(100) DEFAULT NULL,
  `AND_SOLATION` varchar(100) DEFAULT NULL,
  `AND_SUNSHINE` varchar(100) DEFAULT NULL,
  `AND_CLOUD` varchar(100) DEFAULT NULL,
  `AND_TYPE` varchar(100) DEFAULT 'young',
  PRIMARY KEY (`AND_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=1823 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PCS`
--

DROP TABLE IF EXISTS `PCS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PCS` (
  `PCS_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `InputVoltageR` varchar(100) DEFAULT NULL,
  `BatteryVoltage` varchar(100) DEFAULT NULL,
  `OutputVoltageR` varchar(100) DEFAULT NULL,
  `OutputActivePowerR` varchar(100) DEFAULT NULL,
  `OutputFrequency` varchar(100) DEFAULT NULL,
  `ComponentMaxTemp` varchar(100) DEFAULT NULL,
  `BatteryCapacity` varchar(100) DEFAULT NULL,
  `BatteryCurrent` varchar(100) DEFAULT NULL,
  `SolarInputVoltage1` varchar(100) DEFAULT NULL,
  `OutputApparentPowerR` varchar(100) DEFAULT NULL,
  `InputFrequency` varchar(100) DEFAULT NULL,
  `InnerTemp` varchar(100) DEFAULT NULL,
  `WorkingStatus` varchar(100) DEFAULT NULL,
  `BatteryPower` varchar(100) DEFAULT NULL,
  `PcsControl` varchar(100) DEFAULT NULL,
  `SupplyToLoad` varchar(100) DEFAULT NULL,
  `WorkingMode` varchar(100) DEFAULT NULL,
  `FaultCodeIdStoredInFlash` varchar(100) DEFAULT NULL,
  `CommandForFaultRecovery` varchar(100) DEFAULT NULL,
  `StartTimeforEnableWorking` varchar(100) DEFAULT NULL,
  `EndTimeforEnableWorking` varchar(100) DEFAULT NULL,
  `StartTime2forEnableWorking` varchar(100) DEFAULT NULL,
  `EndTime2forEnableWorking` varchar(100) DEFAULT NULL,
  `StartTimeforAcLoad` varchar(100) DEFAULT NULL,
  `EndTimeforAcLoad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PCS_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_COMMON_CODE_MAIN`
--

DROP TABLE IF EXISTS `S_COMMON_CODE_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_COMMON_CODE_MAIN` (
  `MC_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상위코드 키',
  `MC_CODENM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드명칭',
  `MC_REGDT` datetime DEFAULT NULL COMMENT '등록일자',
  `MC_MODDT` datetime DEFAULT NULL COMMENT '최근수정일자',
  `MC_IN_C` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내부코드값',
  `MC_SYS_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '시스템코드 여부',
  `MC_USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  PRIMARY KEY (`MC_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='공통관리 - 코드관리 - 상위코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_COMMON_CODE_SUB`
--

DROP TABLE IF EXISTS `S_COMMON_CODE_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_COMMON_CODE_SUB` (
  `SC_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서브코드 키',
  `SC_MC_IN_C` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상위코드 내부 코드번호',
  `SC_CODENM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브 코드 명',
  `SC_CODEVAL01` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 값_01',
  `SC_CODEVAL02` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 값_02',
  `SC_CODELV` int(20) DEFAULT NULL COMMENT '서브 코드 정렬순서',
  `SC_USE_YN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y' COMMENT '코드 사용 여부',
  `SC_TEMP` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SC_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='공통관리 - 코드관리 - 서브코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_COMMON_FILE_MAIN`
--

DROP TABLE IF EXISTS `S_COMMON_FILE_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_COMMON_FILE_MAIN` (
  `FM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `FM_REGDT` datetime DEFAULT NULL COMMENT '업로드일자',
  `FM_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업로드 사용자',
  `FM_WHERE_KEYS` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용 처 추적용 키 목록',
  `FM_COMMENTS` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일 설명',
  `FM_ZIP_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '압축 파일 경로',
  PRIMARY KEY (`FM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=1451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='공통관리 - 파일관리 - 그룹상위정보관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_COMMON_FILE_SUB`
--

DROP TABLE IF EXISTS `S_COMMON_FILE_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_COMMON_FILE_SUB` (
  `FS_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `FS_FM_KEYNO` int(11) DEFAULT NULL COMMENT '파일 상위 그룹키',
  `FS_FILE_SIZE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일크기',
  `FS_ORINM` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본파일명',
  `FS_CHANGENM` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드화한 파일명',
  `FS_EXT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '확장자',
  `FS_FOLDER` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일경로지정',
  `FS_DOWNCNT` int(16) DEFAULT '0' COMMENT '다운로드 횟수',
  `FS_M_KEYNO` int(11) DEFAULT NULL COMMENT '모바일 리사이즈 이미지 키 ',
  `FS_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `FS_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자 키',
  `FS_THUMBNAIL` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '썸네일 파일명',
  `FS_ALT` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 파일 주석',
  `FS_COMMENTS` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일 설명',
  `FS_ORIWIDTH` int(11) DEFAULT '0' COMMENT '원본이미지 가로픽셀',
  `FS_ORIHEIGHT` int(11) DEFAULT '0' COMMENT '원본이미지 세로픽셀',
  `FS_ORDER` int(3) DEFAULT '0' COMMENT '정렬순서',
  `FS_STORAGE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'none' COMMENT '스토리지',
  `FS_PUBLIC_PATH` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `FS_CONVERT_PATH` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변환 파일 저장 경로',
  `FS_CONVERT_CHK` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '변환 여부',
  PRIMARY KEY (`FS_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='공통관리 - 파일관리 - 상세파일정보관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_COMMON_SEQ_CNT`
--

DROP TABLE IF EXISTS `S_COMMON_SEQ_CNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_COMMON_SEQ_CNT` (
  `SQ_TABLE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SQ_CNT` int(10) DEFAULT NULL,
  `SQ_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''R'' 랜덤방식'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='고유키 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_HOME_AUTHORITY_MANAGER`
--

DROP TABLE IF EXISTS `S_HOME_AUTHORITY_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_HOME_AUTHORITY_MANAGER` (
  `HM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '홈페이지 키',
  `UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한 키',
  `HAM_DEFAULT_URL` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시작 url',
  PRIMARY KEY (`HM_KEYNO`,`UIA_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='홈페이지 권한별 설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_HOME_MANAGER`
--

DROP TABLE IF EXISTS `S_HOME_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_HOME_MANAGER` (
  `HM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HM_MN_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HM_TILES` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HM_MENU_DEPTH` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HM_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `HM_FAVICON` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'favicon.ico 파일 경로',
  `HM_LANG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '웹접근성 언어',
  `HM_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 타이틀명',
  `HM_MAIN_HOME` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '대표홈페이지',
  `HM_LOGIN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '로그인 사용여부',
  `HM_RESEARCH_SKIN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지평가 스킨',
  `HM_POPUP_SKIN_W` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업 레이아웃형 스킨',
  `HM_POPUP_SKIN_B` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업 배너형 스킨',
  `HM_SITE_PATH` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 경로',
  `HM_META_DESC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 메타 설명',
  `HM_META_KEYWORD` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 메타 키워드',
  PRIMARY KEY (`HM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='각 홈페이지 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_MENU_MANAGER`
--

DROP TABLE IF EXISTS `S_MENU_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_MENU_MANAGER` (
  `MN_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `MN_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 명칭',
  `MN_HOMEDIV_C` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지구분',
  `MN_PAGEDIV_C` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지형태 ',
  `MN_URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지URL정보',
  `MN_FORWARD_URL` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ' ' COMMENT '포워딩 URL',
  `MN_MAINKEY` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부모 메뉴키',
  `MN_ORDER` int(20) DEFAULT NULL COMMENT '메뉴 정렬 순서',
  `MN_LEV` int(1) DEFAULT NULL COMMENT '메뉴 레벨',
  `MN_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '활성화 여부',
  `MN_REGDT` datetime DEFAULT NULL COMMENT '등록일자',
  `MN_MODDT` datetime DEFAULT NULL COMMENT '최근 수정일자',
  `MN_REGNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `MN_MODNM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최근 수정자',
  `MN_DELDT` datetime DEFAULT NULL COMMENT '삭제일자',
  `MN_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `MN_SHOW_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '해더에 메뉴 표시 여부',
  `MN_BT_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판타입키',
  `MN_ICON_CSS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CSS아이콘 클래스명(font-awesome)',
  `MN_ICON_URL1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이콘 이미지URL1',
  `MN_ICON_URL2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이콘 이미지URL2',
  `MN_LAYTYPE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'LAYOUT TYPE',
  `MN_ENG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영어메뉴명칭',
  `MN_DEP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자부서',
  `MN_COLOR` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 컬러',
  `MN_DATA1` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 기타 컬럼 1',
  `MN_DATA2` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 기타 컬럼 2',
  `MN_DATA3` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 기타 컬럼 3',
  `MN_RESEARCH` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '페이지 평가 사용여부',
  `MN_QRCODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '페이지평가 - 큐알코드 사용여부',
  `MN_MANAGER` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지 평가 - 콘텐츠 담당자',
  `MN_QR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'QR코드 FS키',
  `MN_TOURKEY` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 타입 관광일때 관광 테이블키',
  `MN_MANAGER_DEP` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지 평가 - 담당부서',
  `MN_MANAGER_TEL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지 평가 - 담당 연락처',
  `MN_DU_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직원 키값',
  `MN_GONGNULI_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공공누리 타입',
  `MN_GONGNULI_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '공공누리 사용여부',
  `MN_EMAIL` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판 이메일',
  `MN_NEWLINK` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '메뉴 클릭시 새창으로 열릴지 여부',
  `MN_META_DESC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 메타 설명',
  `MN_META_KEYWORD` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 메타 키워드',
  `MN_CHANGE_FREQ` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'monthly' COMMENT '사이트맵 빈도수',
  `MN_PRIORITY` decimal(2,1) DEFAULT '0.8' COMMENT '사이트맵 우선순위',
  PRIMARY KEY (`MN_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='메뉴관리 메인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_MENU_TEMPLATE`
--

DROP TABLE IF EXISTS `S_MENU_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_MENU_TEMPLATE` (
  `SMT_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `SMT_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT '양식',
  `SMT_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `SMT_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록날짜',
  `SMT_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `SMT_SUBJECT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴 헤더 템플렛 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_MENU_VIEW_DATA`
--

DROP TABLE IF EXISTS `S_MENU_VIEW_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_MENU_VIEW_DATA` (
  `MVD_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '키',
  `MVD_MN_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴테이블 키',
  `MVD_MN_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴홈구분코드',
  `MVD_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '뷰 소스 데이터',
  `MVD_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `MVD_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `MVD_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `MVD_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `MVD_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제유무',
  `MVD_EDITOR_TYPE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '에디터 타입',
  PRIMARY KEY (`MVD_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴관리 - 뷰형 데이터저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_MENU_VIEW_DATA_HISTORY`
--

DROP TABLE IF EXISTS `S_MENU_VIEW_DATA_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_MENU_VIEW_DATA_HISTORY` (
  `MVH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `MVH_MVD_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인 고유티',
  `MVH_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '데이터',
  `MVH_STDT` datetime DEFAULT NULL COMMENT '게시기간 시작',
  `MVH_ENDT` datetime DEFAULT NULL COMMENT '게시기간 종료',
  `MVH_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정한사람',
  `MVH_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `MVH_VERSION` decimal(10,2) DEFAULT NULL COMMENT '버전',
  `MVH_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  PRIMARY KEY (`MVH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='뷰형 데이터 히스토리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_RESOURCES_MANAGER`
--

DROP TABLE IF EXISTS `S_RESOURCES_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_RESOURCES_MANAGER` (
  `RM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `RM_MN_HOMEDIV_C` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴홈구분코드',
  `RM_SCOPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용범위',
  `RM_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경로(PATH)',
  `RM_FILE_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일명',
  `RM_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '소스 데이터',
  `RM_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `RM_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `RM_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `RM_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `RM_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제유무',
  `RM_TYPE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타입',
  `RM_ORDER` int(3) DEFAULT '0' COMMENT '순서',
  PRIMARY KEY (`RM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리소스 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_RESOURCES_MANAGER_HISTORY`
--

DROP TABLE IF EXISTS `S_RESOURCES_MANAGER_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_RESOURCES_MANAGER_HISTORY` (
  `RMH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `RMH_RM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 기본키',
  `RMH_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '데이터',
  `RMH_STDT` datetime DEFAULT NULL COMMENT '적용기간 시작',
  `RMH_ENDT` datetime DEFAULT NULL COMMENT '적용기간 종료',
  `RMH_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `RMH_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `RMH_VERSION` decimal(10,2) DEFAULT NULL COMMENT '버전',
  `RMH_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  PRIMARY KEY (`RMH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리소스 데이터 히스토리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_RESOURCES_MANAGER_SUB`
--

DROP TABLE IF EXISTS `S_RESOURCES_MANAGER_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_RESOURCES_MANAGER_SUB` (
  `RMS_RM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '리소스키',
  `RMS_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴키',
  `RMS_MN_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '메뉴 타입 (N: 단일, A: 전체)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리소스 서브 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `S_SITE_MANAGER`
--

DROP TABLE IF EXISTS `S_SITE_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S_SITE_MANAGER` (
  `USERID` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '아이디(실서버 운영시 id = server)',
  `RESOURCE_PATH` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '리소스 경로',
  `JSP_PATH` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jsp 경로',
  `FILE_EXT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일 확장자',
  `DAUM_APPKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '다음 앱 키',
  `GOOGLE_APPKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구글 앱키',
  `NAVER_APPKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '네이버 앱키',
  `EMAIL_SENDER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일 보내는 사람의 이메일',
  `EMAIL_SENDER_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일 보내는 사람 이름',
  `FILE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'upload 파일 경로',
  `PAGE_UNIT` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지 unit',
  `PAGE_SIZE` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지 size',
  `HOMEPAGE_REP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 홈페이지',
  `HOMEPAGE_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 이름',
  `SNS_DESCRIPTION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 공유 기본 설명',
  `SNS_IMAGE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 공유 기본 이미지',
  `SNS_IMAGE_WIDTH` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 공유 기본 이미지 width',
  `SNS_IMAGE_HEIGHT` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 공유 기본 이미지 height',
  `TOUR_START_LNG` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출발지 경도',
  `TOUR_START_LAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출발지 위도',
  `TOUR_START_TEXT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출발지 이름',
  `USER_DEL_POLICY` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '유저정보 삭제정책',
  `PASSWORD_CYCLE` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호 변경주기',
  `PASSWORD_REGEX` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호 정규식',
  `SALT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '솔트값',
  `SNSLOGIN_NAVER_CLIENT_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '네이버 클라이언트 아이디',
  `SNSLOGIN_NAVER_CALLBACK` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '네이버 콜백 유알엘',
  `SNSLOGIN_KAKAO_JSKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카카오 자바스크립트 키',
  `SNSLOGIN_FACEBOOK_APPID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이스북 앱 아이디',
  `SNSLOGIN_NAVER_CLIENT_SECRET` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '네이버 클라이언트 시크릿',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_ACTIVITY_HISTORY`
--

DROP TABLE IF EXISTS `T_ACTIVITY_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_ACTIVITY_HISTORY` (
  `AH_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `AH_UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유저키',
  `AH_IP` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `AH_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `AH_DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설명',
  `AH_MENU` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '방문메뉴',
  `AH_REFERER` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유입경로',
  `AH_DEVICE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모바일기기(I=IOS, A=ANDROID)',
  `AH_AGENT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유저정보',
  `AH_SESSION` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '세션값',
  `AH_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 구분',
  `AH_DATE` datetime DEFAULT NULL COMMENT '접속날짜',
  `AH_BROWSER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '브라우저',
  `AH_OS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'OS',
  PRIMARY KEY (`AH_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=58272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='활동 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICAITON_DISCOUNT_SELECT`
--

DROP TABLE IF EXISTS `T_APPLICAITON_DISCOUNT_SELECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICAITON_DISCOUNT_SELECT` (
  `AP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AD_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`AP_KEYNO`,`AD_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램에 적용된 할인정책 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICAITON_MANAGER`
--

DROP TABLE IF EXISTS `T_APPLICAITON_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICAITON_MANAGER` (
  `AP_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `AP_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 명',
  `AP_SUMMARY` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 설명',
  `AP_LIMIT_AGE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '나이제한 적용 여부',
  `AP_LIMIT_AGE_MIN` int(3) DEFAULT NULL COMMENT '나이제한 MIN',
  `AP_LIMIT_AGE_MAX` int(3) DEFAULT NULL COMMENT '나이제한 MAX',
  `AP_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 장소',
  `AP_PRICE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 요금',
  `AP_STDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 시작일시',
  `AP_ENDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 종료일시',
  `AP_DATE_COMMENT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 일정 코멘트',
  `AP_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `AP_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `AP_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `AP_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `AP_USE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT 'Y : 사용 N: 미사용 D:삭제',
  `AP_SEAT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좌석 지정 여부',
  `AP_LIMIT_PERSON` int(4) DEFAULT NULL COMMENT '제한인원',
  `AP_APPLY_ST_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예매시작일',
  `AP_APPLY_EN_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예매종료일',
  `AP_DEADLINE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '강제마감',
  `AP_BUTTON_TEXT1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청 전 버튼 텍스트',
  `AP_BUTTON_TEXT2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청 중 버튼 텍스트',
  `AP_BUTTON_TEXT3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마감 버튼 텍스트',
  `AP_TICKET_CNT` int(4) DEFAULT '0' COMMENT '최대티켓수',
  `AP_HOILDAY` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'A' COMMENT '휴일적용(A-모두적용, O-공휴일만, H-휴관일만 , N-적용안함)',
  `AP_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 타입',
  `AP_WAITING_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '대기자 유무',
  `AP_WAITING_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대기자 버튼 텍스트',
  `AP_EXPIRED` int(2) DEFAULT NULL COMMENT '결제 유효기간 일수',
  `AP_MN_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 키',
  PRIMARY KEY (`AP_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_CHARGE`
--

DROP TABLE IF EXISTS `T_APPLICATION_CHARGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_CHARGE` (
  `APC_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `APC_AP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 키',
  `APC_NAME` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요금명',
  `APC_PRICE` int(7) DEFAULT NULL COMMENT '가격',
  `APC_TARGET` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상',
  `APC_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  PRIMARY KEY (`APC_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청 프로그램 요금관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_DISCOUNT`
--

DROP TABLE IF EXISTS `T_APPLICATION_DISCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_DISCOUNT` (
  `AD_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `AD_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '할인정책 이름',
  `AD_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A: 퍼센트로 할인 , B: 고정금액 할인',
  `AD_MONEY` int(5) DEFAULT NULL COMMENT '할인 금액',
  `AD_COMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설명',
  `AD_DEFAULT_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기본 적용 여부',
  `AD_USE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT 'Y: 사용 N : 미사용 D: 삭제',
  PRIMARY KEY (`AD_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청프로그램 요금제 할인정책';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_PARTICIPATE`
--

DROP TABLE IF EXISTS `T_APPLICATION_PARTICIPATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_PARTICIPATE` (
  `APP_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `APP_AP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 키',
  `APP_ASM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 스케쥴 메인 키',
  `APP_APU_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 수강대상자 키',
  `APP_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `APP_ST_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청일자',
  `APP_ST_TIME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청시간',
  `APP_COUNT` int(2) DEFAULT NULL COMMENT '신청인원',
  `APP_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `APP_ASS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 스케줄 서브 키',
  `APP_SEQUENCE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회차',
  `APP_STATUS` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태값',
  `APP_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 구분',
  `APP_EXPIRED` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '결제만료일',
  PRIMARY KEY (`APP_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청 프로그램 참가인원 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_PARTICIPATE_SEAT`
--

DROP TABLE IF EXISTS `T_APPLICATION_PARTICIPATE_SEAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_PARTICIPATE_SEAT` (
  `APS_APP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '참가자키 상위',
  `APS_SEATNAME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좌석번호',
  `APS_APP_ST_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작날짜',
  `APS_APP_ST_TIME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작시간',
  `APS_AP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 기본키'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='참가자 좌석 목록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_SCHEDULE_MAIN`
--

DROP TABLE IF EXISTS `T_APPLICATION_SCHEDULE_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_SCHEDULE_MAIN` (
  `ASM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `ASM_AP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `ASM_NAME` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '클래스명',
  `ASM_STDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작일시',
  `ASM_ENDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료일시',
  `ASM_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `ASM_DAY` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '반복일',
  PRIMARY KEY (`ASM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청 프로그램 스케쥴 관리 메인 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_SCHEDULE_SUB`
--

DROP TABLE IF EXISTS `T_APPLICATION_SCHEDULE_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_SCHEDULE_SUB` (
  `ASS_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `ASS_ASM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `ASS_ST_TIME` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작 시간',
  `ASS_EN_TIME` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료 시간',
  `ASS_MAXIMUM` int(5) DEFAULT NULL COMMENT '제한인원',
  `ASS_SUBTITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경 제목',
  PRIMARY KEY (`ASS_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청 프로그램 스케쥴 관리 서브 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLICATION_USER`
--

DROP TABLE IF EXISTS `T_APPLICATION_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLICATION_USER` (
  `APU_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `APU_UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유저키',
  `APU_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `APU_RELATION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계',
  `APU_PHONE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '핸드폰',
  `APU_BIRTH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '생년월일',
  `APU_DELYN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `APU_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `APU_GENDER` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별',
  `APU_SELFYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '본인여부',
  PRIMARY KEY (`APU_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램 신청 수강대상자 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_APPLY_PARTICIPATE_DISCOUNT`
--

DROP TABLE IF EXISTS `T_APPLY_PARTICIPATE_DISCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_APPLY_PARTICIPATE_DISCOUNT` (
  `APD_AD_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '할인정책 키값',
  `APD_APP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '신청자 키값',
  `APD_CNT` int(3) DEFAULT NULL COMMENT '매수',
  `APD_PRICE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요금',
  PRIMARY KEY (`APD_AD_KEYNO`,`APD_APP_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신청프로그램 수강 신청자 요금 할인 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_COMMON_QRCODE`
--

DROP TABLE IF EXISTS `T_COMMON_QRCODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_COMMON_QRCODE` (
  `CQ_KEYNO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `CQ_URL` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드에 들어가는 주소',
  `CQ_FS_KEYNO` int(11) DEFAULT NULL COMMENT '파일 고유키',
  `CQ_NAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드 이름',
  `CQ_WIDTH` int(4) NOT NULL COMMENT '코드 너비',
  `CQ_HEIGHT` int(4) NOT NULL COMMENT '코드 높이',
  `CQ_DEL` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`CQ_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='QR코드 등록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_DEPARTMENT_MANAGER`
--

DROP TABLE IF EXISTS `T_DEPARTMENT_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DEPARTMENT_MANAGER` (
  `DN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '부서이름키',
  `DN_NAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '부서명',
  `DN_MAINKEY` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위부서',
  `DN_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `DN_CONTENTS` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직업무',
  `DN_TEMP` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '임시조직',
  `DN_LEV` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '순서',
  `DN_HOMEDIV_C` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 메뉴 구분',
  PRIMARY KEY (`DN_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='조직도 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_DEPARTMENT_USER_MANAGER`
--

DROP TABLE IF EXISTS `T_DEPARTMENT_USER_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DEPARTMENT_USER_MANAGER` (
  `DU_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `DU_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `DU_DN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소속 부서',
  `DU_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제 여부',
  `DU_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직책',
  `DU_LEV` int(2) DEFAULT NULL COMMENT '순서',
  `DU_CONTENTS` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업무내용',
  `DU_TEL` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전화번호',
  PRIMARY KEY (`DU_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='부서원 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_GROUP_MANAGER`
--

DROP TABLE IF EXISTS `T_GROUP_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_GROUP_MANAGER` (
  `GM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `GM_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 명',
  `GM_SUMMARY` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 설명',
  `GM_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 장소',
  `GM_DATE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 일시',
  `GM_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `GM_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `GM_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `GM_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `GM_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `GM_DIVISION` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 구분',
  `GM_MINIMUM` int(2) DEFAULT '10' COMMENT '최소인원',
  `GM_MAXIMUM` int(4) DEFAULT NULL COMMENT '정원',
  `GM_INTRODUCE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램소개',
  `GM_HOLIDAY` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'A' COMMENT '휴일적용(A-모두적용, O-공휴일만, H-휴관일만 , N-적용안함)',
  `GM_USE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '사용여부(Y : 사용, N: 사용안함, D: 삭제)',
  `GM_MN_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 키',
  PRIMARY KEY (`GM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='단체프로그램 신청관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_GROUP_PARTICIPATE`
--

DROP TABLE IF EXISTS `T_GROUP_PARTICIPATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_GROUP_PARTICIPATE` (
  `GP_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `GP_GM_KEYNO` int(11) DEFAULT NULL COMMENT '프로그램 키',
  `GP_GSS_KEYNO` int(11) DEFAULT NULL COMMENT '프로그램 서브키',
  `GP_UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '유저키',
  `GP_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인솔자 이름',
  `GP_PHONE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인솔자 연락처',
  `GP_HEADCOUNT` int(4) DEFAULT NULL COMMENT '관람신청인원수',
  `GP_TRAFFIC` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교통편(대중교통 : C, 버스 : B , 기타 : E )',
  `GP_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `GP_YUMOCAR` int(2) DEFAULT NULL COMMENT '유모차갯수',
  `GP_WHEELCHAIR` int(2) DEFAULT NULL COMMENT '휠체어갯수',
  `GP_GROUPNAME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '단체명',
  `GP_TRAFFIC_EXP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '교통기타',
  `GP_GSM_KEYNO` int(11) DEFAULT NULL COMMENT '프로그램 메인키',
  `GP_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청날짜',
  `GP_TIME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청시간',
  `GP_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`GP_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='단체관람 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_GROUP_SCHEDULE_MAIN`
--

DROP TABLE IF EXISTS `T_GROUP_SCHEDULE_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_GROUP_SCHEDULE_MAIN` (
  `GSM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `GSM_GM_KEYNO` int(11) DEFAULT NULL COMMENT '단체프로그램키',
  `GSM_STDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작일시',
  `GSM_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `GSM_ENDT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료일시',
  `GSM_DAY` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '반복일',
  PRIMARY KEY (`GSM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='단체 메인프로그램 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_GROUP_SCHEDULE_SUB`
--

DROP TABLE IF EXISTS `T_GROUP_SCHEDULE_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_GROUP_SCHEDULE_SUB` (
  `GSS_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `GSS_GSM_KEYNO` int(11) DEFAULT NULL COMMENT '메인프로그램키',
  `GSS_ST_TIME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작시간',
  `GSS_EN_TIME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료시간',
  `GSS_MAXIMUM` int(4) DEFAULT NULL COMMENT '변경 정원',
  `GSS_SUBTITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경 제목',
  PRIMARY KEY (`GSS_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='단체 서브프로그램 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_HOLIDAY_MANAGER`
--

DROP TABLE IF EXISTS `T_HOLIDAY_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_HOLIDAY_MANAGER` (
  `THM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유키',
  `THM_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `THM_LUNAR` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '음력 여부 Y : 음력 N:양력',
  `THM_DATE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '날짜',
  `THM_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT 'Y:매년 M:매월  D:매주 N: 반복없음',
  `THM_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `THM_NATIONAL` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공휴일 여부 Y/N',
  PRIMARY KEY (`THM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='휴일 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_IPFILTER_MAIN`
--

DROP TABLE IF EXISTS `T_IPFILTER_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_IPFILTER_MAIN` (
  `IPM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `IPM_URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용 URL',
  `IPM_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '화이트/블랙리스트',
  `IPM_USEYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부 Y/N',
  PRIMARY KEY (`IPM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='IP필터 관리 메인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_IPFILTER_SUB`
--

DROP TABLE IF EXISTS `T_IPFILTER_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_IPFILTER_SUB` (
  `IPS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `IPS_IPM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `IPS_IPADDRESS` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP 주소',
  `IPS_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''W'' 화이트리스트 ''B'' 블랙리스트',
  PRIMARY KEY (`IPS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='IP 필터 서브';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PAGE_RESEARCH_MANAGER`
--

DROP TABLE IF EXISTS `T_PAGE_RESEARCH_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PAGE_RESEARCH_MANAGER` (
  `TPS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `TPS_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  `TPS_HOME_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 키',
  `TPS_SCORE` int(1) DEFAULT NULL COMMENT '만족도 점수 5: 매우만족 1: 매우불만족',
  `TPS_COMMENT` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  `TPS_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `TPS_IP` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP',
  `TPS_SCORE_NAME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '점수명',
  PRIMARY KEY (`TPS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='페이지 평가 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PAGE_RESEARCH_SKIN`
--

DROP TABLE IF EXISTS `T_PAGE_RESEARCH_SKIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PAGE_RESEARCH_SKIN` (
  `PRS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `PRS_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT '양식',
  `PRS_REGDT` datetime DEFAULT NULL COMMENT '등록날짜',
  `PRS_MODDT` datetime DEFAULT NULL COMMENT '수정날짜',
  `PRS_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `PRS_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `PRS_SUBJECT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `PRS_DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`PRS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='페이지 평가 스킨 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PAGE_RESEARCH_SKIN_HISTORY`
--

DROP TABLE IF EXISTS `T_PAGE_RESEARCH_SKIN_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PAGE_RESEARCH_SKIN_HISTORY` (
  `PRSH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `PRSH_PRS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 기본키',
  `PRSH_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '데이터',
  `PRSH_STDT` datetime DEFAULT NULL COMMENT '적용기간 시작',
  `PRSH_ENDT` datetime DEFAULT NULL COMMENT '적용기간 종료',
  `PRSH_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `PRSH_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `PRSH_VERSION` decimal(10,2) DEFAULT NULL COMMENT '버전',
  `PRSH_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  PRIMARY KEY (`PRSH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='페이지평가 스킨 히스토리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PLACE_MANAGER`
--

DROP TABLE IF EXISTS `T_PLACE_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PLACE_MANAGER` (
  `PM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `PM_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장소명',
  `PM_FS_KEYNO` int(11) DEFAULT NULL COMMENT '장소이미지키값',
  `PM_USE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Y:사용 N:미사용 D: 삭제',
  `PM_SEAT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '총 좌석수',
  `PM_NAME_EN` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장소 영문명',
  `PM_SEATPLAN_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '좌석배치도 유무',
  `PM_SEATPLAN_WIDTH` int(5) DEFAULT NULL COMMENT '공간 WIDTH값',
  `PM_SEATPLAN_HEIGHT` int(5) DEFAULT NULL COMMENT '공간 HEIGHT값',
  `PM_SEAT_FS_KEYNO` int(11) DEFAULT NULL COMMENT '좌석프로그램 배경 키값',
  PRIMARY KEY (`PM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PLACE_SEATGROUP_MAIN`
--

DROP TABLE IF EXISTS `T_PLACE_SEATGROUP_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PLACE_SEATGROUP_MAIN` (
  `PSM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `PSM_PM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `PSM_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹명',
  `PSM_ROW` int(2) DEFAULT NULL COMMENT 'ROW',
  `PSM_COL` int(2) DEFAULT NULL COMMENT 'COL',
  `PSM_TOP` int(4) DEFAULT NULL COMMENT '그룹위치 TOP',
  `PSM_LEFT` int(4) DEFAULT NULL COMMENT '그룹위치 LEFT',
  PRIMARY KEY (`PSM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소 좌석배치도 메인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_PLACE_SEATGROUP_SUB`
--

DROP TABLE IF EXISTS `T_PLACE_SEATGROUP_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PLACE_SEATGROUP_SUB` (
  `PSS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `PSS_PSM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `PSS_ROW` int(2) DEFAULT NULL COMMENT 'ROW INDEX',
  `PSS_COL` int(2) DEFAULT NULL COMMENT 'COL INDEX',
  `PSS_CODE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좌석 코드',
  PRIMARY KEY (`PSS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='장소 좌석배치도 관리 서브';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPINFO`
--

DROP TABLE IF EXISTS `T_POPUPINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPINFO` (
  `PI_KEYNO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `PI_FS_KEYNO` int(11) DEFAULT NULL COMMENT '파일키',
  `PI_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `PI_TOP_LOC` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상단위치',
  `PI_LEFT_LOC` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '왼쪽위치',
  `PI_DEL` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `PI_CHECK` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '체크확인',
  `PI_STARTDAY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작날짜',
  `PI_ENDDAY` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '종료날짜',
  `PI_CONTENTS` longtext COLLATE utf8mb4_unicode_ci COMMENT '내용',
  `PI_WIDTH` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '300' COMMENT '팝업너비',
  `PI_HEIGHT` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '300' COMMENT '팝업높이',
  `PI_LINK` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업링크',
  `PI_LEVEL` int(3) DEFAULT NULL COMMENT '순서',
  `PI_MN_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'N : 단일메뉴 A : 해당 홈페이지 전체 메뉴',
  `PI_BACKGROUND_COLOR` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '백그라운드 칼라',
  `PI_TITLE_COLOR` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목 칼라',
  `PI_COMMENT_COLOR` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트 칼라',
  `PI_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A: 이미지형 B: 텍스트형',
  `PI_TITLE2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PI_DIVISION` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업 유형(W:윈도우 오픈형, B:배너형)',
  `PI_COMMENT` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '배너 내용',
  `PI_MN_KEYNO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PI_RESIZE_CHECK` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '리사이즈 체크',
  `PI_IMG_RESIZE_CHECK` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '레이아웃 이미지리사이즈체크',
  PRIMARY KEY (`PI_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업 등록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPINFO_SKIN`
--

DROP TABLE IF EXISTS `T_POPUPINFO_SKIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPINFO_SKIN` (
  `PIS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `PIS_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT '양식',
  `PIS_REGDT` datetime DEFAULT NULL COMMENT '등록날짜',
  `PIS_MODDT` datetime DEFAULT NULL COMMENT '수정날짜',
  `PIS_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `PIS_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `PIS_SUBJECT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `PIS_DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `PIS_DIVISION` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업 유형(W:윈도우 오픈형, B:배너형)',
  PRIMARY KEY (`PIS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업 스킨관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPINFO_SKIN_HISTORY`
--

DROP TABLE IF EXISTS `T_POPUPINFO_SKIN_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPINFO_SKIN_HISTORY` (
  `PISH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `PISH_PIS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 기본키',
  `PISH_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '데이터',
  `PISH_STDT` datetime DEFAULT NULL COMMENT '적용기간 시작',
  `PISH_ENDT` datetime DEFAULT NULL COMMENT '적용기간 종료',
  `PISH_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `PISH_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `PISH_VERSION` decimal(10,2) DEFAULT NULL COMMENT '버전',
  `PISH_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  PRIMARY KEY (`PISH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업 스킨 히스토리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPINFO_SUB`
--

DROP TABLE IF EXISTS `T_POPUPINFO_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPINFO_SUB` (
  `PC_PI_KEYNO` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팝업등록시 고유키 값',
  `PC_MAINKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인 메뉴 키',
  `PC_SUBKEY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서브 메뉴 키',
  `PC_PI_MN_TYPE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'N: 단일메뉴 A: 전체'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업 등록시 여러 페이지 키값 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPZONE_CATEGORY`
--

DROP TABLE IF EXISTS `T_POPUPZONE_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPZONE_CATEGORY` (
  `TCGM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TCGM_MN_HOMEDIV_C` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용 홈페이지 기본키',
  `TCGM_FORM` longtext COLLATE utf8mb4_unicode_ci COMMENT 'HTML소스(양식)',
  `TCGM_IMG_RESIZE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '이미지 리사이즈 여부',
  `TCGM_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `TCGM_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `TCGM_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '사용유무',
  `TCGM_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제유무',
  `TCGM_IMG_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '이미지 사용 여부',
  `TCGM_TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `TCGM_IMG_WIDTH` int(4) DEFAULT '0' COMMENT '이미지 리사이즈 width값',
  `TCGM_IMG_HEIGHT` int(4) DEFAULT '0' COMMENT '이미지 리사이즈 height값',
  PRIMARY KEY (`TCGM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='카테고리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_POPUPZONE_LIST`
--

DROP TABLE IF EXISTS `T_POPUPZONE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_POPUPZONE_LIST` (
  `TLM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TLM_ALT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부연설명(ALT)',
  `TLM_COMMENT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  `TLM_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크URL',
  `TLM_FS_KEYNO` int(11) DEFAULT NULL COMMENT '이미지 기본키(FS)',
  `TLM_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `TLM_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `TLM_USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '사용 여부',
  `TLM_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제 여부',
  `TLM_TCGM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 기본키',
  `TLM_DATE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '날짜 선택 여부',
  `TLM_STARTDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작날짜',
  `TLM_ENDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료날짜',
  `TLM_ORDER` int(20) DEFAULT NULL COMMENT '정렬순서',
  PRIMARY KEY (`TLM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리스트 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SEARCH_KEYWORD`
--

DROP TABLE IF EXISTS `T_SEARCH_KEYWORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SEARCH_KEYWORD` (
  `SK_KEYWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '키워드',
  `SK_REGDT` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '날짜',
  `SK_IP` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `SK_USERID` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '유저아이디',
  PRIMARY KEY (`SK_KEYWORD`,`SK_REGDT`,`SK_IP`,`SK_USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='키워드 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_MGR`
--

DROP TABLE IF EXISTS `T_SURVEY_MGR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_MGR` (
  `SM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '설문지 기본키',
  `SM_TITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문지 제목',
  `SM_EXP` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문지 기초 설명',
  `SM_STARTDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문시작일',
  `SM_ENDDT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문종료일',
  `SM_REGNM` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `SM_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `SM_IDYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '무기명 여부',
  `SM_USEYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '설문사용여부',
  `SM_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '설문삭제',
  `SM_HOMEYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '홈페이지 사용여부',
  `SM_PANEL_CNT` int(11) DEFAULT '0' COMMENT '설문참여인원',
  `SM_CNT_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'H' COMMENT '설문점수타입(점수:S/사람:H)',
  `SM_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '홈페이지 키',
  `SM_SS_KEYNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 스킨 키',
  PRIMARY KEY (`SM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문지 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_QUESTION`
--

DROP TABLE IF EXISTS `T_SURVEY_QUESTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_QUESTION` (
  `SQ_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '설문문항 기본키',
  `SQ_SM_KEYNO` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 메인키',
  `SQ_NUM` int(11) DEFAULT NULL COMMENT '문항 번호',
  `SQ_ST_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문항 타입',
  `SQ_QUESTION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문항 질문',
  `SQ_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '문항 삭제여부',
  `SQ_COMMENT` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문항 코멘트',
  `SQ_CK_MIN` int(3) DEFAULT '1' COMMENT '체크박스 최소값',
  `SQ_CK_MAX` int(3) DEFAULT '1' COMMENT '체크박스 최대값',
  `SQ_ORDER_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '라디오 기타의견 사용 유무',
  `SQ_KG_TEXT` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문항 카테고리 텍스트',
  `SQ_REQYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '체크박스 필수 / 선택',
  `SQ_IN_ORDER_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '라디오 내부 기타의견 사용 유무',
  PRIMARY KEY (`SQ_KEYNO`),
  KEY `FK_T_SURVEY_QUESTION_SQ_SM_KEYNO_T_SURVEY_MGR_SM_KEYNO` (`SQ_SM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문지 문항 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_QUESTION_OPTION`
--

DROP TABLE IF EXISTS `T_SURVEY_QUESTION_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_QUESTION_OPTION` (
  `SQO_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '설문 보기 기본키',
  `SQO_SQ_KEYNO` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 문항 키',
  `SQO_NUM` int(11) DEFAULT NULL COMMENT '보기 번호',
  `SQO_OPTION` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 보기 내용',
  `SQO_VALUE` int(11) DEFAULT NULL COMMENT '설문 보기 배점',
  `SQO_ORDER_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '설문 기타의견 유무',
  PRIMARY KEY (`SQO_KEYNO`),
  KEY `FK_T_SURVEY_QUESTION_OPTION_T_SURVEY_QUESTION_SQ_KEYNO` (`SQO_SQ_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문 문항 보기';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_RESULT_DATA`
--

DROP TABLE IF EXISTS `T_SURVEY_RESULT_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_RESULT_DATA` (
  `SRD_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '설문 결과 데이터 기본키',
  `SRD_SM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 메인키',
  `SRD_SRM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상위 키',
  `SRD_SQ_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문 문항 키',
  `SRD_DATA` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '주관식 내용',
  `SRD_SQO_KEYNO` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선택한 보기',
  `SRD_SQO_VALUE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보기 배점',
  `SRD_ETC_DATA` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문지 기타내용',
  `SRD_IN_DATA` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '기타의견 주관식 내용',
  PRIMARY KEY (`SRD_KEYNO`),
  KEY `FK_T_SURVEY_RESULT_DATA_SRD_SM_KEYNO_T_SURVEY_MGR_SM_KEYNO` (`SRD_SM_KEYNO`),
  KEY `FK_T_SURVEY_RESULT_DATA_SRD_SQ_KEYNO_T_SURVEY_QUESTION_SQ_KEYNO` (`SRD_SQ_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문 결과 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_RESULT_MGR`
--

DROP TABLE IF EXISTS `T_SURVEY_RESULT_MGR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_RESULT_MGR` (
  `SRM_KEYNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '설문결과 기본키',
  `SRM_SM_KEYNO` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문지 키',
  `SRM_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설문작성자',
  `SRM_REGDT` datetime DEFAULT NULL COMMENT '설문작성일',
  `SRM_IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이피',
  PRIMARY KEY (`SRM_KEYNO`),
  KEY `FK_T_SURVEY_RESULT_MGR_SRM_SM_KEYNO_T_SURVEY_MGR_SM_KEYNO` (`SRM_SM_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문 결과 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_SKIN`
--

DROP TABLE IF EXISTS `T_SURVEY_SKIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_SKIN` (
  `SS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `SS_SKIN_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '스킨명',
  `SS_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '소스 데이터',
  `SS_REGDT` datetime DEFAULT NULL COMMENT '작성일',
  `SS_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `SS_REGNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작성자',
  `SS_MODNM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `SS_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제유무',
  PRIMARY KEY (`SS_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문 스킨 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_SURVEY_SKIN_HISTORY`
--

DROP TABLE IF EXISTS `T_SURVEY_SKIN_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SURVEY_SKIN_HISTORY` (
  `SSH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `SSH_SS_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 기본키',
  `SSH_DATA` longtext COLLATE utf8mb4_unicode_ci COMMENT '데이터',
  `SSH_STDT` datetime DEFAULT NULL COMMENT '적용기간 시작',
  `SSH_ENDT` datetime DEFAULT NULL COMMENT '적용기간 종료',
  `SSH_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `SSH_DEL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `SSH_VERSION` decimal(10,2) DEFAULT NULL COMMENT '버전',
  `SSH_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  PRIMARY KEY (`SSH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=' 설문 스킨 데이터 히스토리 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_COMMON`
--

DROP TABLE IF EXISTS `T_TOURISM_COMMON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_COMMON` (
  `TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TC_TITLE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `TC_SUBTITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소제목',
  `TC_TAG` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '태그',
  `TC_THUMBNAIL` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '썸네일 이미지',
  `TC_SUMMARY` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요약소개',
  `TC_CONTENTS` longtext COLLATE utf8mb4_unicode_ci COMMENT '상세내용',
  `TC_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장소',
  `TC_ADDR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `TC_ADDR2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `TC_POST` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우편번호',
  `TC_MANAGER` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자',
  `TC_DEPARTMENT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당부서',
  `TC_CONTACTS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '담당자 연락처',
  `TC_LAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위도',
  `TC_LNG` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경도',
  `TC_UP_CNT` int(11) DEFAULT '0' COMMENT '추천수',
  `TC_DICTIONARY` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잡학사전',
  `TC_HOME_URL` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '홈페이지 URL',
  `TC_BLOG_URL` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 URL',
  `TC_SNS_URL` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS URL',
  `TC_RESERVATION_URL` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약사이트 URL',
  `TC_WAY_JAGA` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오시는길(자가용)',
  `TC_WAY_PUBLIC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오시는길(대중교통)',
  `TC_WAY_GUIDE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오시는길(교통안내)',
  `TC_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '타입',
  `TC_USE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `TC_SHOW_COLUMN` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TC_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `TC_REGNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `TC_MODDT` datetime DEFAULT NULL COMMENT '최종 수정일',
  `TC_MODNM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종 수정자',
  `TC_CONTACT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처',
  `TC_CONTACT2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TC_REPLY_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`TC_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관광정보 공통요소 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_COURSE_MAIN`
--

DROP TABLE IF EXISTS `T_TOURISM_COURSE_MAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_COURSE_MAIN` (
  `TCM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `TCM_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통정보 고유키',
  `TCM_TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이용안내 고유키',
  `TCM_SEASON` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추천계절',
  `TCM_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관람 소요시간',
  `TCM_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코스 타입',
  `TCM_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TCM_LEVEL` int(11) DEFAULT NULL,
  `TCM_CONTENTS` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`TCM_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='코스 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_COURSE_SUB`
--

DROP TABLE IF EXISTS `T_TOURISM_COURSE_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_COURSE_SUB` (
  `TCM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코스 메인키',
  `TCS_LAT` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '위도',
  `TCS_LNG` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '경도',
  `TCS_LEVEL` int(3) NOT NULL COMMENT '순서',
  `TCS_COMMENT` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코멘트',
  `TCS_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코스의 타입',
  `TCS_TYPE_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코스 키',
  `TCS_TITLE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `TCS_AUTO_DISTANCE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `TCS_DISTANCE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TCS_TIME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TCS_POSITON_TYPE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'D',
  KEY `T_TOURISM_COURSE_SUB_TCM_KEYNO_IDX` (`TCM_KEYNO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='코스 서브 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_CULTURAL_HERITAGE`
--

DROP TABLE IF EXISTS `T_TOURISM_CULTURAL_HERITAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_CULTURAL_HERITAGE` (
  `TCH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TCH_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TCH_TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이용안내 키',
  `TCH_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '소구분',
  `TCH_TYPE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종별',
  `TCH_LOCATION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소재지',
  `TCH_JIJEONG_DAY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지정일',
  `TCH_JIJEONG_NUM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지정번호',
  `TCH_ERA` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시대',
  `TCH_STRING1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TCH_STRING2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TCH_STRING3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TCH_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='문화재 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_DESTINATION`
--

DROP TABLE IF EXISTS `T_TOURISM_DESTINATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_DESTINATION` (
  `TA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TA_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TA_TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이용안내 키',
  `TA_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '소구분(관광, 섬, 산, 해수욕장, 야경, 대교)',
  `TA_GIGAN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기간',
  `TA_YAGAN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간개장',
  `TA_SEASON` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추천계절',
  `TA_SAN_SOGCHING` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '속칭',
  `TA_SAN_SCALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '규모(해발고도)',
  `TA_SAN_HANJANAME` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '한자명',
  `TA_BEACH_AREA` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '백사장 면적',
  `TA_BEACH_LONG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '백사장 길이',
  `TA_BEACH_WIDTH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '폭',
  `TA_BEACH_SHAPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해변형태',
  `TA_BEACH_SLOPE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '경사도',
  `TA_BEACH_SAFE_DISTANCE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '안전거리',
  `TA_SUM_AREA` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '면적',
  `TA_SUM_GAGU_CNT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가구 수',
  `TA_SUM_TYPE` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '도서유형(유인도 / 무인도)',
  `TA_SUM_COASTLINE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '해안선',
  `TA_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관광 소요시간',
  PRIMARY KEY (`TA_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관광명소 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_FESTIVAL`
--

DROP TABLE IF EXISTS `T_TOURISM_FESTIVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_FESTIVAL` (
  `TF_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TF_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TF_TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이용안내 키',
  `TF_START_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시작시간',
  `TF_END_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종료시간',
  `TF_JUGWAN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주관/주최',
  `TF_PURPOSE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목적',
  `TF_PROGRAM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주요프로그램',
  `TF_TERM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기간(일시)',
  `TF_NIGHT_STARTIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간 시작시간',
  `TF_NIGHT_ENDTIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '야간 종료시간',
  `TF_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '축제구분',
  `TF_CONTENTS` longtext COLLATE utf8mb4_unicode_ci,
  `TF_PLACE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='축제 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_GUESTROOM`
--

DROP TABLE IF EXISTS `T_TOURISM_GUESTROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_GUESTROOM` (
  `TG_TL_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '숙박 키',
  `TG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 이름',
  `TG_SIZE_METER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실크기(m)',
  `TG_PRICE_CONTENT` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 요금 설명',
  `TG_SURCHARGE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가요금',
  `TG_LOW_SEASON_FEE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비수기요금',
  `TG_SUMMER_SEASON_FEE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성수기요금(하계)',
  `TG_WINTER_SEASON_FEE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성수기요금(동계)',
  `TG_INWON_MIN_CNT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 최소 인원수',
  `TG_GIJUN_INWON` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준인원',
  `TG_INWON_MAX_CNT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 최대 인원수',
  `TG_IMG` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 이미지',
  `TG_SUMMARY` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실 설명',
  `TG_SIZE_FLAT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객실크기(평)',
  `TG_ORDER` int(2) DEFAULT NULL COMMENT '순서',
  `TG_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기본키'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='객실 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_IMAGE`
--

DROP TABLE IF EXISTS `T_TOURISM_IMAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_IMAGE` (
  `TIM_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관광정보 키',
  `TIM_FS_KEYNO` int(11) DEFAULT NULL COMMENT '파일키',
  `TIM_ORDER` int(2) NOT NULL COMMENT '이미지 순서',
  `TIM_TM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴(식당) 키',
  `TIM_TG_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '객식(숙박) 키'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관광 사진정보 관리 테이블 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_INFOMATION`
--

DROP TABLE IF EXISTS `T_TOURISM_INFOMATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_INFOMATION` (
  `TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TI_TIME` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이용시간',
  `TI_DETAIL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이용 상세안내',
  `TI_ENTRANCE_FEE` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입장료',
  `TI_CLOSED_DAY` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴무일',
  `TI_PARKING_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주차가능 여부',
  `TI_PARKING_PLACE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주차시설',
  `TI_CONVENIENCE_SISEOL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '편의시설',
  `TI_BUDAE_SISEOL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '부대시설',
  `TI_ETC_SISEOL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '장애인/노약자/임산부 시설정보',
  `TI_ETC_DETAIL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타 상세',
  `TI_LANG_SERVICE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '언어 서비스',
  PRIMARY KEY (`TI_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='이용안내 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_LODGMENT`
--

DROP TABLE IF EXISTS `T_TOURISM_LODGMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_LODGMENT` (
  `TL_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TL_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소구분(숙박업소, 펜션/민박, 야영장/휴양림, 호텔, 게스트 하우스)',
  `TL_TEL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '문의전화',
  `TL_IBSIL_TIME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입실시간',
  `TL_TOESIL_TIME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴실시간',
  `TL_GUBI_SISEOL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구비시설',
  `TL_USE_JOGEON` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이용조건',
  `TL_USE_RULE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '시설이용규칙',
  `TL_BREAKFAST_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조식제공여부',
  `TL_BEDROOM_CNT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '침실객실 수',
  `TL_ONDOLROOM_CNT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '온돌객실 수',
  `TL_GROUPROOM_CNT` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '단체실 수',
  `TL_CAMPING_SISEOL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '캠핑시설',
  `TL_WIFI_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '무료 와이파이 여부',
  `TL_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TL_PRICE_CONTENT` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요금안내',
  `TL_AREA` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TL_EUB` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TL_OWNER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TL_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='숙박 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_MENU`
--

DROP TABLE IF EXISTS `T_TOURISM_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_MENU` (
  `TM_TR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '식당키',
  `TM_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '음식이름',
  `TM_PRICE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '음식가격',
  `TM_IMG` int(11) DEFAULT NULL COMMENT '음식이미지',
  `TM_SUMMARY` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '음식 설명',
  `TM_ORDER` int(2) DEFAULT NULL COMMENT '순서',
  `TM_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TM_MAINYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '주메뉴여부'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_PROGRAM`
--

DROP TABLE IF EXISTS `T_TOURISM_PROGRAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_PROGRAM` (
  `TP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP_NAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP_PHONE1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP_EMAIL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_REGDT` date DEFAULT NULL,
  `TP_POST` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_ADDR1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_ADDR2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_PHONE2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_STATUS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_GENDER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_BIRTH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_RESERVED_DATE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP_COUNT` int(11) DEFAULT NULL,
  `TP_AREA` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_HAESEOL_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_COURSE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_PICUP_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_PLCUP_PLACE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_RESERVED_TIME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_USE_TIME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_COMMENT` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_IN_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_GROUP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_IN_PHONE1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_IN_PHONE2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TP_PASSWARD` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관광 프로그램 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_PROGRAM_SUB`
--

DROP TABLE IF EXISTS `T_TOURISM_PROGRAM_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_PROGRAM_SUB` (
  `TPS_TP_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TPS_PHONE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TPS_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TPS_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TPS_REGDT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관광 프로그램 서브 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_RESTAURANT`
--

DROP TABLE IF EXISTS `T_TOURISM_RESTAURANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_RESTAURANT` (
  `TR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TR_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '소구분(음식거리, 모범음식업소)',
  `TR_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TR_START_TIME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영업 시작시간',
  `TR_END_TIME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영업 마감시간',
  `TR_GUBI_SISEOL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '구비시설',
  `TR_FOOD_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '음식분류',
  `TR_PACKING_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '포장가능 여부',
  `TR_HOLIDAY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일',
  `TR_PETS_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '애완동물 출입여부',
  `TR_WIFI_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '와이파이 여부',
  `TR_STROLLER_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '유모차 출입여부',
  `TR_ROOM_CNT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '룸 수',
  `TR_SMOKING_CNT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '흡연석 여부',
  `TR_PARKING` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주차안내',
  `TR_SEAT_CNT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '좌석수',
  `TR_BOOKING` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약안내',
  `TR_MAIN_MENU` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표메뉴',
  `TR_OWNER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '영업자 이름'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='식당 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_TOURISM_THEME`
--

DROP TABLE IF EXISTS `T_TOURISM_THEME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TOURISM_THEME` (
  `TT_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `TT_TC_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공통요소 키',
  `TT_TI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이용안내 키',
  `TT_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '소구분(체험여행, 체험마을, 숲과 치유)',
  `TT_APPLY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '신청방법',
  `TT_CHE_DIVISION` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '체험구분(우주, 자연, 역사/문화, 유람선, 낚시, 걷기, 템플스테이)',
  `TT_FAX` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팩스',
  `TT_TARGET` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '체험대상',
  `TT_BAE_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '배이름',
  `TT_BAE_CAPTAIN` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선장',
  `TT_INWON` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인원',
  `TT_BAE_TON` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '톤급',
  `TT_BAE_START_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출발시간',
  `TT_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소요시간',
  `TT_BAE_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승선장소',
  `TT_BAE_END_TIME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '도착시간',
  `TT_COURCE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코스',
  `TT_WALK_DISTANCE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '왕복거리',
  `TT_START_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '출발지',
  `TT_END_PLACE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '도착지',
  `TT_WALK_NANIDO` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '난이도',
  `TT_WALK_BOLGEOLI` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코스 내 볼거리',
  `TT_TEMPLE_GUIDE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '안내자',
  `TT_TEMPLE_BOOKS_WAY` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '예약방법',
  `TT_TEMPLE_PROGRAM_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램명',
  `TT_TEMPLE_PROGRAM_CONTANT` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 일정',
  `TT_TEMPLE_EFFECT` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '학습 기대효과',
  `TT_TOWN_ORIGIN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마을유래',
  `TT_TOWN_GREETING` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인사말',
  `TT_TOWN_SPECIALTY` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마을 농특산물',
  `TT_TOWN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '체험 키 : 체험 프로그램(체험명, 소요시간, 체험시기, 체험비용, 체험내용)',
  `TT_TOWN_SALGEOLI` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '살거리',
  `TT_SUP_MANAGE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주관',
  `TT_SUP_KINDS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '종류',
  PRIMARY KEY (`TT_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='테마/코스 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_XML_HISTORY`
--

DROP TABLE IF EXISTS `T_XML_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_XML_HISTORY` (
  `XH_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '기본키',
  `XH_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '홈페이지 키',
  `XH_FS_KEYNO` int(11) DEFAULT NULL COMMENT '파일키',
  `XH_REGDT` datetime DEFAULT NULL COMMENT '등록일',
  `XH_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제유무'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='xml 히스토리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO`
--

DROP TABLE IF EXISTS `U_USERINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO` (
  `UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `UI_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이디',
  `UI_PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `UI_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `UI_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일',
  `UI_PHONE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '핸드폰',
  `UI_BIRTH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '생년월일',
  `UI_ZENDER` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별',
  `UI_DELYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제 여부',
  `UI_REGDT` datetime DEFAULT NULL COMMENT '생성일',
  `UI_MODDT` datetime DEFAULT NULL COMMENT '수정일',
  `UI_AUTH_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '인증여부',
  `UI_AUTH_DATA` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증값',
  `UI_DEL_REASON` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴사유',
  `UI_REP_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판등에 보여지는 대표 이름',
  `UI_LASTLOGIN` datetime DEFAULT NULL COMMENT '마지막 로그인 일자',
  `UI_LOGIN_COUNT` int(5) NOT NULL DEFAULT '0' COMMENT '로그인횟수',
  `UI_LOCKYN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '아이디 잠금',
  `UI_LOCKDATE` datetime DEFAULT NULL COMMENT '잠금날짜',
  `UI_PWD_INIT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '최초 로긴 여부',
  `UI_PASSWORD_CHDT` datetime DEFAULT NULL COMMENT '비밀번호 변경일',
  `UI_TRY_COUNT` int(1) NOT NULL DEFAULT '0' COMMENT '로그인 시도 횟수',
  `UI_SNS_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 아이디',
  `UI_SNS_TYPE` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS 타입',
  PRIMARY KEY (`UI_KEYNO`),
  UNIQUE KEY `UI_ID` (`UI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_AUTHORITY`
--

DROP TABLE IF EXISTS `U_USERINFO_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_AUTHORITY` (
  `UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `UIA_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 이름',
  `UIA_COMMENT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 설명',
  `UIA_SYSTEM` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '시스템권한 ',
  `UIA_MAINKEY` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인키',
  `UIA_DEPTH` int(2) DEFAULT NULL COMMENT '뎁스',
  `UIA_ORDER` int(2) DEFAULT NULL COMMENT '정렬순서',
  `UIA_DIVISION` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'G: 그룹 , A: 권한',
  PRIMARY KEY (`UIA_KEYNO`),
  UNIQUE KEY `UIA_NAME` (`UIA_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_AUTHORITY_ROLL`
--

DROP TABLE IF EXISTS `U_USERINFO_AUTHORITY_ROLL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_AUTHORITY_ROLL` (
  `UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 고유키',
  `MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 키',
  `UIR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한 - 역할 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_HOTKEY`
--

DROP TABLE IF EXISTS `U_USERINFO_HOTKEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_HOTKEY` (
  `HK_UI_KEYNO` varchar(20) NOT NULL COMMENT '유저키',
  `HK_NUMBER` int(11) NOT NULL COMMENT '키번호',
  `HK_VALUE` varchar(100) NOT NULL COMMENT '키값',
  `HK_KEYCODE` int(11) NOT NULL COMMENT '키코드'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='단축키 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_MEMBER_AUTHORITY`
--

DROP TABLE IF EXISTS `U_USERINFO_MEMBER_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_MEMBER_AUTHORITY` (
  `UI_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '멤버 고유키',
  `UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 고유키',
  KEY `UI_KEYNO` (`UI_KEYNO`),
  KEY `UIA_KEYNO` (`UIA_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 - 권한 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_RESOURCE_AUTHORITY`
--

DROP TABLE IF EXISTS `U_USERINFO_RESOURCE_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_RESOURCE_AUTHORITY` (
  `USR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '리소스 고유키',
  `UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 고유키'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리소스에 따른 접근 권한 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_ROLL`
--

DROP TABLE IF EXISTS `U_USERINFO_ROLL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_ROLL` (
  `UIR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '고유키',
  `UIR_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤 이름',
  `UIR_COMMENT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤 설명',
  `UIR_SYSTEM` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '시스템',
  `UIR_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '타입'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_SECURED_RESOURCE`
--

DROP TABLE IF EXISTS `U_USERINFO_SECURED_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_SECURED_RESOURCE` (
  `USR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '리소스 고유키',
  `USR_PATTERN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '리소스 패턴',
  `USR_ORDER` int(4) DEFAULT NULL COMMENT '순서',
  `USR_ORDER_CLASS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'top, middle, bottom',
  `USR_SYSTEM` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '시스템',
  `USR_UIR_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '역할 고유키',
  `USR_MN_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴키',
  PRIMARY KEY (`USR_KEYNO`),
  KEY `USR_UIR_KEYNO` (`USR_UIR_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='리소스 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_SETTING`
--

DROP TABLE IF EXISTS `U_USERINFO_SETTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_SETTING` (
  `US_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A:관리자 회원가입 / U : 유저홈페이지 회원가입 ',
  `US_UIA_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원가입후 부여권한',
  `US_AUTH` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원가입 인증여부 N: 없음 E : 이메일 P:핸드폰 A:관리자',
  `US_ID_FILTER` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이디,별명 금지단어',
  `US_INFO1` longtext COLLATE utf8mb4_unicode_ci COMMENT '회원가입 약관',
  `US_INFO2` longtext COLLATE utf8mb4_unicode_ci COMMENT '개인정보취급방침 약관',
  `US_APPLY` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '신청프로그램사용 여부',
  `US_REGEX` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호 정규식',
  PRIMARY KEY (`US_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원관련 셋팅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `U_USERINFO_WITHDRAW`
--

DROP TABLE IF EXISTS `U_USERINFO_WITHDRAW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_USERINFO_WITHDRAW` (
  `UW_KEYNO` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '기본키',
  `UW_REGDT` datetime DEFAULT NULL COMMENT '탈퇴 날짜',
  `UW_DEL_REASON` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴 사유',
  `UW_ZENDER` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별',
  PRIMARY KEY (`UW_KEYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 탈퇴 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WETHER_TABLE`
--

DROP TABLE IF EXISTS `WETHER_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WETHER_TABLE` (
  `WB_KEYNO` int(11) NOT NULL AUTO_INCREMENT,
  `NOWDATE` varchar(100) DEFAULT NULL,
  `RAINRATEAM` varchar(100) DEFAULT NULL,
  `TEMPERATUREAM` varchar(100) DEFAULT NULL,
  `SKYAM` varchar(100) DEFAULT NULL,
  `RAINRATEPM` varchar(100) DEFAULT NULL,
  `TEMPERATUREPM` varchar(100) DEFAULT NULL,
  `SKYPM` varchar(100) DEFAULT NULL,
  `TEMPERATUREMIN` varchar(100) DEFAULT NULL,
  `TEMPERATUREMAX` varchar(100) DEFAULT NULL,
  `CLOUDRATE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WB_KEYNO`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test3`
--

DROP TABLE IF EXISTS `test3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test3` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `AUTHORITY_VIEW`
--

/*!50001 DROP TABLE IF EXISTS `AUTHORITY_VIEW`*/;
/*!50001 DROP VIEW IF EXISTS `AUTHORITY_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`txcms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AUTHORITY_VIEW` AS select `A`.`USR_ORDER` AS `LEV`,ifnull((case `D`.`MN_PAGEDIV_C` when 'SC_QXCFB' then concat(`D`.`MN_URL`,'/**') else `D`.`MN_URL` end),`A`.`USR_PATTERN`) AS `URL`,`C`.`UIA_NAME` AS `AUTHORITY` from (((`U_USERINFO_SECURED_RESOURCE` `A` left join `U_USERINFO_RESOURCE_AUTHORITY` `B` on((`A`.`USR_KEYNO` = `B`.`USR_KEYNO`))) left join `U_USERINFO_AUTHORITY` `C` on((`B`.`UIA_KEYNO` = `C`.`UIA_KEYNO`))) left join `S_MENU_MANAGER` `D` on((`A`.`USR_MN_KEYNO` = `D`.`MN_KEYNO`))) where ((`A`.`USR_KEYNO` = `B`.`USR_KEYNO`) and (isnull(`D`.`MN_DEL_YN`) or (`D`.`MN_DEL_YN` = 'N')) and (`A`.`USR_UIR_KEYNO` = 'UIR_0000000019')) order by `A`.`USR_ORDER` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 17:36:08
