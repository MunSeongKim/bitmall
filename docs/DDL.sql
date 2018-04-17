-- 상품
ALTER TABLE `product`
	DROP FOREIGN KEY `FK_category_TO_product`; -- 카테고리 -> 상품

-- 서브옵션
ALTER TABLE `suboption`
	DROP FOREIGN KEY `FK_option_TO_suboption`; -- 옵션 -> 서브옵션

-- 장바구니
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_member_TO_cart`; -- 사용자 -> 장바구니2

-- 장바구니
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_product_TO_cart`; -- 상품 -> 장바구니

-- 주문
ALTER TABLE `order`
	DROP FOREIGN KEY `FK_member_TO_order`; -- 사용자 -> 주문

-- 주문상품
ALTER TABLE `orderproduct`
	DROP FOREIGN KEY `FK_order_TO_orderproduct`; -- 주문 -> 주문상품

-- 주문상품
ALTER TABLE `orderproduct`
	DROP FOREIGN KEY `FK_product_TO_orderproduct`; -- 상품 -> 주문상품

-- 게시판
ALTER TABLE `board`
	DROP FOREIGN KEY `FK_member_TO_board`; -- 사용자 -> 게시판

-- 카드
ALTER TABLE `card`
	DROP FOREIGN KEY `FK_order_TO_card`; -- 주문 -> 카드

-- 무통장
ALTER TABLE `account`
	DROP FOREIGN KEY `FK_order_TO_account`; -- 주문 -> 무통장

-- 상품_옵션
ALTER TABLE `product_option`
	DROP FOREIGN KEY `FK_product_TO_product_option`; -- 상품 -> 상품_옵션

-- 상품_옵션
ALTER TABLE `product_option`
	DROP FOREIGN KEY `FK_option_TO_product_option`; -- 옵션 -> 상품_옵션

-- 주문상_서브옵션
ALTER TABLE `orderproduct_suboption`
	DROP FOREIGN KEY `FK_orderproduct_TO_orderproduct_suboption`; -- 주문상품 -> 주문상_서브옵션

-- 주문상_서브옵션
ALTER TABLE `orderproduct_suboption`
	DROP FOREIGN KEY `FK_suboption_TO_orderproduct_suboption`; -- 서브옵션 -> 주문상_서브옵션

-- 장바구니_서브옵션
ALTER TABLE `cart_suboption`
	DROP FOREIGN KEY `FK_cart_TO_cart_suboption`; -- 장바구니 -> 장바구니_서브옵션

-- 장바구니_서브옵션
ALTER TABLE `cart_suboption`
	DROP FOREIGN KEY `FK_suboption_TO_cart_suboption`; -- 서브옵션 -> 장바구니_서브옵션

-- 사용자
DROP TABLE IF EXISTS `member` RESTRICT;

-- 상품
DROP TABLE IF EXISTS `product` RESTRICT;

-- 카테고리
DROP TABLE IF EXISTS `category` RESTRICT;

-- 옵션
DROP TABLE IF EXISTS `option` RESTRICT;

-- 서브옵션
DROP TABLE IF EXISTS `suboption` RESTRICT;

-- FAQ
DROP TABLE IF EXISTS `faqboard` RESTRICT;

-- 장바구니
DROP TABLE IF EXISTS `cart` RESTRICT;

-- 주문
DROP TABLE IF EXISTS `order` RESTRICT;

-- 주문상품
DROP TABLE IF EXISTS `orderproduct` RESTRICT;

-- 게시판
DROP TABLE IF EXISTS `board` RESTRICT;

-- 카드
DROP TABLE IF EXISTS `card` RESTRICT;

-- 무통장
DROP TABLE IF EXISTS `account` RESTRICT;

-- 상품_옵션
DROP TABLE IF EXISTS `product_option` RESTRICT;

-- 주문상_서브옵션
DROP TABLE IF EXISTS `orderproduct_suboption` RESTRICT;

-- 장바구니_서브옵션
DROP TABLE IF EXISTS `cart_suboption` RESTRICT;

-- 사용자
CREATE TABLE `member` (
	`id`       VARCHAR(20)          NOT NULL, -- 아이디
	`password` VARCHAR(64)          NOT NULL, -- 비밀번호
	`name`     VARCHAR(10)          NOT NULL, -- 이름
	`birth`    VARCHAR(10)          NULL,     -- 생일
	`tel`      VARCHAR(13)          NULL,     -- 전화번호
	`phone`    VARCHAR(13)          NOT NULL, -- 핸드폰번호
	`zipcode`  VARCHAR(7)           NOT NULL, -- 우편번호
	`address`  VARCHAR(100)         NOT NULL, -- 주소
	`email`    VARCHAR(50)          NOT NULL, -- 이메일
	`classify` ENUM('user','admin') NOT NULL, -- 구분
	`reg_date` DATE                 NULL      -- 가입일
);

-- 사용자
ALTER TABLE `member`
	ADD CONSTRAINT `PK_member` -- 사용자 기본키
		PRIMARY KEY (
			`id` -- 아이디
		);

-- 상품
CREATE TABLE `product` (
	`code`        VARCHAR(20)                        NOT NULL, -- 코드
	`name`        VARCHAR(100)                       NOT NULL, -- 이름
	`maker`       VARCHAR(50)                        NOT NULL, -- 생산자
	`price`       INTEGER                            NOT NULL, -- 가격
	`description` VARCHAR(256)                       NOT NULL, -- 설명
	`state`       ENUM('sale','not-sale','sold-out') NOT NULL, -- 상태
	`newItem`     BOOLEAN                            NULL     DEFAULT 0, -- 신상품
	`hitItem`     BOOLEAN                            NULL     DEFAULT 0, -- 히트상품
	`saleItem`    BOOLEAN                            NULL     DEFAULT 0, -- 세일상품
	`discount`    INTEGER                            NULL,     -- 할인율
	`image_path1` VARCHAR(100)                       NOT NULL, -- 이미지경로1
	`image_path2` VARCHAR(100)                       NOT NULL, -- 이미지경로2
	`image_path3` VARCHAR(100)                       NOT NULL, -- 이미지경로3
	`reg_date`    DATE                               NOT NULL, -- 등록일
	`c_no`        INTEGER                            NOT NULL  -- 카테고리_번호
);

-- 상품
ALTER TABLE `product`
	ADD CONSTRAINT `PK_product` -- 상품 기본키
		PRIMARY KEY (
			`code` -- 코드
		);

-- 카테고리
CREATE TABLE `category` (
	`no`         INTEGER      NOT NULL, -- 번호
	`name`       VARCHAR(50)  NOT NULL, -- 이름
	`image_path` VARCHAR(100) NOT NULL  -- 이미지경로
);

-- 카테고리
ALTER TABLE `category`
	ADD CONSTRAINT `PK_category` -- 카테고리 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `category`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- 옵션
CREATE TABLE `option` (
	`no`   INTEGER     NOT NULL, -- 번호
	`name` VARCHAR(50) NOT NULL  -- 이름
);

-- 옵션
ALTER TABLE `option`
	ADD CONSTRAINT `PK_option` -- 옵션 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `option`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- 서브옵션
CREATE TABLE `suboption` (
	`no`   INTEGER     NOT NULL, -- 번호
	`name` VARCHAR(50) NULL,     -- 이름
	`o_no` INTEGER     NULL      -- 옵션_번호
);

-- 서브옵션
ALTER TABLE `suboption`
	ADD CONSTRAINT `PK_suboption` -- 서브옵션 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `suboption`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- FAQ
CREATE TABLE `faqboard` (
	`no`      INTEGER      NOT NULL, -- 번호
	`title`   VARCHAR(50)  NOT NULL, -- 제목
	`content` VARCHAR(256) NOT NULL  -- 내용
);

-- FAQ
ALTER TABLE `faqboard`
	ADD CONSTRAINT `PK_faqboard` -- FAQ 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `faqboard`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- 장바구니
CREATE TABLE `cart` (
	`u_id`     VARCHAR(20) NOT NULL, -- 사용자_아이디
	`p_code`   VARCHAR(20) NOT NULL, -- 상품_코드
	`reg_date` DATE        NULL      -- 등록일
);

-- 장바구니
ALTER TABLE `cart`
	ADD CONSTRAINT `PK_cart` -- 장바구니 기본키
		PRIMARY KEY (
			`u_id`,   -- 사용자_아이디
			`p_code`  -- 상품_코드
		);

-- 주문
CREATE TABLE `order` (
	`no`        INTEGER                NOT NULL, -- 번호
	`o_name`    VARCHAR(10)            NOT NULL, -- 주문자이름
	`o_tel`     VARCHAR(13)            NOT NULL, -- 주문자전화번호
	`o_phone`   VARCHAR(13)            NOT NULL, -- 주문자휴대폰번호
	`o_email`   VARCHAR(50)            NOT NULL, -- 주문자이메일
	`o_zipcode` VARCHAR(7)             NULL,     -- 주문자우편번호
	`o_address` VARCHAR(100)           NOT NULL, -- 주문자주소
	`r_name`    VARCHAR(10)            NOT NULL, -- 수령자이름
	`r_tel`     VARCHAR(13)            NOT NULL, -- 수령자전화번호
	`r_phone`   VARCHAR(13)            NOT NULL, -- 수령자휴대폰번호
	`r_email`   VARCHAR(50)            NOT NULL, -- 수령자이메일
	`r_zipcode` VARCHAR(7)             NULL,     -- 수령자우편번호
	`r_address` VARCHAR(100)           NOT NULL, -- 수령자주소
	`require`   VARCHAR(256)           NOT NULL, -- 요구사항
	`pay_type`  ENUM('card','account') NOT NULL, -- 결제방식
	`state`     VARCHAR(10)            NOT NULL, -- 상태
	`tot_price` INTEGER                NOT NULL, -- 총금액
	`reg_date`  DATE                   NULL,     -- 주문일
	`u_id`      VARCHAR(20)            NOT NULL  -- 사용자_아이디
);

-- 주문
ALTER TABLE `order`
	ADD CONSTRAINT `PK_order` -- 주문 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `order`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- 주문상품
CREATE TABLE `orderproduct` (
	`o_no`   INTEGER     NOT NULL, -- 주문_번호
	`p_code` VARCHAR(20) NOT NULL, -- 상품_코드
	`amount` INTEGER     NOT NULL  -- 수량
);

-- 주문상품
ALTER TABLE `orderproduct`
	ADD CONSTRAINT `PK_orderproduct` -- 주문상품 기본키
		PRIMARY KEY (
			`o_no`,   -- 주문_번호
			`p_code`  -- 상품_코드
		);

-- 게시판
CREATE TABLE `board` (
	`no`       INTEGER       NOT NULL, -- 번호
	`title`    VARCHAR(100)  NOT NULL, -- 제목
	`name`     VARCHAR(20)   NOT NULL, -- 작성자
	`content`  VARCHAR(1024) NOT NULL, -- 내용
	`group_no` INTEGER       NOT NULL, -- 그룹번호
	`order_no` INTEGER       NOT NULL, -- 순서번호
	`depth`    INTEGER       NOT NULL, -- 계층
	`reg_date` DATE          NULL,     -- 등록일
	`u_id`     VARCHAR(20)   NULL      -- 사용자_아이디
);

-- 게시판
ALTER TABLE `board`
	ADD CONSTRAINT `PK_board` -- 게시판 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `board`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT;

-- 카드
CREATE TABLE `card` (
	`o_no`        INTEGER                    NOT NULL, -- 주문_번호
	`no`          VARCHAR(20)                NOT NULL, -- 번호
	`bank`        VARCHAR(10)                NOT NULL, -- 종류
	`due_date`    VARCHAR(8)                 NOT NULL, -- 기간
	`password`    INTEGER(2)                 NOT NULL, -- 비밀번호
	`installment` ENUM('0','3','6','9','12') NOT NULL  -- 할부
);

-- 카드
ALTER TABLE `card`
	ADD CONSTRAINT `PK_card` -- 카드 기본키
		PRIMARY KEY (
			`o_no` -- 주문_번호
		);

-- 무통장
CREATE TABLE `account` (
	`o_no` INTEGER     NOT NULL, -- 주문_번호
	`bank` VARCHAR(10) NOT NULL, -- 은행
	`name` VARCHAR(10) NOT NULL  -- 입금자이름
);

-- 무통장
ALTER TABLE `account`
	ADD CONSTRAINT `PK_account` -- 무통장 기본키
		PRIMARY KEY (
			`o_no` -- 주문_번호
		);

-- 상품_옵션
CREATE TABLE `product_option` (
	`p_code` VARCHAR(20) NOT NULL, -- 상품_코드
	`o_no`   INTEGER     NOT NULL  -- 옵션_번호
);

-- 상품_옵션
ALTER TABLE `product_option`
	ADD CONSTRAINT `PK_product_option` -- 상품_옵션 기본키
		PRIMARY KEY (
			`p_code`, -- 상품_코드
			`o_no`    -- 옵션_번호
		);

-- 주문상_서브옵션
CREATE TABLE `orderproduct_suboption` (
	`o_no`   INTEGER     NOT NULL, -- 주문_번호
	`p_code` VARCHAR(20) NOT NULL, -- 상품_코드
	`so_no`  INTEGER     NOT NULL  -- 서브옵션_번호
);

-- 주문상_서브옵션
ALTER TABLE `orderproduct_suboption`
	ADD CONSTRAINT `PK_orderproduct_suboption` -- 주문상_서브옵션 기본키
		PRIMARY KEY (
			`o_no`,   -- 주문_번호
			`p_code`, -- 상품_코드
			`so_no`   -- 서브옵션_번호
		);

-- 장바구니_서브옵션
CREATE TABLE `cart_suboption` (
	`u_id`   VARCHAR(20) NOT NULL, -- 사용자_아이디
	`p_code` VARCHAR(20) NOT NULL, -- 상품_코드
	`so_no`  INTEGER     NOT NULL, -- 서브옵션_번호
	`amount` INTEGER     NULL      -- 수량
);

-- 장바구니_서브옵션
ALTER TABLE `cart_suboption`
	ADD CONSTRAINT `PK_cart_suboption` -- 장바구니_서브옵션 기본키
		PRIMARY KEY (
			`u_id`,   -- 사용자_아이디
			`p_code`, -- 상품_코드
			`so_no`   -- 서브옵션_번호
		);

-- 상품
ALTER TABLE `product`
	ADD CONSTRAINT `FK_category_TO_product` -- 카테고리 -> 상품
		FOREIGN KEY (
			`c_no` -- 카테고리_번호
		)
		REFERENCES `category` ( -- 카테고리
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 서브옵션
ALTER TABLE `suboption`
	ADD CONSTRAINT `FK_option_TO_suboption` -- 옵션 -> 서브옵션
		FOREIGN KEY (
			`o_no` -- 옵션_번호
		)
		REFERENCES `option` ( -- 옵션
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 장바구니
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_member_TO_cart` -- 사용자 -> 장바구니2
		FOREIGN KEY (
			`u_id` -- 사용자_아이디
		)
		REFERENCES `member` ( -- 사용자
			`id` -- 아이디
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 장바구니
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_product_TO_cart` -- 상품 -> 장바구니
		FOREIGN KEY (
			`p_code` -- 상품_코드
		)
		REFERENCES `product` ( -- 상품
			`code` -- 코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 주문
ALTER TABLE `order`
	ADD CONSTRAINT `FK_member_TO_order` -- 사용자 -> 주문
		FOREIGN KEY (
			`u_id` -- 사용자_아이디
		)
		REFERENCES `member` ( -- 사용자
			`id` -- 아이디
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 주문상품
ALTER TABLE `orderproduct`
	ADD CONSTRAINT `FK_order_TO_orderproduct` -- 주문 -> 주문상품
		FOREIGN KEY (
			`o_no` -- 주문_번호
		)
		REFERENCES `order` ( -- 주문
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 주문상품
ALTER TABLE `orderproduct`
	ADD CONSTRAINT `FK_product_TO_orderproduct` -- 상품 -> 주문상품
		FOREIGN KEY (
			`p_code` -- 상품_코드
		)
		REFERENCES `product` ( -- 상품
			`code` -- 코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 게시판
ALTER TABLE `board`
	ADD CONSTRAINT `FK_member_TO_board` -- 사용자 -> 게시판
		FOREIGN KEY (
			`u_id` -- 사용자_아이디
		)
		REFERENCES `member` ( -- 사용자
			`id` -- 아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 카드
ALTER TABLE `card`
	ADD CONSTRAINT `FK_order_TO_card` -- 주문 -> 카드
		FOREIGN KEY (
			`o_no` -- 주문_번호
		)
		REFERENCES `order` ( -- 주문
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 무통장
ALTER TABLE `account`
	ADD CONSTRAINT `FK_order_TO_account` -- 주문 -> 무통장
		FOREIGN KEY (
			`o_no` -- 주문_번호
		)
		REFERENCES `order` ( -- 주문
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품_옵션
ALTER TABLE `product_option`
	ADD CONSTRAINT `FK_product_TO_product_option` -- 상품 -> 상품_옵션
		FOREIGN KEY (
			`p_code` -- 상품_코드
		)
		REFERENCES `product` ( -- 상품
			`code` -- 코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품_옵션
ALTER TABLE `product_option`
	ADD CONSTRAINT `FK_option_TO_product_option` -- 옵션 -> 상품_옵션
		FOREIGN KEY (
			`o_no` -- 옵션_번호
		)
		REFERENCES `option` ( -- 옵션
			`no` -- 번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 주문상_서브옵션
ALTER TABLE `orderproduct_suboption`
	ADD CONSTRAINT `FK_orderproduct_TO_orderproduct_suboption` -- 주문상품 -> 주문상_서브옵션
		FOREIGN KEY (
			`o_no`,   -- 주문_번호
			`p_code`  -- 상품_코드
		)
		REFERENCES `orderproduct` ( -- 주문상품
			`o_no`,   -- 주문_번호
			`p_code`  -- 상품_코드
		)
		ON DELETE CASCADE;

-- 주문상_서브옵션
ALTER TABLE `orderproduct_suboption`
	ADD CONSTRAINT `FK_suboption_TO_orderproduct_suboption` -- 서브옵션 -> 주문상_서브옵션
		FOREIGN KEY (
			`so_no` -- 서브옵션_번호
		)
		REFERENCES `suboption` ( -- 서브옵션
			`no` -- 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 장바구니_서브옵션
ALTER TABLE `cart_suboption`
	ADD CONSTRAINT `FK_cart_TO_cart_suboption` -- 장바구니 -> 장바구니_서브옵션
		FOREIGN KEY (
			`u_id`,   -- 사용자_아이디
			`p_code`  -- 상품_코드
		)
		REFERENCES `cart` ( -- 장바구니
			`u_id`,   -- 사용자_아이디
			`p_code`  -- 상품_코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 장바구니_서브옵션
ALTER TABLE `cart_suboption`
	ADD CONSTRAINT `FK_suboption_TO_cart_suboption` -- 서브옵션 -> 장바구니_서브옵션
		FOREIGN KEY (
			`so_no` -- 서브옵션_번호
		)
		REFERENCES `suboption` ( -- 서브옵션
			`no` -- 번호
		)
		ON DELETE NO ACTION
		ON UPDATE CASCADE;