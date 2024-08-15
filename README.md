# sqldef-test

## 使い方

```shell
sqlite3def --dry-run dev.sqlite < schema.sql 
-- dry run --
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
root@58183bc89838:/app# sqlite3def dev.sqlite < schema.sql 
-- Apply --
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
root@58183bc89838:/app# sqlite3def dev.sqlite < schema.sql 
-- Apply --
ALTER TABLE `users` ADD COLUMN `nickname` text;
```

## 軽く使った感想

- 「SQL logic error」が結構な頻度で発生する印象。それぞれ、どう対応していくか考える必要がありそう
