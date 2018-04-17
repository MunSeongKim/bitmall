DROP VIEW v_product;
DROP VIEW v_cart;
DROP VIEW v_order_product;
DROP VIEW v_inquire_order;
DROP VIEW v_info_order;
DROP VIEW v_admin_order_list;

-- 초기 데이터 삽입 (member, category, option, suboption)
INSERT INTO member
     VALUES('admin',
			PASSWORD('admin'),
            '관리자',
            '0000-00-00',
            '00-0000-0000',
            '000-0000-0000',
            '000-000',
            'admin',
            'admin@bitmall.com',
            'admin',
            DATE_FORMAT(NOW(), '%Y-%m-%d'));
INSERT INTO member
     VALUES('hong',
			PASSWORD('123'),
            '홍길동',
            '1982-03-01',
            '02-1234-5678',
            '010-1234-5678',
            '464-545',
            '서울시 강남구 역삼동',
            'hong@cafe24.com',
            'user',
            DATE_FORMAT(NOW(), '%Y-%m-%d'));

ALTER TABLE category AUTO_INCREMENT=1;

INSERT INTO category
	 VALUES (1, 'NIKE', '/product/images/logo/nike.png');
INSERT INTO category
	 VALUES (null, 'ADIDAS', '/product/images/logo/adidas.png');
INSERT INTO category
	 VALUES (null, 'FILA', '/product/images/logo/fila.png');

INSERT INTO `option`
	 VALUES (null, '사이즈');
INSERT INTO `option`
	 VALUES (null, '성별');
     
INSERT INTO `suboption`
	 VALUES (null, '210', 1);
INSERT INTO `suboption`
	 VALUES (null, '215', 1);
INSERT INTO `suboption`
	 VALUES (null, '220', 1);
INSERT INTO `suboption`
	 VALUES (null, '225', 1);
INSERT INTO `suboption`
	 VALUES (null, '230', 1);
INSERT INTO `suboption`
	 VALUES (null, '235', 1);
INSERT INTO `suboption`
	 VALUES (null, '240', 1);
INSERT INTO `suboption`
	 VALUES (null, '245', 1);
INSERT INTO `suboption`
	 VALUES (null, '250', 1);

INSERT INTO `suboption`
	 VALUES (null, 'Men', 2);
INSERT INTO `suboption`
	 VALUES (null, 'Women', 2);
INSERT INTO `suboption`
	 VALUES (null, 'Unisex', 2);
     
-- VIEW 시작
CREATE VIEW v_product AS (
	 SELECT p.code,	p.name, p.maker, p.price, p.description,
			p.state, p.newItem, p.hitItem, p.saleItem, p.discount,
			p.image_path1 AS imagePath1, p.image_path2 AS imagePath2,
            p.image_path3 AS imagePath3, p.reg_date AS regDate,
            p.c_no AS categoryNo, po.o_no AS optionNo,
            c.name AS categoryName, o.name AS optionName
       FROM product AS p, category AS c, `option` AS o, product_option AS po
	  WHERE p.c_no = c.no
        AND p.code = po.p_code
        AND po.o_no = o.no
   ORDER BY regDate DESC );

CREATE VIEW v_cart AS (
	 SELECT c.u_id, c.p_code AS productCode, cs.so_no AS suboptionNo,
		    vp.name AS productName, vp.imagePath1 AS imagePath,
            vp.optionName,
            vp.price, so.name AS suboptionName, cs.amount,
 		    c.reg_date AS regDate
	   FROM cart AS c, cart_suboption AS cs, suboption AS so, v_product AS vp
	  WHERE c.u_id=cs.u_id
	    AND c.p_code=cs.p_code
	    AND cs.so_no=so.no
	    AND c.p_code=vp.code
   ORDER BY regDate DESC );
   
CREATE VIEW v_order_product AS (
     SELECT p.code AS productCode, so.no AS suboptionNo,
	        p.name AS productName, p.image_path1 AS imagePath,
			o.name AS optionName, p.price AS price,
			so.name AS suboptionName
	   FROM product AS p, product_option AS po, `option` AS o, suboption AS so
      WHERE p.code = po.p_code
	    AND po.o_no = o.no
        AND o.no = so.o_no);
        
CREATE VIEW v_inquire_order AS (
	 SELECT o.u_id AS userId, o.reg_date AS regDate,
		    o.no, p.name, o.tot_price AS totPrice, o.state,
            COUNT(*) AS count
	   FROM `order` AS o, `orderproduct` AS op, `product` AS p, `orderproduct_suboption` AS op_so
	  WHERE o.no = op.o_no
		AND op.p_code = p.code
        AND op_so.o_no = op.o_no
        AND op_so.p_code = op.p_code
   GROUP BY o.no
   ORDER BY regDate DESC);
   
CREATE VIEW v_info_order AS (
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
	    AND o.no = op.o_no
);

CREATE VIEW v_admin_order_list AS (
	 SELECT o.no AS orderNo, o.reg_date AS regDate,
	        p.name AS productName, o.tot_price AS totPrice,
            o.o_name AS orderName, o.pay_type AS payType, o.state,
            COUNT(*) AS count
	   FROM `order` AS o, `orderproduct` AS op, `product` AS p, `orderproduct_suboption` AS op_so
	  WHERE o.no = op.o_no
		AND op.p_code = p.code
        AND op_so.o_no = op.o_no
        AND op_so.p_code = op.p_code
   GROUP BY o.no
   ORDER BY regDate DESC);
