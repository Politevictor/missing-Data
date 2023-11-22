

--  where customer_id is null

SELECT *  FROM orders
WHERE customer_id IS NULL;

DELETE  FROM orders
WHERE order_id IN (SELECT O.order_id  FROM ( SELECT order_id FROM orders
WHERE customer_id IS NULL) AS O);


-- where order_date is null -- 

UPDATE  orders
	SET order_date = (
    SELECT MAX(D.order_date)
    FROM (SELECT order_date FROM orders
	WHERE order_date IS NOT NULL
	) AS D)
WHERE order_date IS NULL AND order_id IN (SELECT P.order_id FROM (SELECT order_id FROM orders WHERE order_date IS NULL)AS P);


-- where amount is null  

SELECT AVG(amount) FROM orders
	WHERE amount IS NOT NULL;
    
UPDATE  orders
	SET amount = (SELECT AVG(B.amount) FROM  (SELECT amount FROM orders WHERE amount IS NOT NULL) AS B)
WHERE order_id  IN (SELECT A.order_id FROM (SELECT order_id FROM orders  WHERE amount IS NULL) AS A)  ;


    
-- add 2hours to order_date to get delivery_date where its null 

SELECT * FROM orders 
WHERE delivery_date IS NULL;
    
UPDATE orders 
	SET delivery_date = DATE_ADD(order_date,  INTERVAL 2 HOUR)
WHERE order_id IN (16, 27, 35, 81);
    

  
-- use the last delivery_location of the customer_id where delivery_location is null
   
SELECT * FROM orders WHERE delivery_location IS NULL;
   
     UPDATE orders 
		SET delivery_location = 
			(SELECT L.delivery_location 
            FROM (SELECT delivery_location FROM  orders WHERE customer_id = 16 
            AND delivery_location IS NOT NULL 
            ORDER BY order_date DESC LIMIT 1) AS L)
	WHERE order_id = 22;
	UPDATE orders 
		SET delivery_location = 
			(SELECT L.delivery_location 
            FROM (SELECT delivery_location FROM  orders WHERE customer_id = 4
            AND delivery_location IS NOT NULL 
            ORDER BY order_date DESC LIMIT 1) AS L)
	WHERE order_id = 30;
    UPDATE orders 
		SET delivery_location = 
			(SELECT L.delivery_location 
            FROM (SELECT delivery_location FROM  orders WHERE customer_id = 1
            AND delivery_location IS NOT NULL 
            ORDER BY order_date DESC LIMIT 1) AS L)
	WHERE order_id = 49;
    UPDATE orders 
		SET delivery_location = 
			(SELECT L.delivery_location 
            FROM (SELECT delivery_location FROM  orders WHERE customer_id = 7
            AND delivery_location IS NOT NULL 
            ORDER BY order_date DESC LIMIT 1) AS L)
	WHERE order_id = 78;
    UPDATE orders 
		SET delivery_location = 
			(SELECT L.delivery_location 
            FROM (SELECT delivery_location FROM  orders WHERE customer_id = 11
            AND delivery_location IS NOT NULL 
            ORDER BY order_date DESC LIMIT 1) AS L)
	WHERE order_id = 88;
    
    

-- use debit card where payment_method is null
   
SELECT * FROM orders WHERE payment_method IS NULL;
	
UPDATE orders
	SET payment_method = 'debit card'
WHERE payment_method IS NULL AND order_id IN 
	(SELECT P.order_id FROM (SELECT order_id 
    FROM orders WHERE payment_method IS NOT) AS P);
        
        



  