/*select phone
from customer
where name='�迬��';*/

/*select bookname, price
from book;*/

/*select price, bookname
from book;*/

/*select * 
from book;*/

/*select DISTINCT publisher 
from book;*/

/*select *
from book
where price<20000;*/

/*select *
from book
where price>=10000 and price<=20000;*/

/*select *
from book
where price between 10000 and 20000;*/

/*select *
from book
where publisher In('�½�����', '���ѹ̵��');


select * 
from book
where publisher='�½�����' or publisher='���ѹ̵��';*/

/*select *
from book
where publisher not in('�½�����','���ѹ̵��');*/

/*select bookname,publisher
from book
where bookname like '�౸�� ����';*/

/*select bookname, publisher
from book
where bookname like '%�౸%';*/

/*select *
from book
where bookname like '_��%';*/

/*select *
from book
where bookname like '%�౸%' and price >= 20000;*/

/*select *
from book
where publisher='�½�����' or publisher='���ѹ̵��';*/

/*select *
from book
order by bookname;*/

/*select *
from book
order by price, bookname;*/

/*select *
from book
order by price desc, bookname asc;*/

/*select SUM(saleprice)
from orders;*/

/*select SUM(saleprice) as �Ѹ���
from orders
where custid=2;*/

/*select sum(saleprice) as Total, avg(saleprice) as Average, 
max(saleprice) as Maximum, min(saleprice) as Minimum
from Orders;*/

/*select count(*)
from Orders;*/

/*select custid, COUnt(*) as ��������, SUM(saleprice) as �Ѿ�
from Orders
Group by custid;*/

/*select custid, COUNT(*) as ��������
from Orders
where saleprice>=8000
group by custid
having count(*)>=2;*/

--��������Ǯ��1�� (�� 4����)
/*Select bookname
from book
where bookid=1;*/

/*select bookname
from book
where price>=20000;
select bookname, price
from book
where price>=20000;*/

/*select sum(saleprice)
from Orders
where custid=1;
select custid, sum(saleprice)
from Orders
where custid=1
group by custid;*/

--������ ����Ͽ�
/*select SUM(saleprice) as �������ѱ��ž�
from Customer,Orders
where Customer.custid=Orders.custid and Customer.name='������';*/

/*select count(*)
from orders
where custid=1;*/

/*select count(*) as �Ѱ���
from book;*/

/*select count(publisher) as ���ǻ��Ѱ���
from book;*/

/*select name, address
from customer;*/

/*select orderid
from Orders
where orderdate between '2013-7-4' and '2013-7-7';*/

/*select orderid
from Orders
where orderdate not In('2013-7-4','2013-7-5','2013-7-6','2013-7-7');*/
select orderid
from Orders
where orderdate not between '20130704' and '2013-7-7';

--INSERT INTO Customer VALUES (6, '��ΰ�', '���ѹα� ����', NULL);

/*select name, address
from Customer
where name like '��%';*/

/*select name, address
from Customer
where name like '��%��';*/