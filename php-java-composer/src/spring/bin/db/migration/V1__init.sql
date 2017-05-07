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



INSERT INTO category (category_id, class_id, item_id) VALUES (1, 1, 1);
INSERT INTO category (category_id, class_id, item_id) VALUES (1, 2, 2);
INSERT INTO category (category_id, class_id, item_id) VALUES (2, 3, 3);
INSERT INTO category (category_id, class_id, item_id) VALUES (2, 4, 4);

INSERT INTO item_attr (item_id, item_property) VALUES (1, 'property 1');
INSERT INTO item_attr (item_id, item_property) VALUES (2, 'property 2');
INSERT INTO item_attr (item_id, item_property) VALUES (3, 'property 3');
INSERT INTO item_attr (item_id, item_property) VALUES (4, 'property 4');

INSERT INTO item (item_id, item_name) VALUES (1, 'item 1');
INSERT INTO item (item_id, item_name) VALUES (2, 'item 2');
INSERT INTO item (item_id, item_name) VALUES (3, 'item 3');
INSERT INTO item (item_id, item_name) VALUES (4, 'item 4');