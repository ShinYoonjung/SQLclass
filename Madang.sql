-- �ǽ��� �ʿ��� Madang DB �� COMPANY DB�� ��� �����մϴ�.
-- �����ͺ��̽� ����
USE [master]
-- ���� �����ͺ��̽� ����
IF EXISTS(SELECT name FROM sys.databases WHERE (name = 'Madang') OR (name = 'madang'))
     DROP DATABASE [Madang];
CREATE DATABASE Madang
GO

USE [master]
-- COMPANY �����ͺ��̽� ����
IF EXISTS(SELECT name FROM sys.databases WHERE (name = 'COMPANY') OR (name = 'Company'))
     DROP DATABASE [COMPANY];
CREATE DATABASE COMPANY
GO

-- GO ��ɾ�� T-SQL ���� �ƴ����� ������� ��ɾ SQL Server�� ������ �����Ű�� ������ �Ѵ�. 
-- �� GO ��ɾ�� ��ɾ ��� ��ġ�� ������ ������ ������ �Ѵ�. 

-- Book, Customer, Orders ���̺� ����  //���絥���ͺ��̽� �ȿ� ���̺� ����
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


-- Book, Customer, Orders ������ ����
INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸ �ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰 ���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����', NULL);

-- �ֹ�(Orders) ���̺��� å���� ���� �ǸŸ� ������
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

-- ����� 3�忡�� ���Ǵ� Imported_book ���̺�  //Imported_book���̺� �ϳ� �߰��� �� ����
CREATE TABLE Imported_Book (
  bookid      INT,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- ���⼭���ʹ� ����� ���̵� ���� �κ���
-- SQL Server������ master ����� �ܿ� ����ڸ� ������� �α��ΰ� ����� ���̵� ������ ��
USE [master]
GO
-- �α�(login) ���̵� mduser ����  //sa���� mduser�� �ϳ� �������
IF EXISTS(SELECT * FROM sys.syslogins WHERE name = N'mduser')
     DROP LOGIN [mduser]
CREATE LOGIN mduser WITH PASSWORD='mdpass', default_database=Madang
-- ����� ���̵� mduser ����
GO


-- mduser �� Madang �����ͺ��̽� user �� ���� �ο�
USE [Madang]
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mduser') 
	DROP USER [mduser]; 	
CREATE USER mduser FOR login mduser WITH default_schema=dbo 
--dbo�� ��� ������ �ο��� ��
EXEC sp_addrolemember db_owner, mduser
GO



-- mduser�� COMPANY �����ͺ��̽� user �� ���� �ο�
USE [COMPANY]
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mduser') 
	DROP USER [mduser]; 	
CREATE USER mduser FOR login mduser WITH default_schema=dbo  
--mduser���� ������ ��
EXEC sp_addrolemember db_owner, mduser
GO

-- �������� ��� �����ͺ��̽� ���� SQL ��ɾ� 
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

--  Dept ������ 4�� ����
INSERT INTO Dept VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO Dept VALUES(20,'RESEARCH','DALLAS');
INSERT INTO Dept VALUES(30,'SALES','CHICAGO');
INSERT INTO Dept VALUES(40,'OPERATIONS','BOSTON');

--  Emp ������ 14�� ����
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