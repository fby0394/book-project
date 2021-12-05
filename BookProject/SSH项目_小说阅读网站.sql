--�û����ͣ�usertype��:
create table usertype(
utid  number(2) primary key,-- ����id,����
utname  varchar2(20) not null--  ��������
);
--��������Ա������Ա���û�������
insert into usertype values(1,'����Ա');
insert into usertype values(2,'����');
insert into usertype values(3,'�û�');

--�û���(USERINFO)��
create table userinfo(
userid number(10) primary key, -- �û�id����10000��ʼ��,����
uname varchar2(20) not null unique, -- �û������ǿգ�
upwd  varchar2(100) not null, --�û����루�ǿգ�
ustate  number(1) not null check(ustate in(0,1)),-- �˻�״̬��0���ã�1���ã�
utid number(2) references usertype(utid) not null, --�˻����ͣ������
usercard	varchar(18) unique check(length(usercard)=15 or length(usercard)=18),--	���֤�ţ�Լ������15��18λ��
phone varchar2(11) unique,  --�ֻ��ţ�Ψһ������Ϊ�գ�
qqnumber  varchar2(11) unique,  --�󶨵�qq�ţ�Ψһ������Ϊ�գ�
wxnumber  varchar2(30) unique, -- �󶨵�΢�źţ�Ψһ����Ϊ�գ�
zfbnumber	varchar2(30) unique,--	�󶨵�֧�����ţ�Ψһ����Ϊ�գ�
balance	number(12) default(0),--	�˻���һԪ��Ӧ100�㣬Ĭ��ֵΪ0��
addtime date default(SYSDATE)--���ʱ��
);
insert into userinfo values(1,'admin','31bk32bl33bm34bn35b036b3',0,1,'412727199503206594','17095410639',271692097,'fby271692097','17095410639',10000,SYSDATE);
insert into userinfo values(10000,'����1','31bk32bl33bm34bn35b036b3',0,3,'412727198503206593','15150509797',null,null,null,0,SYSDATE);
--���һ�ٸ�����
declare
begin
  for i in 1..100  loop
    insert into userinfo values((10000+i),'����'||i,'31bk32bl33bm34bn35b036b3',0,2,'4127271985032'||(10000+i),'151505'||(10000+i),null,null,null,0,SYSDATE);
    end loop;
    end;
    
--�鼮���ͣ�booktypeinfo����
create table booktypeinfo(
btid  number(2) primary key,--  �鼮���ͱ��
btname  varchar2(20)--  �鼮����
);
--���ã����飬��ʷ�����У����죬�ƻã�����
insert into booktypeinfo values(1,'����');
insert into booktypeinfo values(2,'����');
insert into booktypeinfo values(3,'��ʷ');
insert into booktypeinfo values(4,'����');
insert into booktypeinfo values(5,'����');
insert into booktypeinfo values(6,'����');
insert into booktypeinfo values(7,'�ƻ�');

--�鼮״̬��bookstate����
create table bookstate(
bsid  number(1) primary key,-- �鼮״̬���
bsname  varchar2(20)--  �鼮״̬
);
--����ˣ����飬���أ��걾�����
insert into bookstate values(1,'�����');
insert into bookstate values(2,'����');
insert into bookstate values(3,'����');
insert into bookstate values(4,'�걾');
insert into bookstate values(5,'���');


--�鼮��Ϣ��bookinfo����
create table bookinfo(
bookid  varchar2(20) primary key,--  ͼ����
bookname  varchar2(50) not null,--  ͼ������
booknamesx varchar2(20) not null,--ͼ����������ĸ��д
btid  number(2) references booktypeinfo(btid) not null,-- ͼ������(���)
authorid  number(10) references userinfo(userid) not null,--  ͼ������(����������û���)
bsid  number(1) references bookstate(bsid) not null, --ͼ��״̬(���)
readnum number(10) default 0,--  �Ķ�����
collectnum  number(10) default 0,--  �ղ�����
booksize  number(10)default 0,--  ͼ��������
bookpicurl  varchar2(500),-- ͼ���Ӧ��ͼƬ·��
addtime date default(sysdate),--ͼ�����ʱ��
updatetime  date,--    ������ʱ��
bookintrod  varchar2(2000)-- ͼ����
);
delete bookinfo where bookid='1cs20180910095907';
delete bijoinbst where bookid='1cs20180910095907';
declare
begin
  for i in 1..3000 loop
    insert into bookinfo(bookid,bookname,booknamesx,btid,authorid,bsid,readnum,collectnum,booksize,bookpicurl,addtime,updatetime,bookintrod)
     values('CS20180807'||(20000+i),'ͼ��'||i,'ts',(mod(i,7)+1),(10100-(mod(i,100))),(mod(i,4)+1),0,0,0,null,sysdate,sysdate,'ͼ����Ӳ���'||i);
    end loop;
end;
update bookinfo set collectnum=(rownum)*4 where bsid in(2,3,4) and rownum<=60;
--ȥ������ǰ��Ļ��з�
update bookinfo set bookname=replace(bookname,chr(10),''),booknamesx=replace(booknamesx,chr(10),'');
select * from bookinfo;

--�鼮Ŀ¼��bookcataloginfo����
create table bookcataloginfo(
catalogid varchar2(25) primary key,-- �½ڱ��
bookid  varchar2(20) references bookinfo(bookid) not null,--  ͼ�������
catalogtitle  varchar2(100) not null,--�½ڱ���
catalognum number(5) not null,--Ŀ¼˳��
catalogurl  varchar2(500) not null,-- �½ڶ�Ӧ��url��ַ
catalogsize number(5) not null,--�½�����
updatetime  date,--    ����ʱ��
readnum number(10) default 0,--  �Ķ�����
catalogprice  number(4) default 0-- �½ڼ۸�0Ϊ��ѣ�
);


declare
begin
  for i in 1..1000 loop
    for j in 1..100 loop
      insert into bookcataloginfo(catalogid,bookid,catalogtitle,catalogurl,catalogsize,updatetime,readnum,catalogprice,catalognum)
       values('CS20180729'||(10000+i)||(1000+j),'CS20180729'||(10000+i),(select bookname from bookinfo where bookid='CS20180729'||(10000+i))||'��'||j||'��',j||'.txt',1000,sysdate,0,0,j);
      end loop;
    end loop;
end;
declare
begin
  for i in 1..3000 loop
    for j in 1..100 loop
      insert into bookcataloginfo(catalogid,bookid,catalogtitle,catalogurl,catalogsize,updatetime,readnum,catalogprice,catalognum)
       values('CS20180807'||(20000+i)||(1000+j),'CS20180807'||(20000+i),(select bookname from bookinfo where bookid='CS20180807'||(20000+i))||'��'||j||'��',j||'.txt',1000,sysdate,0,0,j);
      end loop;
    end loop;
end;
select count(*) from bookcataloginfo
--ͼ����bookstyle��
create table bookstyle(
bstid number(2) primary key,
bstname varchar2(50) not null
);

insert into bookstyle values(1,'����');
insert into bookstyle values(2,'��Ц');
insert into bookstyle values(3,'Ű��');
insert into bookstyle values(4,'����');
insert into bookstyle values(5,'���');
insert into bookstyle values(6,'����ʽ���');
insert into bookstyle values(7,'����');
insert into bookstyle values(8,'������');
insert into bookstyle values(9,'����');
insert into bookstyle values(10,'��ܰ��ˮ');
--ͼ��ͷ�����ӱ�
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
--ɾ���ظ����ݣ�������rowid��С��һ������
delete bijoinbst b where (b.bstid,b.bookid) in
(select * from bijoinbst group by bstid,bookid having count(*)>1) and 
rowid not in (select min(rowid) from bijoinbst group by bstid,bookid having count(*)>1);


--�����Ϣ��booksheifinfo����
create table booksheifinfo(
bsiid varchar2(30) primary key,--�������,�û�id+ͼ����
bookid  varchar2(20) references bookinfo(bookid) not null,-- ͼ�������
userid  number(10) references userinfo(userid) not null,-- �û�id���
catalogid varchar2(25) references bookcataloginfo(catalogid) not null,-- �½ڱ�����,��ǰͼ���Ķ�����
bstime  date --�������ʱ��
);

insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910001','CS2018072910001',1,'CS20180729100011001',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910011','CS2018072910011',1,'CS20180729100111011',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910101','CS2018072910101',1,'CS20180729101011071',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910021','CS2018072910021',1,'CS20180729100211051',sysdate);
insert into booksheifinfo(bsiid,bookid,userid,catalogid,bstime) values('1CS2018072910051','CS2018072910051',1,'CS20180729100511001',sysdate);

--�ֲ�ͼ�飨carouselbookinfo����
create table carouselbookinfo(
carbookid number(1) primary key,-- �ֲ����
bookid  varchar2 (20) references bookinfo(bookid) not null,--  ͼ�������
picurl  varchar2(100)-- ��Ӧ��ͼƬ·��
);
insert into carouselbookinfo values(1,'CS2018072910001','');
insert into carouselbookinfo values(2,'CS2018072910002','');
insert into carouselbookinfo values(3,'CS2018072910003','');
insert into carouselbookinfo values(4,'CS2018072910004','');
insert into carouselbookinfo values(5,'CS2018072910005','');
select * from bookinfo

--�Ƽ�ͼ�飨recommendbookinfo����
create table recommendbookinfo(
recommendid	number(2) primary key,--	�Ƽ���ͼ����
bookid	varchar2	(20) references bookinfo(bookid) not null--	ͼ�������
);

select * from recommendbookinfo
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

--������Ϣ��messageinfo��
create table messageinfo(
mesid number(6),--���Ա��
bookid  varchar2(20) references bookinfo(bookid) not null,--  ͼ���ţ������
catalogid varchar2(25) references bookcataloginfo(catalogid) not null,--  �½ڱ�ţ������
mescontent  Varchar2(500) not null,-- ��������
messtate  number(1) check(messtate in(0,1,2)),-- ����״̬(0δ��ˣ�1����ˣ�2��˲�ͨ��)
userid  number(10) references userinfo(userid) not null,--�û�id
mestime date
);


