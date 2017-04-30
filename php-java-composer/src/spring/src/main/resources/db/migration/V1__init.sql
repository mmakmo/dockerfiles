create schema if not exists "public";

CREATE TABLE CATEGPRY (
	category_id int(5) not null,
	class_id int(5) not null,
	item_id int(5) not null
);

CREATE TABLE ITEM (
	item_id int(5) not null,
	name varchar(255) not null
);

INSERT INTO CATEGPRY (category_id, class_id, item_id) VALUES (1, 1, 1);
INSERT INTO CATEGPRY (category_id, class_id, item_id) VALUES (1, 1, 2);
INSERT INTO CATEGPRY (category_id, class_id, item_id) VALUES (1, 2, 3);
INSERT INTO CATEGPRY (category_id, class_id, item_id) VALUES (1, 2, 4);

INSERT INTO ITEM (item_id, name) VALUES (1, 'item 1');
INSERT INTO ITEM (item_id, name) VALUES (2, 'item 2');
INSERT INTO ITEM (item_id, name) VALUES (3, 'item 3');
INSERT INTO ITEM (item_id, name) VALUES (4, 'item 4');