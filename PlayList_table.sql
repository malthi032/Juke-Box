-- create database playlist;
use song2;

create table PlayList(
plid int primary key auto_increment,
plname char(25)
);

create table PlayListCon(
plcid int primary key auto_increment,
plid int,
foreign key(plid) references playlist(plid),
duration1 char(25),
trackid int
);

-- insert into playlistcon(plid,duration,trackid) values(1,"4:34",4054);

alter table playlist auto_increment=6001;
alter table playlistcon auto_increment=7001; 

create view temp3 as
select playlist.plname,playlistcon.duration1,artist.artist_name,artist.gender,album_name,genre.gname,song.songname,song.duration,album.relesdate from playlist join playlistcon on playlist.plid=playlistcon.plid
join song on playlistcon.trackid=song.songid join artist on artist.artistid=song.artistid 
join album on album.albumid=song.albumid join genre where genre.gid=song.gid;
 
 create view temp4 as
 select playlist.plname,playlistcon.duration1,narrator.narrator,type1.tname,celebrity.cname,podcast.pcname,podcastepi.epi_no,podcastepi.epi_name,podcastepi.duration from playlist join playlistcon on playlist.plid=playlistcon.plid
 join podcastepi on playlistcon.trackid=podcastepi.peid join narrator join podcast on podcast.nid=narrator.nid join type1 on podcast.tid=type1.tid 
 join celebrity on podcast.cid=celebrity.cid where podcast.pid=podcastepi.pid;

select * from temp3;
select * from temp4;

select * from playlist;
 select * from playlistcon;




