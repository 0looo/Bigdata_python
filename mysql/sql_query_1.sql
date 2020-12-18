# cast : 데이터 타입변환
select cast('2020-10-19 12:35:29:123' as date) as 'Date';
select cast('2020-10-19 12:35:29:123' as Time) as 'Date';
select cast('2020-10-19 12:35:29:123' as datetime) as 'Date';

use sqldb;
select * from buytbl;
# concat : 문자열을 이어줌
select num, concat(cast(price as char(10)), 'x', cast(amount as char(10)), '=') as '가격X구매액',
 price*amount as '총구매금액'  from buytbl;
 
# concat_ws : 문자열을 이어주면서 구분자를 넣어줌 
select concat_ws('/', '2020','01','01') as '날짜';
 
# ifnull(요소1, 요소2) : 요소1이 null이면 요소2를 출력, 요소1이 null이 아니면 요소1을 출력
select ifnull(null, '요소2');
select ifnull('요소1', '요소2');

# insert('문자열1', index, length, '문자열2') : 문자열1의 index 위치에 length만큼의 문자들을 대체해서  문자열2를 삽입
# index는 1부터 시작함
select insert('abcdefghi', 3 , 4, '@@@@');
select insert('abcdefghi', 3 , 2, '@@@@');

# left('문자열',num) : 문자열 왼쪽에서 num만큼 리턴
# right('문자열',num) : 문자열 오늘쪽에서 num만큼 리턴
select left('abcdefghi',3);
select right('abcdefghi',3);

# repeat('문자열', 00) : 문자열을 00만큼 반복
-- select repeat('abc', 3);

# lower('문자열') : 문자열을 소문자로 변환
# upper('문자열') : 문자열을 대문자로 변환
select lower('abCDeFg');
select upper('abCDeFg');

# lpad('문자열1', 00, '문자열2') : 00자리에 문자열1을 왼쪽에 넣고 나머지를 문자열2로 채움
# rpad('문자열1', 00, '문자열2') : 00자리에 문자열1을 오른쪽에 넣고 나머지를 문자열2로 채움
## python : '문자열'.zfill()과 동일
select lpad('abc',7,'@');
select lpad('abc',8,'#');
select rpad('abc',8,'#');

# ltrim, rtrim : 왼쪽/오른쪽 공백제거
## python : lstrip(), rstrip()과 동일 / strip()해서 양쪽제거도 가능
select ltrim('     abc');
select rtrim('abc     ');

# replace('문자열1', '문자열2', '문자열3') : 문자열1에서 문자열2를 문자열3으로 변경
## python : '문자열1'.replace('문자열2','문자열3') 과 동일
select replace('hello mysql!!','mysql','python');

# space(00) : 00만큼 공백(space)를 만듬
select concat('hello',space(10),'python');

# abs() : 절대값으로 변경
select abs(-20);

# ceiling() : 올림 / floor() : 내림 / round() : 반올림
## python과 동일
select ceiling(4.7);

# mod(num1 , num2) : num1 / num2 의 나머지
# pow(num1,num2) : num1^num2
# sqrt(00) : 00^(1/2)


# length() : byte의 크기 출력 / 영문은 하나당 1byte, 한글은 하나당 3byte
select length('abcd');
select length('가나'); 

/* mysql datatype 유형
## 문자형
char(00) : 고정길이 문자열 타입, 00 : 최대글자수, 00 : 1~255까지 가능
	* 글자당 크기 = 알파벳 : 1bype , 한글 : 3bype
	ex) char(10) : 실제 입력되는 글자와 상관없이 10만큼 자리차지
 
varchar(00) : 가변길이 문자열 타입, 나머지는 char와 동일
 
TEXT : 최대 65535의 택스트를 담을 수 있음
longtext : 최대 42994967295 (4M) 텍스트를 담을 수 있음

## 숫자형
int : -2147483648 ~ 2147483647 사이 가능
float : -3.102823466e+38 ~ 1.175494351e-38 사이 숫자가능

## 날짜형
date : yyyy-mm-dd('1001-01-01' ~ '9999-12-31')
time : hh:mm:ss('-838:59:59' ~ '838:59:59')
datetime : yyyy-mm-dd hh:mm:ss
year[(2|4)] : 2인 경우 70 ~ 69, 4인 경우 1970 ~ 2069 */


# package size 변경
create table maxtable (col1 longtext, col2 longtext);
insert into maxtable values (repeat('a', 100000), repeat('가',1000000));
select * from maxtable;


insert into maxtable values (repeat('a', 10000000), repeat('가', 10000000));
/* 글자 수 범위 조정하는 방법
cmd 관리자권한 실행
c:programdata / mysql / mysql server 5.7로 이동
notepad my.ini 실행
max_allowed_packet 을 검색 후 뒤에 크기를 조절
mysql을 종료
net stop mysql
net start mysql
mysql 재실행
*/

# table 내용을 file로 내보내고 file의 내용을 table로 불러오기 
-- 사용할 폴더 = c:Temp
/* 지정폴더를 변경하는 방법
cmd 관리자권한 실행
c:programdata / mysql / mysql server 5.7로 이동
notepad my.ini 실행
Secure file priv 검색 후 위치 조정
(기본값 : ProgramData/MySQL/MySQL Server 5.7/Uploads)
mysql을 종료
net stop mysql
net start mysql
mysql 재실행
*/
use sqldb;

-- c:Temp에 usertbl.txt.로 저장
select * into outfile 'c:/Temp/usertbl.txt' from usertbl;

-- 파일 내용을 table로 불러오기
create table membertbl like usertbl; -- usertbl의 구조 복사
load data local infile 'C:/Temp/usertbl.txt' into table membertbl;

select * from membertbl;

# join
# join 종류 : inner, outer, left, right

select * from buytbl;
select * from usertbl;

# inner join (join의 기본값이므로 join만 써도 됨)
select * from buytbl inner join usertbl on buytbl.userid = usertbl.userid;
# table명을 다른 변수로 만들기 : table명 뒤에 변수명 적기
select * from buytbl b inner join usertbl u on b.userid = u.userid;
# 또다른 동일한 방법
select * from buytbl b,usertbl u where b.userid = u.userid;

-- 'JYP'가 구매한 제품의 이름, 주소를 출력
select prodName, addr from buytbl b inner join usertbl u on b.userid = u.userid where name = '조용필';

-- '모니터'를 구매한 사람의 이름
select name from buytbl b inner join usertbl u on b.userid = u.userid where prodName = '모니터';

-- '전화번호'가 없는 고객의 이름과 주소, 구매한 제품을 출력
select name, addr, prodName from buytbl b inner join usertbl u on b.userid = u.userid where mobile1 is NULL;

-- 총구매금액이 가장 큰 고객의 이름과 주소
--  값은값이 있으면 항상 1개만 뽑아씀..
select name, addr, price*amount '총구매액' from buytbl b inner join usertbl u on b.userid = u.userid order by 총구매액 desc limit 2;

-- table 3개 join
create table stdtbl(
	stdname varchar(10) not null primary key,
    addr char(4) not null);
    
create table clubtbl(
	clubname varchar(10) not null primary key,
    roomno char(4) not null);

create table stdclubtbl(
	num int auto_increment not null primary key,
    stdname varchar(10) not null,
    clubname varchar(10) not null);

insert into stdtbl values('김범수', '경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');
select * from stdtbl;

insert into clubtbl values('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
select * from clubtbl;

insert into stdclubtbl values(null,'김범수','바둑'),(null, '김범수','축구'),(null,'조용필','축구'),(null,'은지원','축구'),
	(null,'은지원','봉사'),(null,'바비킴', '봉사');
select * from stdclubtbl;

select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

# inner join 2번사용(col겹치는게 싫으면 * 대신 col값 적어주면 됨)
select * from stdtbl inner join stdclubtbl on stdtbl.stdname = stdclubtbl.stdname
	inner join clubtbl on stdclubtbl.clubname = clubtbl.clubname;

# where 활용(col겹치는게 싫으면 * 대신 col값 적어주면 됨)
select * from stdtbl s, stdclubtbl sc, clubtbl c
	where s.stdname = sc.stdname and sc.clubname = c.clubname;

-- 축구부에 가입한 학생의 주소를 출력
select addr from stdtbl s, stdclubtbl sc, clubtbl c
	where s.stdname = sc.stdname and sc.clubname = c.clubname and c.clubname = '축구';


# if 구문 / case when 구문

-- if 사용

drop procedure if exists ifproc3;

DELIMITER $$
create procedure ifproc3()  # procedure를 생성

begin
	declare point1 int;   # delare를 통해서 변수를 선언
    declare credit char(1);
    set point1 = 77;  # 변수에 값을 할당
    
    if point1 >= 90 then
		set credit = 'A';
	elseif point1 >= 80 then
		set credit = 'B';
	elseif point1 >= 70 then
		set credit = 'C';
	elseif point1 >= 60 then
		set credit = 'D';
	else
		set credit = 'F';
	end if;
	select concat('취득점수 ==> ',point1), concat('학점 ==> ', credit);
end $$
delimiter ;

call ifproc3();

/* case when 사용 */

drop procedure if exists ifproc4;

delimiter $$
create procedure ifproc4()

begin
	declare point int;
    declare credit char(1);
    set point = 77;
    
    case
		when point >= 90 then
			set credit='A';
		when point >= 80 then
			set credit='B';
		when point >= 70 then
			set credit='C';
		when point >= 60 then
			set credit='D';
        else 
			set credit='F';
    end case;
    
	select concat('취득점수==>',point), concat('학점==>', credit);
end $$
delimiter ;
call ifproc4;

select u.userid, u.name, sum(price*amount) as '총구매내역'
	from buytbl b right join usertbl u on b.userid = u.userid
		group by u.userid, u.name
		order by sum(price*amount) desc;

select u.userid, u.name, sum(price*amount) as '총구매내역',

	case
		when (sum(price*amount) >= 1500) then '최우수고객'
        when (sum(price*amount) >= 1000) then '우수고객'
        when (sum(price*amount) >= 1) then '일반고객'
        else '유령고객'
	end as '고객등급'
    
from buytbl b right outer join usertbl u on b.userid = u.userid
group by u.userid, u.name
order by sum(price*amount) desc;

use sqldb;