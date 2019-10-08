/*select phone
from customer
where name='김연아';*/

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
where publisher In('굿스포츠', '대한미디어');


select * 
from book
where publisher='굿스포츠' or publisher='대한미디어';*/

/*select *
from book
where publisher not in('굿스포츠','대한미디어');*/

/*select bookname,publisher
from book
where bookname like '축구의 역사';*/

/*select bookname, publisher
from book
where bookname like '%축구%';*/

/*select *
from book
where bookname like '_구%';*/

/*select *
from book
where bookname like '%축구%' and price >= 20000;*/

/*select *
from book
where publisher='굿스포츠' or publisher='대한미디어';*/

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

/*select SUM(saleprice) as 총매출
from orders
where custid=2;*/

/*select sum(saleprice) as Total, avg(saleprice) as Average, 
max(saleprice) as Maximum, min(saleprice) as Minimum
from Orders;*/

/*select count(*)
from Orders;*/

/*select custid, COUnt(*) as 도서수량, SUM(saleprice) as 총액
from Orders
Group by custid;*/

/*select custid, COUNT(*) as 도서수량
from Orders
where saleprice>=8000
group by custid
having count(*)>=2;*/

--연습문제풀이1번 (총 4문제)
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

--조인을 사용하여
/*select SUM(saleprice) as 박지성총구매액
from Customer,Orders
where Customer.custid=Orders.custid and Customer.name='박지성';*/

/*select count(*)
from orders
where custid=1;*/

/*select count(*) as 총개수
from book;*/

/*select count(publisher) as 출판사총개수
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

--INSERT INTO Customer VALUES (6, '김부각', '대한민국 전라도', NULL);

/*select name, address
from Customer
where name like '김%';*/

/*select name, address
from Customer
where name like '김%아';*/