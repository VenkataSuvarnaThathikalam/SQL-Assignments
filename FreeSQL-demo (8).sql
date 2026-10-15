CREATE TABLE products
(
    product_id    NUMBER PRIMARY KEY,
    product_name  VARCHAR2(50),
    price         NUMBER,
    stock         NUMBER
);

-- 2. CREATE SALES TABLE


CREATE TABLE sales
(
    sale_id       NUMBER PRIMARY KEY,
    product_id    NUMBER,
    quantity      NUMBER,
    total_amount  NUMBER
);

INSERT INTO products VALUES (101, 'Laptop', 50000, 20);
INSERT INTO products VALUES (102, 'Mobile', 25000, 30);
INSERT INTO products VALUES (103, 'Headphones', 2000, 50);
INSERT INTO products VALUES (104, 'Keyboard', 1500, 40);
INSERT INTO products VALUES (105, 'Mouse', 800, 60);

COMMIT;


CREATE OR REPLACE PROCEDURE add_product
(
    p_id    IN NUMBER,
    p_name  IN VARCHAR2,
    p_price IN NUMBER,
    p_stock IN NUMBER
)
AS
BEGIN

    INSERT INTO products
    VALUES (p_id, p_name, p_price, p_stock);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Product Added');

END;
/


-- CALL PROCEDURE

BEGIN
    add_product(106, 'Monitor', 12000, 10);
END;
/


CREATE OR REPLACE PROCEDURE update_price
(
    p_id        IN NUMBER,
    p_new_price IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET price = p_new_price
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Price Updated');

END;
/


-- CALL PROCEDURE

BEGIN
    update_price(101, 55000);
END;
/


CREATE OR REPLACE PROCEDURE add_stock
(
    p_id       IN NUMBER,
    p_quantity IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET stock = stock + p_quantity
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Stock Added');

END;
/


-- CALL PROCEDURE

BEGIN
    add_stock(101, 10);
END;
/

CREATE OR REPLACE PROCEDURE make_sale
(
    p_sale_id    IN NUMBER,
    p_product_id IN NUMBER,
    p_quantity   IN NUMBER
)
AS

    v_price NUMBER;
    v_total NUMBER;

BEGIN

    SELECT price
    INTO v_price
    FROM products
    WHERE product_id = p_product_id;


    v_total := v_price * p_quantity;


    INSERT INTO sales
    VALUES
    (
        p_sale_id,
        p_product_id,
        p_quantity,
        v_total
    );


    UPDATE products
    SET stock = stock - p_quantity
    WHERE product_id = p_product_id;


    COMMIT;


    DBMS_OUTPUT.PUT_LINE('Sale Completed');

    DBMS_OUTPUT.PUT_LINE(
        'Total Amount = ' || v_total
    );

END;
/


-- CALL PROCEDURE

BEGIN
    make_sale(1001, 101, 2);
END;
/


CREATE OR REPLACE PROCEDURE apply_discount
(
    p_id       IN NUMBER,
    p_discount IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET price = price - (price * p_discount / 100)
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Discount Applied');

END;
/
BEGIN
    apply_discount(101, 10);
END;
/
CREATE OR REPLACE PROCEDURE update_stock
(
    p_id        IN NUMBER,
    p_new_stock IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Stock Updated');

END;
/


-- CALL PROCEDURE

BEGIN
    update_stock(102, 100);
END;
/
CREATE OR REPLACE PROCEDURE update_stock
(
    p_id        IN NUMBER,
    p_new_stock IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Stock Updated');

END;
/


-- CALL PROCEDURE

BEGIN
    update_stock(102, 100);
END;
/

CREATE OR REPLACE PROCEDURE update_stock
(
    p_id        IN NUMBER,
    p_new_stock IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Stock Updated');

END;
/


-- CALL PROCEDURE

BEGIN
    update_stock(102, 100);
END;
/
CREATE OR REPLACE PROCEDURE update_stock
(
    p_id        IN NUMBER,
    p_new_stock IN NUMBER
)
AS
BEGIN

    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Stock Updated');

END;
/


-- CALL PROCEDURE

BEGIN
    update_stock(102, 100);
END;
/

SELECT *
FROM products;

SELECT *
FROM sales;


CREATE OR REPLACE PROCEDURE procedure_name
 (
     parameter IN datatype
 )
 AS
 BEGIN

     SQL STATEMENT;

 END;
/


BEGIN
     procedure_name(value);
 END;
/