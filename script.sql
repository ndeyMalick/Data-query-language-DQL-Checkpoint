-- 1. All customers
SELECT *
FROM Customer;


-- 2. Products between 5000 and 10000
SELECT Product_Name, Category
FROM Product
WHERE Price BETWEEN 5000 AND 10000;


-- 3. Products sorted by descending price
SELECT *
FROM Product
ORDER BY Price DESC;


-- 4. Total, average, highest and lowest order amounts
SELECT
    COUNT(*) AS Total_Orders,
    AVG(Total_amount) AS Average_Amount,
    MAX(Total_amount) AS Highest_Amount,
    MIN(Total_amount) AS Lowest_Amount
FROM Orders;


-- 4b. Number of orders for each product
SELECT
    Product_id,
    COUNT(*) AS Number_Of_Orders
FROM Orders
GROUP BY Product_id;


-- 5. Customers with more than 2 orders
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;


-- 6. Number of orders for each month in 2020
SELECT
    TO_CHAR(OrderDate, 'MM') AS Month,
    COUNT(*) AS Number_Of_Orders
FROM Orders
WHERE OrderDate >= TO_DATE('01/01/2020', 'DD/MM/YYYY')
  AND OrderDate < TO_DATE('01/01/2021', 'DD/MM/YYYY')
GROUP BY TO_CHAR(OrderDate, 'MM')
ORDER BY Month;


-- 7. Product name, customer name and order date
SELECT
    p.Product_Name,
    c.Customer_Name,
    o.OrderDate
FROM Orders o
JOIN Product p
    ON o.Product_id = p.Product_id
JOIN Customer c
    ON o.Customer_id = c.Customer_id;


-- 8. Orders made three months ago
SELECT *
FROM Orders
WHERE OrderDate >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -3)
  AND OrderDate < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -2);


-- 9. Customers who never ordered
SELECT
    c.Customer_id,
    c.Customer_Name
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_id = o.Customer_id
WHERE o.Customer_id IS NULL;