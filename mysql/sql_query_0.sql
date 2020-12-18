use shopdb;

-- 한줄 주석
# 한줄 주석

/*
여러줄 주석
여러줄 주석*/

# select 칼럼명 form 테이블명;
# select 칼럼1, 칼럼2 from 테이블명;
# select 칼럼 2 from 테이블명 where 조건;
# select * from 테이블명;
# show tables ; - 테이블 목록을 확인
# show databases; - 데이터베이스 목록을 확인

# shopdb에서 product_table 모든 칼럼을  가져와라.
show tables;

select * from product_table;
select * from user_table;

# ctrl + shift + enter - 전체실행 or 블록실행
# ctrl + enter - 지정한 쿼리만 실행

# user_table에서 이름과 주소만 출력 
select membername,memberaddress from user_table;

select product_name, company from product_table;

# 제조회사가 삼성인 제품만 출력
select * from product_table where company = '삼성';

# 제고수가 3개 미만인 제품이름만 출력
select product_name from product_table where amount < 10;

# 인천시 남구에 거주하는 사람의 데이터 출력
select * from user_table where memberaddress = '인천시 남구';

# 세탁기의 가격을 출력하시오
select cost from product_table where product_name = '세탁기';

select * from user_table ;
select * from product_table ;

# 제고 총액이 100이상인 데이터만 출력
select * from product_table where cost*amount > 100;

# employee 데이터베이스에서 테이블의 종류를 출력
use employees;

show tables ;

# 종업원의 데이터를 모두 출력
select * from employees;

# 종업원 중 남성의 이름 데이터 출력
select last_name from employees where gender = 'M';

# 출생연도가 60년대 이전에 출생한 남성 직원의 사번을 출력alter
select emp_no, birth_date from employees where gender = 'M' and birth_date > 1960;

# salaries의 모든 데이터를 출력하시오
select * from salaries;

# 연봉 1억 이상인 사람의 emp_no를 출력
select emp_no, salary from salaries where salary > 100000;

# 연봉 1억 이상인 사람의 수를 출력
select count(emp_no) from salaries where salary > 100000;

# departments table의 데이터를 출력
select * from departments ;

# title table 데이터를 출력
select * from titles ;

# 입사년도가 1960년 07월 07일 이전에 입사한 'Engineer'의 데이터를 모두 출력
select * from titles where from_date < '1990-07-07' and title = 'Engineer'; 

# Table 생성 및 값입력
-- 1. 데이터베이스 생성
-- 2. 테이블 생성
-- 3. 테이블 값 입력

drop database if exists sqldb;
create database sqldb;

use sqldb;

# table 생성
# => create table 테이블명 ( 칼럼, 데이터타입, 제약조건)
# userid 등  col 생성
create table usertbl (
	userid char(8) not null primary key,user_table
    name varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date
);

# 값을 입력
# => insert into 테이블명 values(값1, 값2, 값3....)

insert into usertbl values('LSG','이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
insert into usertbl values('KBS','김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH','김경호', 1971, '전남', '011', '3333333', 177, '2008-7-7');

# usertbl의 모든 데이터를 출력
select * from usertbl;

use sakila;
show tables;
select * from actor;
# actor_id가 100인 데이터의 last_name만 출력
select last_name from actor where actor_id = 100;

show databases;

use shopdb;
show tables;
select * from user_table;


use usertbl;
insert into usertbl values('JYP','조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK','성시경', 1979, '서울', NULL, NULL, 187, '2013-12-12');
insert into usertbl values('LJB','임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS','윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
insert into usertbl values('EJW','은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW','조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK','바바킴', 1973, '서울', '010', '0000000', 176, '2013-7-7');

select * from usertbl;

# sqldb 생성 query

DROP DATABASE IF EXISTS sqlDB; -- 만약 sqlDB가 존재하면 우선 삭제한다.
CREATE DATABASE sqlDB;

USE sqlDB;
CREATE TABLE userTbl -- 회원 테이블
( userID   CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name     VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr    CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height     SMALLINT,  -- 키
  mDate     DATE  -- 회원 가입일
);
CREATE TABLE buyTbl -- 회원 구매 테이블
(  num  INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID   CHAR(8) NOT NULL, -- 아이디(FK)
   prodName  CHAR(6) NOT NULL, --  물품명
   groupName  CHAR(4)  , -- 분류
   price      INT  NOT NULL, -- 단가
   amount     SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM userTbl;
SELECT * FROM buyTbl;

# sqldb로 sql query 활용

-- 김경호라는 가수의 데이터를 출력
select * from usertbl where name = '김경호';

-- 출생년도가 1970년 이후, 키가 182 이상인 회원 출력
select * from usertbl where birthYear > 1970 and height >= 182 ;

-- 출생년도가 1970년 이후, 키가 182 이상인 회원의 userid 출력
select userID from usertbl where birthYear > 1970 and height >= 182 ;

-- 출생년도가 1970년 이후이거나, 키가 182 이상인 회원을 출력
select * from usertbl where birthYear > 1970 or height >= 182 ;

-- 키가 180 이상이고 183 이하인 회원 이름을 출력
select name from usertbl where height >= 180 and height <= 183 ;
select name from usertbl where height between 180 and 183;

-- 출생지가 '경남' 또는 '전남' 또는 '경북'인 회원의 이름과 주소를 출력
select name, addr from usertbl where addr = '경남' or addr = '전남' or addr = '경북';
select name, addr from usertbl where addr in('경남','전남','경북');

# 텍스트 검색 키워드 : like
-- 성이 '김'인 사람의 데이터를 출력
select * from usertbl where name like '김%';
-- 이름이  '종신'인 사람의 데이터를 출력
select * from usertbl where name like '_종신';

-- 키가 177이상인 고객데이터만 추출
select * from usertbl where height >= 177;

# subquery : 하나의 sql query 안에 또다른 sql query가 포함된 경우
-- '김경호'보다 키가 큰 사람대이터 출력
select * from usertbl where height > (select height from usertbl where name = '김경호');

-- '임재범'보다 나이가 많은 사람의 데이터를 출력
select * from usertbl where birthYear < (select birthYear from usertbl where name = '임재범');

-- '김범수'와 출생지역이 동일한 사람의 데이터를 출력
select * from usertbl where addr = (select addr from usertbl where name = '김범수');
select * from usertbl where addr in (select addr from usertbl where name = '김범수');

-- '경남'에 사는 사람보다 키가 큰 사람들의 데이터를 출력
# 생각한 답안
select * from usertbl where height > (select max(height) from usertbl where addr = '경남');
select * from usertbl where height > (select min(height) from usertbl where addr = '경남');
# any : 어느하나보다 큼 (min값보다) , all : 어느 값보다 큼(max)
select * from usertbl where height > any(select height from usertbl where addr = '경남');
select * from usertbl where height > all(select height from usertbl where addr = '경남');

-- '경남'사람의 키와 동일한 키인 사람들의 데이터를 출력
select * from usertbl where height in (select height from usertbl where addr = '경남');

# 정렬 : order by  => python에서 sort, sort_values와 동일(오름차순)

-- 출생 기준으로 오름차순 정렬해서 출력
select * from usertbl order by birthYear;
select * from usertbl order by birthYear desc;

-- 키가 큰 순서대로 출력, 키가 작은 순서대로 출력
select * from usertbl order by height desc;
select * from usertbl order by height;

-- 주소출력
select addr from usertbl ;

# distinct : 중복값 없이 출력
-- 중복없이 주소출력
select distinct addr from usertbl ;

# count : 원소수 출력
-- 주소값 갯수 출력(중복없앰)
select count(distinct addr) from usertbl;

# limit 00 : 출력 갯수를 00개로 제한
select * from usertbl limit 3;

# table 생성 : create table 테이블명 ( col명, datatype, constraints(제약조건));
# 기존 table 복사 : subquery 활용

use sqldb;
create table buytbl2 (select * from buytbl);

select * from buytbl2;

create table buytbl3 (select userid, prodName from buytbl);
select * from buytbl3;

# group by : 데이터가 묶여서 그룹생성(pyhton과 동일)
# 그룹별 출력 값 -> 집계함수를 활용 지정가능

-- buytbl를 userID기준으로 groupby
select userid from buytbl group by userid;
-- + amount의 합을 출력
select userid, sum(amount) from buytbl group by userid;

-- userid별로 총구매금액 출력
select userid, sum(amount*price) from buytbl group by userid;
# as '' : col명을 변경 (as 생략가능)
select userid, sum(amount*price) as '총구매금액'  from buytbl group by userid;

-- user별 총 구매금액 상위 2명의 userid 출력
select userid, sum(amount*price) as '총구매금액'  from buytbl group by userid order by 총구매금액 desc limit 2;

-- user별 평균구매 금액 출력
select userid, avg(amount*price)'평균구매금액' from buytbl group by userid;

-- user별 구매 횟수 
select userid, count(amount)'구매횟수' from buytbl group by userid;

-- usertbl에서 키가 가장 큰 사람과 가장 작은 사람의 이름과 키를 출력
select name, max(height) from usertbl;
select name, min(height) from usertbl;

select name, height from usertbl where height in ((select max(height) from usertbl),(select min(height) from usertbl));

-- 사용자별 총구매금액이 1000이상인 고객의 데이터를 출력
# group by에서 조건은 having을 사용 (where 사용불가)
select useriD, sum(amount*price) '총구매금액' from buytbl group by userID having 총구매금액 > 1000;

-- userid별 총구매 횟수가 2회 이상인 userid출력
select userid, count(amount) '구매횟수' from buytbl group by userid having 구매횟수 >= 2;

show databases;
use sqldb;

show tables;

# create table 테이블명(칼럼명, 데이터타입, 제약조건)
# 제약조건 : not null, primary key, unique, default, auto_increment...
# auto_increment : 값을 입력하지 않고 null로 입력하면 자동으로 순서값으로 입력해줌
create table testtbl2(
	id int auto_increment primary key,
    username char(7),
    age int
);

show tables;

# table에 값 넣기 : insert into 테이블명 values(값1, 값2, ..(col수에 맞게))

insert into testtbl2 values (null, '지민', 25);
insert into testtbl2 values (null, '유나', 27);
insert into testtbl2 values (null, '유경', 35);

select * from testtbl2;


create table testtbl4(
	id int,
    fname varchar(50),
    lname varchar(50)
);

# 테이블 값 불러와서 넣기
insert into testtbl4 select emp_no, first_name, last_name from employees.employees;

select * from testtbl4;

# 테이블 값 수정 : update
select * from testtbl4 where fname = 'Aamer';
update testtbl4 set lname = '없음' where fname = 'Aamer';
select * from testtbl4 where fname = 'Aamer';

select * from buytbl;
-- buytbl에서 운동화 제품가격을 모두 20% 상승
update buytbl set price = price*1.2 where prodName = '운동화';
select * from buytbl;

# 데이터 삭제 : delete(데이터 삭제) / drop : 객체(table, database..)를 제거

select * from testtbl4 where fname = 'Aamer';
-- fname이 'Aamer'인 데이터를 10개만 지우기
delete from testtbl4 where fname = 'Aamer' limit 10;
select * from testtbl4 where fname = 'Aamer';
-- 228개에서 218개 된것을 확인가능(Message창 확인)

-- fname이 'Aamer'인 데이터를 지우기
delete from testtbl4 where fname = 'Aamer';
select * from testtbl4 where fname = 'Aamer';