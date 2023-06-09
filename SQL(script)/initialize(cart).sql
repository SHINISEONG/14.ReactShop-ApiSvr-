

SHOW VARIABLES LIKE 'FOREIGN_KEY_CHECKS';
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE images;
DROP TABLE stock;
DROP TABLE cart;
DROP TABLE users  CASCADE CONSTRAINTS;
DROP TABLE product   CASCADE CONSTRAINTS ;
DROP TABLE transaction   CASCADE CONSTRAINTS;

SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE users ( 
	user_id 			VARCHAR(20)		NOT NULL,
	user_name 	VARCHAR(50)		NOT NULL,
	password 		VARCHAR(10)		NOT NULL,
	role 				VARCHAR(5) 		DEFAULT 'user',
	ssn 					VARCHAR(13),
	cell_phone	VARCHAR(14),
	addr 				VARCHAR(100),
	email 				VARCHAR(50),
	reg_date 		DATE,
	cart_tran_no	NUMBER(16),
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 					NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day	VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(200),
	reg_date 					DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE images (
	prod_no					NUMBER				NOT NULL REFERENCES product(prod_no),
	image_file 					VARCHAR2(100)
);

CREATE TABLE stock ( 
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	stock							NUMBER(16),
	PRIMARY KEY(prod_no)
);


CREATE TABLE transaction ( 
	tran_no 						NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 					VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	quantity					NUMBER(16),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	dlvy_addr 				VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3),
	order_date 				DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);

CREATE TABLE cart (
	tran_no						NUMBER(16)		NOT NULL REFERENCES transaction(tran_no),
	prod_no						NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	quantity					NUMBER(16)		NOT NULL
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date, cart_tran_no ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '����� ���ʱ�', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),null); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date, cart_tran_no ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),null);          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate,null); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate,null);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user20', 'SCOTT', '2020', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user21', 'SCOTT', '2121', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user22', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user23', 'SCOTT', '2323', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);

INSERT INTO users 
VALUES ( 'user24', 'SCOTT', '2323', 'user', NULL, NULL, NULL, NULL, sysdate, NULL);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','�Ҵ� ���̿� ��Ʈ�� �ŵ�ǰ','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'������','������ ���ƿ�~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'������','�ְ� ������ ��ǰ','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'���弼Ʈ','�ѽ��� �ۿ� �Ƚ���ϴ�. ������ �ӱݰ� ������ ��.��','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�ζ���','���ƿ�','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ���� 2G','sens �޸� 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'����','������ ���㺸����','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����2','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����3','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����4','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����5','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����6','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����7','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����8','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����9','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�Ｚ����10','��Ʈ��','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));



insert into stock values (10000, 3);
insert into stock values (10001, 3);
insert into stock values (10002, 3);
insert into stock values (10003, 3);
insert into stock values (10004, 3);
insert into stock values (10005, 3);
insert into stock values (10006, 3);
insert into stock values (10007, 3);
insert into stock values (10008, 3);
insert into stock values (10009, 3);
insert into stock values (10010, 3);
insert into stock values (10011, 3);
insert into stock values (10012, 3);
insert into stock values (10013, 3);
insert into stock values (10014, 3);
insert into stock values (10015, 3);



commit;

SELECT * FROM users;
SELECT * FROM product;
SELECT * FROM transaction;
SELECT * FROM stock;


