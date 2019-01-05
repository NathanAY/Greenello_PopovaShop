-- Table: users
DROP TABLE users;
CREATE TABLE users
(
  id       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  usermail VARCHAR(255) NOT NULL,
  name     VARCHAR(255) NULL,
  phone    VARCHAR(255) null,
  password VARCHAR(255) NOT NULL
);

--   ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles
(
  id   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
--   ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
drop table user_roles;
CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
);

select * from activity_event;
insert into activity_event (id, creator_name, event_date, text) values (0, 'admin', '04-DEC-18 10:25',
          'Create "Получить вдохновение" card, and assigned to Ilon Mask');
DROP TABLE activity_event;
CREATE TABLE activity_event
(
  id             INTEGER       NOT NULL PRIMARY KEY,
  creator_name   VARCHAR(16)       null,
  event_date    date          null,
  text         VARCHAR(256)  null
);


DROP TABLE greenello_card;
CREATE TABLE greenello_card
(
  id             INTEGER       NOT NULL PRIMARY KEY,
  creator_id     integer       null,
  create_date    date          null,
  status         VARCHAR(16)  null,
  queue_position integer       null,
  summary        VARCHAR(128) null,
  description    VARCHAR(512) null,
  assignee_id    integer       null
);
create sequence greenello_card_seq;

create or replace trigger greenello_card_trg
  before insert
  on greenello_card
  for each row
begin
  if :new.ID is null then
    select greenello_card_seq.nextval into :new.ID from dual;
  end if;
end;

--   ENGINE = InnoDB;
DROP TABLE products;
CREATE TABLE products
(
  id           INTEGER IDENTITY (1,1) NOT NULL PRIMARY KEY,
  name         VARCHAR(255) NOT NULL,
  categoryId   INTEGER       null,
  categoryName VARCHAR(255) null,
  price        VARCHAR(255) null,
  rating       VARCHAR(255) null,
  description  VARCHAR(255) null
);

drop table category;
CREATE TABLE category
(
  id   INTEGER IDENTITY (1,1) NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE basket;
CREATE TABLE basket
(
  id       INTEGER IDENTITY (1,1) NOT NULL PRIMARY KEY,
  userId   INTEGER NULL,
  product  INTEGER null,
  quantity INTEGER null
);

DROP TABLE orders;
CREATE TABLE orders
(
  id          INTEGER IDENTITY (1,1) NOT NULL PRIMARY KEY,
  userId      INTEGER       NULL,
  userName    VARCHAR(255) null,
  productId   INTEGER       null,
  productName VARCHAR(255) null,
  cost        VARCHAR(255) null,
  quantity    INTEGER       null
);


-- Insert data proselyte 12345678

INSERT INTO users
VALUES (1, 'proselyte', 'mail@my.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles
VALUES (1, 'ROLE_USER');
INSERT INTO roles
VALUES (2, 'ROLE_ADMIN');
INSERT INTO user_roles
VALUES (1, 2);

INSERT INTO category
values ('Fridges');
INSERT INTO category
values ('Washes');
INSERT INTO category
values ('Microwaves');
INSERT INTO category
values ('Stoves');
INSERT INTO category
values ('Vacuum cleaners');
INSERT INTO category
values ('Heaters');
INSERT INTO category
values ('Other');

select *
from users;
select *
from roles;
select *
from user_roles;
select *
from products;
select *
from category;
select *
from basket;
update user_roles
set role_id = 2
where user_id = 1;
update products
set name = 'name'
where id = 2;
delete category;
delete
from category
where id = 15;
select * from greenello_card;
delete from greenello_card where id = 6;
commit ;