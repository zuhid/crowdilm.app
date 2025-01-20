create table if not exists setting(
    key text not null
  , value text not null
  , primary key(key)
);
insert or ignore into setting(key, value) values 
('paging','page');