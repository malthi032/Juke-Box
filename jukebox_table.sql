create database song;
use song;

create table artist(
artistid int primary key auto_increment,
artist_name char(25),
gender char(25)
);

create table album(
albumid int primary key auto_increment,
album_name char(25),
relesdate date
);

create table genre(
gid int primary key auto_increment,
gname char(25)
);

alter table artist auto_increment=1001;
alter table album auto_increment=2001;
alter table genre auto_increment=3001;

create table song(
songid int primary key auto_increment,
songname char(25),
duration char(25),
artistid int,
albumid int,
gid int,
foreign key(artistid) references artist(artistid),
foreign key(albumid) references album(albumid),
foreign key(gid) references genre(gid)
);

alter table song auto_increment=4001;

create view temp as
select artist.artist_name,artist.gender,album_name,genre.gname,song.songname,song.duration from artist join song on artist.artistid=song.artistid join album on album.albumid=song.albumid join genre where genre.gid=song.gid;