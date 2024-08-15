create table users (
    id serial primary key,
    username text not null unique,
    password text not null
);

create table posts (
    id serial primary key,
    title text not null,
    content text not null,
    user_id integer not null,
    foreign key (user_id) references users (id),
    constraint fk_user_id foreign key (user_id) references users (id)
);
