create table USERS(
    username varchar(50) not null constraint user_pk primary key,
    password varchar(60) not null,
    enabled smallint default 1,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);

create table AUTHORITIES (
    username varchar(50) not null references USERS (username),
    authority varchar(50) not null
);

-- 1 means enabled is true
-- 0 means enabled is false
-- default is 1 (per table column definition)

insert into USERS (username, password, enabled, first_name, last_name, email)
values ('gigi', 'p', 1, 'Gigi', 'Read', 'gigi@wctc.edu');

insert into USERS (username, password, enabled, first_name, last_name, email)
values ('hk', 'p', 0, 'Hello', 'Kitty', 'hkitty@wctc.edu');

insert into USERS (username, password, first_name, last_name, email)
values ('stacy', 'p', 'Stacy', 'Read', 'sread@wctc.edu');

insert into AUTHORITIES values ('gigi', 'USER');
insert into AUTHORITIES values ('hk', 'USER');
insert into AUTHORITIES values ('stacy', 'USER');
insert into AUTHORITIES values ('stacy', 'ADMIN');

update USERS set password = '$2a$10$wvOx0cpDYFkimT9N7Na4COTR2OPtU6ci69cDQJTqC5sRJ58ra76kG'
where password = 'p';

