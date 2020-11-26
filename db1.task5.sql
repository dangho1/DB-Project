# 5.1
SELECT Description FROM DEPARTMENT WHERE Id = 0;

# 5.2
SELECT Title, Description
FROM DEPARTMENT
WHERE ParentId = 0;

# 5.3
SELECT Title, Price, Tax, Discount, Description
FROM PRODUCT
WHERE Id IN (Select ProductId FROM FEATURED);

# 5.4
DELIMITER $$
CREATE PROCEDURE get_keyword_related(IN produktensId INT)
BEGIN
	SELECT Title
	FROM PRODUCT
	WHERE Id IN
	(SELECT ProductId
	FROM PRODUCTKEYWORD
	WHERE Content IN
	(SELECT Content
	FROM PRODUCTKEYWORD
	WHERE ProductId = produktensId))
	AND Id != produktensId;  
END$$
DELIMITER ;

CALL get_keyword_related(2);


# 5.5
DELIMITER $$
CREATE PROCEDURE list_products(IN depId INT)
BEGIN
	SELECT Title, Description, Price, AVG(Stars)
	FROM PRODUCT LEFT JOIN REVIEW ON Id = ProductId
	WHERE DepartmentId = depId
    GROUP BY Title;
END$$
DELIMITER ;


# 5.6
SELECT Title, Description, Price, Tax, Discount
FROM PRODUCT
WHERE Discount > 0
ORDER BY Discount DESC;