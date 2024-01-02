use master;

create table B_pay (
	seq int identity(1,1) primary key,
	subject nvarchar(50) not null,
	date date default(getdate()) not null,
	price int not null
)

insert into B_pay values('스마트홈 MMB 키트','2022-04-11',275000)
insert into B_pay values('DHT-10','2022-04-11',22500)
insert into B_pay values('DHT-22','2022-06-02',6000)
insert into B_pay values('WIFI 모듈','2022-06-03',12000)
insert into B_pay values('케이블','2022-06-03',2000)

select * from B_pay;
--drop table B_pay;


create table B_function (
	seq int identity(1,1) primary key,
	fName nvarchar(30) not null,
	photo nvarchar(50) not null,
	fContent nvarchar(max) not null
)
insert into B_function values('공기질기능','MQ135.png','해당 사진은 실내의 공기질을 측정하는 용도로 사용하는 센서이다. <br/>마시는 공기의 질은 건강에 큰 영향을 끼치는데, 공기 중의 초미세먼지는 비염, 천식, 폐렴 등의 원인이 될 수 있다. 또한, 실내 이산화탄소 농도가 높아지면 몸이 쉽게 피곤해지거나 어지럼증을 유발할 가능성도 있다. 해당 센서를 이용하여 실내의 공기를 측정하고 이를 통해 현재 공기질에 따라 다른 IoT 기기를 자동 제어할 수 있다.');
insert into B_function values('문개폐기능','DOOR.png','해당 사진은 문을 제어하는 모터이다. <br/>스마트 도어락이라는 기능은 해당 모터를 작동시킴으로써 문을 열고 닫고가 가능하다. 또한 이를 수동이 아닌 원격제어를 할 수 있다. 어플을 통해 문을 원격으로 개방하고 폐쇄할 수 있는 기능인 것이다. ')
insert into B_function values('시각화기능','LCD.jpg','해당 사진은 정보를 나타내는 LCD이다. <br/>공기질 또는 온습도 센서 등을 이용하여 실내의 데이터를 실시간으로 참조하여 LCD를 통해 시각화하여 볼 수 있다. 최적의 실내 환경이 무엇인지를 알 수 있으며, 어플을 통해 본인이 원하는 정보만 볼 수 있도록 정렬 및 선택할 수 있다.')
insert into B_function values('온습도기능','DHT10.jpeg','해당 사진은 실내의 온도, 습도를 측정하는 DHT10 라는 센서이다, <br/> 실시간으로 데이터를 참조 할 수가 있다. 실내 온도나 습도가 지나치게 높거나 낮아도 건강을 해치거나 학습 효율을 떨어뜨리기도 한다. 이러한 문제를 해결하기 위해 센서로 값을 측정한 후 데이터를 분석해 온습도에 영향을 주도록 한다. 해당 센서를 통해 데이터를 분석한 후 창문 개폐 혹은 환풍 작동 등을 제어한다.');
insert into B_function values('조도기능','Photo Resistor.jpeg','해당 사진은 주변의 밝기를 측정하는 조도 센서이다.<br/> 센서를 통해 밝기를 읽어들인 후 LED를 통해 조명을 조절할 수 있습니다.')
insert into B_function values('환풍기능','PAN.png','최적의 실내 환경 조성 및 결로 방지를 위해 온습도를 조절하려면 실내 공기와 외부의 공기순환을 돕는다')
insert into B_function values('환기기능','PAN2.jpg','최적의 실내 환경 조성 및 결로 방지를 위해 온습도를 조절하려 외부 공기의 유입 및 실내 공기 배출을 조절한다')

select * from B_function;
--drop table B_function;


create table B_user (
	id nvarchar(30) primary key,
	name nvarchar(30) not null,
	passwd nvarchar(20) not null,
	univ nvarchar(30) not null,
	major nvarchar(30) not null,
	part nvarchar(20) not null,
	task nvarchar(max) not null,
	photo nvarchar(max) not null
)

insert into B_user values ('jk', '김재경', '1234', '배화여자대학교', '스마트IT과', '팀원', '문서 작업 / 아두이노 알고리즘 설계 / H/W 개발 / 모바일 앱 구현','AB.jpg');
insert into B_user values ('gh', '임규희', '1234', '배화여자대학교', '스마트IT과', '팀장', '문서 작업 / Spring Boot를 통한 데이터 분석 알고리즘 개발 / AWS 업로드','AP.jpg');
insert into B_user values ('cy', '임채영', '1234', '배화여자대학교', '스마트IT과', '팀원', '문서 작업 / Spring Boot를 통한 데이터 분석 알고리즘 개발 / AWS 업로드','OR.jpg');
insert into B_user values ('jy', '최준영', '1234', '배화여자대학교', '스마트IT과', '팀원', '문서 작업 / 아두이노 알고리즘 설계 / H/W 개발 / 모바일 앱 구현','JY.jpg');
select * from B_user;
--drop table B_user;

create Table Visitor (
	seq int IDENTITY(1,1) primary key,   
	name nvarchar(30) not null, 
	content nvarchar(max) not null, 
	vDate datetime default(getDate( )) 
)

insert into Visitor values ('유재석','프로젝트 잘 보고 갑니다~','2022-04-25 19:00'); -- 테스트 데이터
insert into Visitor values ('마동석','응원해요!','2022-05-05 15:00');
insert into Visitor values ('지석진','프로젝트 성공 기원합니다~','2022-05-25 18:00');
insert into Visitor values ('유기현','오 너무 좋네요!<br/>좋은 아이디어 얻고 갑니다.','2022-06-01 21:00');
insert into Visitor values ('손예진','우와~<br/>응원할게요~','2022-06-02 12:00');
select * from Visitor;
--drop table Visitor;

create Table B_schedule (
	seq int IDENTITY(1,1) primary key,   
	id nvarchar(30) not null,
	tDate date not null, 
	content nvarchar(max) not null, 
)

insert into B_schedule values ('gh','2022-05-30','H/W 조립');  -- 테스트 데이터
insert into B_schedule values ('gh','2022-06-09','중간 발표회');
insert into B_schedule values ('cy','2022-06-14','실습장비 구매');
insert into B_schedule values ('cy','2022-06-24','회로도 구현');
insert into B_schedule values ('jk','2022-06-27','프로젝트 미팅');
insert into B_schedule values ('jk','2022-06-30','중간보고서 작성');
insert into B_schedule values ('jy','2022-07-04','알고리즘 구현');
insert into B_schedule values ('jy','2022-07-07','아두이노 코딩');
select * from B_schedule;
--drop table B_schedule;

create Table B_log (
	seq int IDENTITY(1,1) primary key,   
	id nvarchar(30) not null,
	name nvarchar(30) not null, 
	content nvarchar(max) not null, 
	lDate datetime default(getDate( )) 
)
insert into B_log values ('gh','임규희','수행계획서 작성','2022-03-15 10:38:46.730');
insert into B_log values ('gh','임규희','H/W 조립','2022-04-15 13:00:40.067');
insert into B_log values ('jk','김재경','회의록 작성','2022-04-30 02:22:11.990');
insert into B_log values ('jk','김재경','스마트홈 조립','2022-05-15 13:00:40. 067');
insert into B_log values ('jk','김재경','수행계획서 수정','2022-05-21 02:23:18.390');
insert into B_log values ('jy','최준영','프로젝트 수정','2022-05-30 02:23:54.117');
insert into B_log values ('jy','최준영','실습장비 구매','2022-06-01 13:00:40. 067');
insert into B_log values ('cy','임채영','알고리즘 구현','2022-06-02 02:23:54.117');
insert into B_log values ('cy','임채영','수행계획서 수정','2022-06-03 18:50:16.093');
insert into B_log values ('cy','임채영','아두이노 코딩','2022-06-03 20:40:16.293');
select * from B_log;
--drop table B_log;

create table B_docu (
	seq int identity(1,1) primary key, -- 일련번호
	divide nvarchar(20) not null, -- 구분
	title nvarchar(50) not null, -- 제목
	content nvarchar(max) not null, -- 내용
	name nvarchar(30) not null, -- 작성자
	date datetime, -- 날짜(수정)
	hit int default(0), -- 조회수
	fName nvarchar(max),
	fSize int default(0) -- 파일 사이즈
)
insert into B_docu values('수행계획서','중간 수행계획서','졸업작품 중간 수행계획서 올립니다.','임규희','2022-06-03 12:32:23.227',0,'졸업작품 중간보고서.hwp',188928); -- 테스트 데이터
select * from B_docu;
-- drop table B_docu;