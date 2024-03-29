-- 실습에 필요한 Madang DB 와 COMPANY DB를 모두 생성합니다.
-- 데이터베이스 생성
USE [master]
-- 마당 데이터베이스 생성
IF EXISTS(SELECT name FROM sys.databases WHERE (name = 'Madang') OR (name = 'madang'))
     DROP DATABASE [Madang];
CREATE DATABASE Madang
GO

USE [master]
-- COMPANY 데이터베이스 생성
IF EXISTS(SELECT name FROM sys.databases WHERE (name = 'COMPANY') OR (name = 'Company'))
     DROP DATABASE [COMPANY];
CREATE DATABASE COMPANY
GO

-- GO 명령어는 T-SQL 문은 아니지만 현재까지 명령어를 SQL Server에 보내서 실행시키는 역할을 한다. 
-- 즉 GO 명령어는 명령어를 묶어서 배치로 서버에 보내는 역할을 한다. 

-- Book, Customer, Orders 테이블 생성  //마당데이터베이스 안에 테이블 생성
USE [Madang]
CREATE TABLE Book (
  bookid      INT PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);

CREATE TABLE  Customer (
  custid      INT PRIMARY KEY NONCLUSTERED,  
  name        VARCHAR(40),
  address     VARCHAR(40),
  phone       VARCHAR(30)
);

CREATE TABLE Orders (
  orderid	INT  PRIMARY KEY,
  custid	INT  REFERENCES Customer(custid),
  bookid	INT  REFERENCES Book(bookid),
  saleprice INT,
  orderdate DATE
);


-- Book, Customer, Orders 데이터 생성
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전', NULL);

-- 주문(Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO Orders VALUES (1, 1, 1, 6000, '2013-07-01'); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, '2013-07-03');
INSERT INTO Orders VALUES (3, 2, 5, 8000, '2013-07-03'); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, '2013-07-04'); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, '2013-07-05');
INSERT INTO Orders VALUES (6, 1, 2, 12000, '2013-07-07');
INSERT INTO Orders VALUES (7, 4, 8, 13000, '2013-07-07');
INSERT INTO Orders VALUES (8, 3, 10, 12000, '2013-07-08'); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, '2013-07-09'); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, '2013-07-10');
GO

-- 여기는 3장에서 사용되는 Imported_book 테이블  //Imported_book테이블 하나 추가로 더 생성
CREATE TABLE Imported_Book (
  bookid      INT,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- 여기서부터는 사용자 아이디 생성 부분임
-- SQL Server에서는 master 사용자 외에 사용자를 만드려면 로그인과 사용자 아이디를 만들어야 함
USE [master]
GO
-- 로긴(login) 아이디 mduser 생성  //sa말고 mduser를 하나 만들거임
IF EXISTS(SELECT * FROM sys.syslogins WHERE name = N'mduser')
     DROP LOGIN [mduser]
CREATE LOGIN mduser WITH PASSWORD='mdpass', default_database=Madang
-- 사용자 아이디 mduser 생성
GO


-- mduser 의 Madang 데이터베이스 user 및 권한 부여
USE [Madang]
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mduser') 
	DROP USER [mduser]; 	
CREATE USER mduser FOR login mduser WITH default_schema=dbo 
--dbo는 모든 권한을 부여한 거
EXEC sp_addrolemember db_owner, mduser
GO



-- mduser의 COMPANY 데이터베이스 user 및 권한 부여
USE [COMPANY]
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mduser') 
	DROP USER [mduser]; 	
CREATE USER mduser FOR login mduser WITH default_schema=dbo  
--mduser에게 권한을 줌
EXEC sp_addrolemember db_owner, mduser
GO

-- 연습문제 사원 데이터베이스 생성 SQL 명령어 
CREATE TABLE Dept (
  deptno 	INT CONSTRAINT PK_DEPT PRIMARY KEY,
  dname 	VARCHAR(14), 
  loc   	VARCHAR(13) 
  );

CREATE TABLE Emp (
  empno 	INT CONSTRAINT PK_EMP PRIMARY KEY,
  ename 	VARCHAR(10),
  job   	VARCHAR(9),
  MGR   	SMALLINT,
  hiredate	DATE,
  sal   	DECIMAL(7,2),
  comm  	DECIMAL(7,2),
  deptno    INT CONSTRAINT FK_deptno REFERENCES Dept
  );

--  Dept 데이터 4개 삽입
INSERT INTO Dept VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO Dept VALUES(20,'RESEARCH','DALLAS');
INSERT INTO Dept VALUES(30,'SALES','CHICAGO');
INSERT INTO Dept VALUES(40,'OPERATIONS','BOSTON');

--  Emp 데이터 14개 삽입
INSERT INTO Emp  VALUES(7369,'SMITH','CLERK',    7902,'12-17-1980',800,NULL,20);
INSERT INTO Emp  VALUES(7499,'ALLEN','SALESMAN', 7698,'02-20-1981',1600,300, 30);
INSERT INTO Emp  VALUES(7521,'WARD','SALESMAN',  7698,'02-22-1981',1250,500, 30);
INSERT INTO Emp  VALUES(7566,'JONES','MANAGER',  7839,'04-02-1981',2975,NULL,20);
INSERT INTO Emp  VALUES(7654,'MARTIN','SALESMAN',7698,'09-28-1981',1250,1400,30);
INSERT INTO Emp  VALUES(7698,'BLAKE','MANAGER',  7839,'05-01-1981',2850,NULL,30);
INSERT INTO Emp  VALUES(7782,'CLARK','MANAGER',  7839,'06-09-1981',2450,NULL,10);
INSERT INTO Emp  VALUES(7788,'SCOTT','ANALYST',  7566,'07-13-1987',3000,NULL,20);
INSERT INTO Emp  VALUES(7839,'KING','PRESIDENT', NULL,'11-17-1981',5000,NULL,10);
INSERT INTO Emp  VALUES(7844,'TURNER','SALESMAN',7698,'09-08-1981',1500,0,   30);
INSERT INTO Emp  VALUES(7876,'ADAMS','CLERK',    7788,'07-13-1987',1100,NULL,20);
INSERT INTO Emp  VALUES(7900,'JAMES','CLERK',    7698,'12-03-1981',950,NULL,30);
INSERT INTO Emp  VALUES(7902,'FORD','ANALYST',   7566,'12-03-1981',3000,NULL,20);
INSERT INTO Emp  VALUES(7934,'MILLER','CLERK',   7782,'01-23-1982',1300,NULL,10);
GO

use [Madang]