drop table if exists roles, user_312, user_roles;

create table if not exists user_312
(
    id         bigint primary key auto_increment,
    name   varchar(50)  not null,
    age   int(3)  not null,
    number   varchar(50)  not null,
    password   varchar(255) not null
);

create table if not exists roles
(
    id        bigint primary key auto_increment,
    role_name varchar(50) not null
);

create table if not exists user_roles
(
    user_id bigint,
    foreign key (user_id) references user_312 (id),
    role_id bigint,
    foreign key (user_id) references user_312 (id),
    primary key (user_id, role_id)
);

insert into user_312 (name, age, number, password)
values ('admin', '20', 'admin', 'admin');

insert into user_312 (name, age, number, password)
values ('user', '20', 'user', 'user');

insert into roles (role_name)
values ('ROLE_ADMIN'),
       ('ROLE_USER');

insert into user_roles (user_id, role_id)
values ((select id from user_312 where name = 'admin'),
        (select id from roles where role_name = 'ROLE_ADMIN'));

insert into user_roles (user_id, role_id)
values ((select id from user_312 where name = 'admin'),
        (select id from roles where role_name = 'ROLE_USER'));

insert into user_roles (user_id, role_id)
values ((select id from user_312 where name = 'user'),
        (select id from roles where role_name = 'ROLE_USER'));

