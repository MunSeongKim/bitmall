-- Queries about member table --
SELECT * FROM member;
SELECT id, name, birth, tel, phone, zipcode, address, email
		  FROM member
		 WHERE id='hong';
            
UPDATE member
   SET name='hong',
	   birth='0000-00-00',
	   tel='00-0000-0000',
	   phone='000-0000-0000',
	   zipcode='000-000',
	   address='admin',
	   email='admin@bitmall.com'
 WHERE id='hong';

-- Queries about product table --
SELECT * FROM product;

-- Queries about category table --
SELECT * FROM category;
DELETE FROM category;

-- Queries about option table --
SELECT * FROM `option`;

-- Queries about suboption table --
SELECT * FROM `suboption`;   
SELECT no, name, o_no
  FROM `suboption`
 WHERE o_no = 1;
 
-- Queries about product table --
SELECT * FROM `product`;

-- Queries about product_all_data VIEW --
  SELECT *
    FROM `product_all_data`
ORDER BY regDate DESC;

  SELECT *
    FROM `product_all_data`
   WHERE optionNo = 1
ORDER BY regDate DESC;  


-- Queries about cart table --
SELECT * FROM cart;
SELECT * FROM cart_suboption;

DELETE FROM cart_suboption;

SELECT *
  FROM v_cart
 WHERE u_Id='hong';
 
SELECT *
  FROM v_order_product
 WHERE suboptionNo=1;
 
 -- Queries about order table --
SELECT * FROM `order`;
 
SELECT * FROM v_inquire_order WHERE userId='hong';

SELECT * FROM `orderproduct`;

SELECT o.u_id AS userId, o.no AS orderNo, p.code AS productCode, p.image_path1 AS imagePath,
			p.name AS productName, opt.name AS optionName, so.name AS suboptionName,
            op_so.amount, p.price, p.discount
 	   FROM `orderproduct` AS op, `orderproduct_suboption` AS op_so, `suboption` AS so,
		    `product` AS p, `product_option` AS p_o, `option` AS opt, `order` AS o
	  WHERE op.o_no = op_so.o_no
	    AND op.p_code = op_so.p_code
	    AND op_so.so_no = so.no
	    AND op.p_code = p.code
	    AND p.code = p_o.p_code
	    AND p_o.o_no = opt.no
	    AND o.no = op.o_no;
   
SELECT * FROM v_info_order;
   
SELECT * FROM card;
INSERT INTO card
     VALUES(4, '1111-1111-1111-1111', 1, '12/12', '12', 9);
SELECT * FROM account;


SELECT * FROM v_admin_order_list;


SELECT state FROM `order` WHERE u_id='hong';
UPDATE `order` SET state='1' WHERE u_id='hong';