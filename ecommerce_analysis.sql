SELECT * 
FROM data_kaggle
LIMIT 10;

SELECT COUNT(*)
FROM data_kaggle;

SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM data_kaggle;

SELECT InvoiceDate, 
       SUM(Quantity * UnitPrice) AS revenue
FROM data_kaggle
GROUP BY InvoiceDate
ORDER BY InvoiceDate;

SELECT Description, 
       SUM(Quantity) AS total_sold
FROM data_kaggle
GROUP BY Description
ORDER BY total_sold DESC
LIMIT 10;

SELECT Country, 
       SUM(Quantity * UnitPrice) AS revenue
FROM data_kaggle
GROUP BY Country
ORDER BY revenue DESC;

SELECT CustomerID, 
       SUM(Quantity * UnitPrice) AS total_spent
FROM data_kaggle
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;