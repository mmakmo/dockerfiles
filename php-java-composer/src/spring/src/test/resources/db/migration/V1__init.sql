create schema if not exists "public";

CREATE TABLE category (
	category_id int(5) not null,
	class_id int(5) not null,
	item_id int(5) not null
);
ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY(category_id, class_id);


CREATE TABLE item (
	item_id int(5) not null,
	item_name varchar(255) not null
);
ALTER TABLE item ADD CONSTRAINT item_pk PRIMARY KEY(item_id);

CREATE TABLE item_attr (
	item_id int(5) not null,
	item_property varchar(255) not null
);
ALTER TABLE item_attr ADD CONSTRAINT item_attr_pk PRIMARY KEY(item_id);