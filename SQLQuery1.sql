/*create database EduManager;*/


/* create table course(
	cou_id int not null,
	cou_name varchar(20) null,
	tea_name varchar(20) null,
	primary key(cou_id)
	);
	Go*/

	/*create table student(
	stu_id integer not null,
	stu_name varchar(20) null,
	age integer null,
	stu_email varchar(20) null,
	cou_id integer null,
	primary key(stu_id),
	foreign key(cou_id) references course(cou_id)
	);
	Go

	alter table student
	add sex varchar default 'M';*/

	
	/*drop table student;
	drop table course;
	drop table member;*/
	
	
	--과정 테이블 데이터 입력
	insert into course values(10,'모바일','성윤정');
	insert into course values(20,'자바','김혜경');
	insert into course values(30,'윈도우','황연주');
	insert into course values(40,'웹표준','전혜영');*/

/*	select * from course;

	create table member(
		id varchar(20) constraint PK_id primary key,
		pwd varchar(20) constraint NN_pwd not null,
		name varchar(20) constraint NN_name not null,
		email varchar(20) null,
		hp varchar(20) null
	);*/

	--insert into member values(Null,'Y','문종현','moon@nate.com','1063385361')
	--insert into member values('','S','문재인','moon@nate.com','1063385361')
	
	--drop table member;
	--drop table student;
	--drop table course;
	

	/*Insert into student values(101,'문종현',24,'moom@naver.com',10,'M');
	Insert into student values(102,'오한솔',22,'five2naver.com',20,'M');
	Insert into student values(103,'제용석',22,'again@naver.com',20,'M');
	Insert into student values(104,'정국철',22,'cook@naver.com',20,'M');
	Insert into student values(105,'박홍진',24,'red@naver.com',10,'M');
	Insert into student values(106,'김현우',21,'kim@naver.com',20,'M');
	Insert into student values(107,'박시준',22,'season@naver.com',20,'M');
	Insert into student values(108,'김준형',27,'brother@naver.com',10,'M');
	Insert into student values(109,'문혜진',22,'sun@naver.com',20,'F');
	Insert into student values(110,'박기석',34,'flag@naver.com',10,'M');
	Insert into student values(111,'윤효선',24,'good@naver.com',30,'F');
	Insert into student values(112,'안창범',34,'window@naver.com',30,'M');
	Insert into student values(113,'공지훈',28,'empty@naver.com',10,'M');
	Insert into student values(114,'이봉림',29,'bbong@naver.com',10,'M');
	Insert into student values(115,'안창범',24,'change@naver.com',30,'M');
	Insert into student values(116,'장희성',34,'shine@naver.com',10,'M');*/

	--참조무결성제약조건(50은 cou_id에 포함X)
	--Insert into student values(116,'장희성',34,'shine@naver.com',50,'M');
    --select * from student where age>=21 and age<=29;
	--select * from student where cou_id=10;
	--select * from student where stu_name='김준형';

	