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
	
	
	--���� ���̺� ������ �Է�
	insert into course values(10,'�����','������');
	insert into course values(20,'�ڹ�','������');
	insert into course values(30,'������','Ȳ����');
	insert into course values(40,'��ǥ��','������');*/

/*	select * from course;

	create table member(
		id varchar(20) constraint PK_id primary key,
		pwd varchar(20) constraint NN_pwd not null,
		name varchar(20) constraint NN_name not null,
		email varchar(20) null,
		hp varchar(20) null
	);*/

	--insert into member values(Null,'Y','������','moon@nate.com','1063385361')
	--insert into member values('','S','������','moon@nate.com','1063385361')
	
	--drop table member;
	--drop table student;
	--drop table course;
	

	/*Insert into student values(101,'������',24,'moom@naver.com',10,'M');
	Insert into student values(102,'���Ѽ�',22,'five2naver.com',20,'M');
	Insert into student values(103,'���뼮',22,'again@naver.com',20,'M');
	Insert into student values(104,'����ö',22,'cook@naver.com',20,'M');
	Insert into student values(105,'��ȫ��',24,'red@naver.com',10,'M');
	Insert into student values(106,'������',21,'kim@naver.com',20,'M');
	Insert into student values(107,'�ڽ���',22,'season@naver.com',20,'M');
	Insert into student values(108,'������',27,'brother@naver.com',10,'M');
	Insert into student values(109,'������',22,'sun@naver.com',20,'F');
	Insert into student values(110,'�ڱ⼮',34,'flag@naver.com',10,'M');
	Insert into student values(111,'��ȿ��',24,'good@naver.com',30,'F');
	Insert into student values(112,'��â��',34,'window@naver.com',30,'M');
	Insert into student values(113,'������',28,'empty@naver.com',10,'M');
	Insert into student values(114,'�̺���',29,'bbong@naver.com',10,'M');
	Insert into student values(115,'��â��',24,'change@naver.com',30,'M');
	Insert into student values(116,'����',34,'shine@naver.com',10,'M');*/

	--�������Ἲ��������(50�� cou_id�� ����X)
	--Insert into student values(116,'����',34,'shine@naver.com',50,'M');
    --select * from student where age>=21 and age<=29;
	--select * from student where cou_id=10;
	--select * from student where stu_name='������';

	