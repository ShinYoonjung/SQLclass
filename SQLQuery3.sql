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
as select '신입사원이 입사했습니다.', * from inserted*/

--Insert into Emp values('전원지','화가');

/*Create trigger trg_delete
on Emp
after delete
as select deleted.ENAME, '사원이 퇴사했습니다.',* from deleted*/
--delete emp where ename='전원지';

/*create trigger trg_update
on Emp
for update
as
select 'Deleted=>', * from deleted --old data
select 'Inserted=>',* from inserted --new data*/

--update Emp set job='선생님' where ename='전원지'

--drop trigger trg_update
--update emp set job='교수' where ename='전원지'