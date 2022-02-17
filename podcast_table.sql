-- create database podcast1;
use song2;

create table narrator(
nid int primary key auto_increment,
narrator char(25)
);
create table type1(
tid int primary key auto_increment,
tname char(25)
);
create table celebrity(
cid int primary key auto_increment,
cname char(25)
);
alter table narrator auto_increment=1001;
alter table type1 auto_increment=2002;
alter table celebrity auto_increment=3001;

create table podcast(
pid int primary key auto_increment,
pcname char(25),
nid int,
tid int,
cid int,
foreign key(nid) references narrator(nid),
foreign key(tid) references type1(tid),
foreign key(cid) references celebrity(cid)
);
alter table podcast auto_increment=4001;

create table podcastepi(
peid int primary key auto_increment,
epi_no int,
epi_name char(25),
duration char(25),
pid int,
foreign key(pid)references podcast(pid)
);
alter table podcastepi auto_increment=5001;

select * from temp2;
select * from celebrity;
select * from type1;
select * from narrator;
select * from podcast;
select * from podcastepi;

create view temp2 as
select narrator.narrator,type1.tname,celebrity.cname,podcast.pcname,podcastepi.epi_no,podcastepi.epi_name,podcastepi.duration from narrator
 join podcast on podcast.nid=narrator.nid join type1 on podcast.tid=type1.tid join celebrity on podcast.cid=celebrity.cid join podcastepi where podcast.pid=podcastepi.pid;
