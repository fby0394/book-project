-- 用户类型（usertype）:
create table usertype(
utid  number(2) primary key,-- 类型id,主键
utname  varchar2(20) not null--  类型名称
);
-- 超级管理员，管理员，用户，作家
insert into usertype values(1,'管理员');
insert into usertype values(2,'作家');
insert into usertype values(3,'用户');

-- 用户表(USERINFO)：
create table userinfo(
userid number(10) primary key, -- 用户id（从10000开始）,主键
uname varchar2(20) not null unique, -- 用户名（非空）
upwd  varchar2(100) not null, -- 用户密码（非空）
ustate  number(1) not null check(ustate in(0,1)),-- 账户状态（0可用，1禁用）
utid number(2) references usertype(utid) not null, -- 账户类型（外键）
usercard	varchar(18) unique check(length(usercard)=15 or length(usercard)=18),--	身份证号（约束必须15或18位）
phone varchar2(11) unique,  -- 手机号（唯一，可以为空）
qqnumber  varchar2(11) unique,  -- 绑定的qq号（唯一，可以为空）
wxnumber  varchar2(30) unique, -- 绑定的微信号（唯一，可为空）
zfbnumber	varchar2(30) unique, -- 绑定的支付宝号（唯一，可为空）
balance	number(12) default(0), -- 账户余额（一元对应100点，默认值为0）
addtime date default(SYSDATE) -- 添加时间
);
insert into userinfo values(1,'admin','31bk32bl33bm34bn35b036b3',0,1,'412727199503206594','17095410639',271692097,'fby271692097','17095410639',10000,SYSDATE);
insert into userinfo values(10000,'测试1','31bk32bl33bm34bn35b036b3',0,3,'412727198503206593','15150509797',null,null,null,0,SYSDATE);
-- 添加一百个作者
declare
begin
for i in 1..100  loop
insert into userinfo values((10000+i),'作者'||i,'31bk32bl33bm34bn35b036b3',0,2,'4127271985032'||(10000+i),'151505'||(10000+i),null,null,null,0,SYSDATE);
end loop;
end;

-- 书籍类型（booktypeinfo）：
create table booktypeinfo(
btid  number(2) primary key,--  书籍类型编号
btname  varchar2(20)--  书籍类型
);
-- 玄幻，言情，历史，都市，灵异，科幻，网游
insert into booktypeinfo values(1,'玄幻');
insert into booktypeinfo values(2,'言情');
insert into booktypeinfo values(3,'历史');
insert into booktypeinfo values(4,'都市');
insert into booktypeinfo values(5,'灵异');
insert into booktypeinfo values(6,'网游');
insert into booktypeinfo values(7,'科幻');

-- 书籍状态（bookstate）：
create table bookstate(
bsid  number(1) primary key,-- 书籍状态编号
bsname  varchar2(20)--  书籍状态
);
-- 待审核，新书，连载，完本，封禁
insert into bookstate values(1,'待审核');
insert into bookstate values(2,'新书');
insert into bookstate values(3,'连载');
insert into bookstate values(4,'完本');
insert into bookstate values(5,'封禁');


-- 书籍信息（bookinfo）：
create table bookinfo(
bookid  varchar2(20) primary key,--  图书编号
bookname  varchar2(50) not null,--  图书名称
booknamesx varchar2(20) not null,-- 图书名称首字母缩写
btid  number(2) references booktypeinfo(btid) not null,-- 图书类型(外键)
authorid  number(10) references userinfo(userid) not null,--  图书作者(外键，关联用户表)
bsid  number(1) references bookstate(bsid) not null, -- 图书状态(外键)
readnum number(10) default 0,--  阅读数量
collectnum  number(10) default 0,--  收藏数量
booksize  number(10)default 0,--  图书总字数
bookpicurl  varchar2(500),-- 图书对应的图片路径
addtime date default(sysdate),-- 图书添加时间
updatetime  date,--    最后更新时间
bookintrod  varchar2(2000)-- 图书简介
);
delete bookinfo where bookid='1cs20180910095907';
delete bijoinbst where bookid='1cs20180910095907';
declare
begin
for i in 1..3000 loop
insert into bookinfo(bookid,bookname,booknamesx,btid,authorid,bsid,readnum,collectnum,booksize,bookpicurl,addtime,updatetime,bookintrod)
values('CS20180807'||(20000+i),'图书'||i,'ts',(mod(i,7)+1),(10100-(mod(i,100))),(mod(i,4)+1),0,0,0,null,sysdate,sysdate,'图书添加测试'||i);
end loop;
end;
update bookinfo set collectnum=(rownum)*4 where bsid in(2,3,4) and rownum<=60;
-- 去除书名前面的换行符
update bookinfo set bookname=replace(bookname,chr(10),''),booknamesx=replace(booknamesx,chr(10),'');
select * from bookinfo;

-- 书籍目录（bookcataloginfo）：
create table bookcataloginfo(
catalogid varchar2(25) primary key,-- 章节编号
bookid  varchar2(20) references bookinfo(bookid) not null,--  图书编号外键
catalogtitle  varchar2(100) not null,-- 章节标题
catalognum number(5) not null,-- 目录顺序
catalogurl  varchar2(500) not null,-- 章节对应的url地址
catalogsize number(5) not null,-- 章节字数
updatetime  date,--    更新时间
readnum number(10) default 0,--  阅读人数
catalogprice  number(4) default 0 -- 章节价格（0为免费）
);


declare
begin
for i in 1..1000 loop
for j in 1..100 loop
insert into bookcataloginfo(catalogid,bookid,catalogtitle,catalogurl,catalogsize,updatetime,readnum,catalogprice,catalognum)
values('CS20180729'||(10000+i)||(1000+j),'CS20180729'||(10000+i),(select bookname from bookinfo where bookid='CS20180729'||(10000+i))||'第'||j||'章',j||'.txt',1000,sysdate,0,0,j);
end loop;
end loop;
end;
declare
begin
for i in 1..3000 loop
for j in 1..100 loop
insert into bookcataloginfo(catalogid,bookid,catalogtitle,catalogurl,catalogsize,updatetime,readnum,catalogprice,catalognum)
values('CS20180807'||(20000+i)||(1000+j),'CS20180807'||(20000+i),(select bookname from bookinfo where bookid='CS20180807'||(20000+i))||'第'||j||'章',j||'.txt',1000,sysdate,0,0,j);
end loop;
end loop;
end;
select count(*) from bookcataloginfo
-- 图书风格（bookstyle）
create table bookstyle(
bstid number(2) primary key,
bstname varchar2(50) not null
);

insert into bookstyle values(1,'轻松');
insert into bookstyle values(2,'爆笑');
insert into bookstyle values(3,'虐恋');
insert into bookstyle values(4,'治愈');
insert into bookstyle values(5,'恶搞');
insert into bookstyle values(6,'开放式结局');
insert into bookstyle values(7,'正剧');
insert into bookstyle values(8,'生死大爱');
insert into bookstyle values(9,'囧文');
insert into bookstyle values(10,'温馨清水');
-- 图书和风格连接表
create table bijoinbst(
bstid number(2) references bookstyle(bstid) not null,
bookid  varchar2(20) references bookinfo(bookid) not null
);
select * from bookstyle;
select * from bijoinbst where bookid='cs1';
delete bijoinbst where bookid='cs1' ;
delete bookinfo where bookid='cs1';
declare
begin
for i in 1..1000 loop
if mod(i,8)=0 then
insert into  bijoinbst values(1,'CS20180729'||(10000+i));
elsif mod(i,27)=0 then
insert into  bijoinbst values(2,'CS20180729'||(10000+i));
elsif mod(i,7)=0 then
insert into  bijoinbst values(3,'CS20180729'||(10000+i));
elsif  mod(i,46)=0 then
insert into  bijoinbst values(4,'CS20180729'||(10000+i));
elsif  mod(i,12)=0 then
insert into  bijoinbst values(5,'CS20180729'||(10000+i));
elsif  mod(i,13)=0 then
insert into  bijoinbst values(6,'CS20180729'||(10000+i));
elsif  mod(i,17)=0 then
insert into  bijoinbst values(7,'CS20180729'||(10000+i));
elsif  mod(i,7)=0 then
insert into  bijoinbst values(8,'CS20180729'||(10000+i));
elsif   mod(i,25)=0 then
insert into  bijoinbst values(9,'CS20180729'||(10000+i));
elsif  mod(i,11)=0 then
insert into  bijoinbst values(10,'CS20180729'||(10000+i));
end if;
case mod(i,10)
when 0 then
insert into  bijoinbst values(1,'CS20180729'||(10000+i));
when 1 then
insert into  bijoinbst values(2,'CS20180729'||(10000+i));
when 2 then
insert into  bijoinbst values(3,'CS20180729'||(10000+i));
when 3 then
insert into  bijoinbst values(4,'CS20180729'||(10000+i));
when 4 then
insert into  bijoinbst values(5,'CS20180729'||(10000+i));
when 5 then
insert into  bijoinbst values(6,'CS20180729'||(10000+i));
when 6 then
insert into  bijoinbst values(7,'CS20180729'||(10000+i));
when 7 then
insert into  bijoinbst values(8,'CS20180729'||(10000+i));
when 8 then
insert into  bijoinbst values(9,'CS20180729'||(10000+i));
when 9 then
insert into  bijoinbst values(10,'CS20180729'||(10000+i));
end case;
end loop;
end;

declare
begin
for i in 1..3000 loop
if mod(i,8)=0 then
insert into  bijoinbst values(1,'CS20180807'||(20000+i));
elsif mod(i,27)=0 then
insert into  bijoinbst values(2,'CS20180807'||(20000+i));
elsif mod(i,7)=0 then
insert into  bijoinbst values(3,'CS20180807'||(20000+i));
elsif  mod(i,46)=0 then
insert into  bijoinbst values(4,'CS20180807'||(20000+i));
elsif  mod(i,12)=0 then
insert into  bijoinbst values(5,'CS20180807'||(20000+i));
elsif  mod(i,13)=0 then
insert into  bijoinbst values(6,'CS20180807'||(20000+i));
elsif  mod(i,17)=0 then
insert into  bijoinbst values(7,'CS20180807'||(20000+i));
elsif  mod(i,7)=0 then
insert into  bijoinbst values(8,'CS20180807'||(20000+i));
elsif   mod(i,25)=0 then
insert into  bijoinbst values(9,'CS20180807'||(20000+i));
elsif  mod(i,11)=0 then
insert into  bijoinbst values(10,'CS20180807'||(20000+i));
end if;
case mod(i,10)
when 0 then
insert into  bijoinbst values(1,'CS20180807'||(20000+i));
when 1 then
insert into  bijoinbst values(2,'CS20180807'||(20000+i));
when 2 then
insert into  bijoinbst values(3,'CS20180807'||(20000+i));
when 3 then
insert into  bijoinbst values(4,'CS20180807'||(20000+i));
when 4 then
insert into  bijoinbst values(5,'CS20180807'||(20000+i));
when 5 then
insert into  bijoinbst values(6,'CS20180807'||(20000+i));
when 6 then
insert into  bijoinbst values(7,'CS20180807'||(20000+i));
when 7 then
insert into  bijoinbst values(8,'CS20180807'||(20000+i));
when 8 then
insert into  bijoinbst values(9,'CS20180807'||(20000+i));
when 9 then
insert into  bijoinbst values(10,'CS20180807'||(20000+i));
end case;
end loop;
end;
select * from bijoinbst group by bstid,bookid having count(*)>1;
-- 删除重复数据，并保留rowid最小的一行数据
delete bijoinbst b where (b.bstid,b.bookid) in
(select * from bijoinbst group by bstid,bookid having count(*)>1) and
rowid not in (select min(rowid) from bijoinbst group by bstid,bookid having count(*)>1);


-- 书架信息（booksheifinfo）：
create table booksheifinfo(
bsiid varchar2(30) primary key,-- 书架主键,用户id+图书编号
bookid  varchar2(20) references bookinfo(bookid) not null,-- 图书编号外键
userid  number(10) references userinfo(userid) not null,-- 用户id外键
catalogid varchar2(25) references bookcataloginfo(catalogid) not null,-- 章节编号外键,当前图书阅读进度
bstime  date -- 加入书架时间
);

insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910001','CS2018072910001',1,'CS20180729100011001',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910011','CS2018072910011',1,'CS20180729100111011',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910101','CS2018072910101',1,'CS20180729101011071',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910021','CS2018072910021',1,'CS20180729100211051',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910051','CS2018072910051',1,'CS20180729100511001',sysdate);

-- 轮播图书（carouselbookinfo）：
create table carouselbookinfo(
carbookid number(1) primary key,-- 轮播编号
bookid  varchar2 (20) references bookinfo(bookid) not null,--  图书编号外键
picurl  varchar2(100)-- 对应的图片路径
);
insert into carouselbookinfo values(1,'CS2018072910001','');
insert into carouselbookinfo values(2,'CS2018072910002','');
insert into carouselbookinfo values(3,'CS2018072910003','');
insert into carouselbookinfo values(4,'CS2018072910004','');
insert into carouselbookinfo values(5,'CS2018072910005','');
select * from bookinfo

-- 推荐图书（recommendbookinfo）：
create table recommendbookinfo(
recommendid	number(2) primary key, -- 推荐的图书编号
bookid	varchar2	(20) references bookinfo(bookid) not null --图书编号外键
);

select * from recommendbookinfo;
insert into recommendbookinfo values(1,'CS2018072910101');
insert into recommendbookinfo values(2,'CS2018072910202');
insert into recommendbookinfo values(3,'CS2018072910303');
insert into recommendbookinfo values(4,'CS2018072910404');
insert into recommendbookinfo values(5,'CS2018072910505');
insert into recommendbookinfo values(6,'CS2018072910111');
insert into recommendbookinfo values(7,'CS2018072910222');
insert into recommendbookinfo values(8,'CS2018072910333');
insert into recommendbookinfo values(9,'CS2018072910444');
insert into recommendbookinfo values(10,'CS2018072910555');
insert into recommendbookinfo values(11,'CS2018072910121');
insert into recommendbookinfo values(12,'CS2018072910252');
insert into recommendbookinfo values(13,'CS2018072910363');
insert into recommendbookinfo values(14,'CS2018072910484');
insert into recommendbookinfo values(15,'CS2018072910575');

insert into recommendbookinfo values(21,'CS2018072910191');
insert into recommendbookinfo values(22,'CS2018072910282');
insert into recommendbookinfo values(23,'CS2018072910373');
insert into recommendbookinfo values(24,'CS2018072910464');
insert into recommendbookinfo values(25,'CS2018072910555');
insert into recommendbookinfo values(26,'CS2018072910141');
insert into recommendbookinfo values(27,'CS2018072910232');
insert into recommendbookinfo values(28,'CS2018072910323');
insert into recommendbookinfo values(29,'CS2018072910414');
insert into recommendbookinfo values(30,'CS2018072910505');
insert into recommendbookinfo values(31,'CS2018072910181');
insert into recommendbookinfo values(32,'CS2018072910292');
insert into recommendbookinfo values(33,'CS2018072910343');
insert into recommendbookinfo values(34,'CS2018072910474');
insert into recommendbookinfo values(35,'CS2018072910215');

-- 留言信息（messageinfo）
create table messageinfo(
mesid NUMBER(6),-- 留言编号
bookid  varchar2(20) references bookinfo(bookid) not null,--  图书编号（外键）
catalogid varchar2(25) references bookcataloginfo(catalogid) not null,--  章节编号（外键）
mescontent  Varchar2(500) not null,-- 留言内容
messtate  number(1) check(messtate in(0,1,2)),-- 留言状态(0未审核，1已审核，2审核不通过)
userid  number(10) references userinfo(userid) not null,-- 用户id
mestime date
);


