/*create procedure usp_STUDENT
as
select stu_id, stu_name, age, stu_email, cou_id
from student 
where stu_email is not null
order by stu_name;*/

--exec usp_STUDENT

/*alter procedure usp_STUDENT
as 
select stu_id, stu_name, stu_email, cou_id, sex
from student
where stu_email is not null
order by stu_name desc*/
--exec usp_STUDENT

--Drop procedure usp_STUDENT;
--exec usp_STUDENT;

/*Create Table Emp(
empno int identity PRIMARY KEY,
ename VARCHAR(20),
JOB VARCHAR(20) );*/
--select * from emp;

/*create trigger trg_insert
on Emp
after insert
as select '���Ի���� �Ի��߽��ϴ�.', * from inserted*/

--Insert into Emp values('������','ȭ��');

/*Create trigger trg_delete
on Emp
after delete
as select deleted.ENAME, '����� ����߽��ϴ�.',* from deleted*/
--delete emp where ename='������';

/*create trigger trg_update
on Emp
for update
as
select 'Deleted=>', * from deleted --old data
select 'Inserted=>',* from inserted --new data*/

--update Emp set job='������' where ename='������'

--drop trigger trg_update
--update emp set job='����' where ename='������'