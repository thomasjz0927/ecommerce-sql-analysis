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

WITH country_revenue AS (
    SELECT Country,
           SUM(CAST(Quantity AS INTEGER) * CAST(UnitPrice AS REAL)) AS revenue
    FROM data_kaggle
    GROUP BY Country
),
total_revenue AS (
    SELECT SUM(revenue) AS total FROM country_revenue
),
top_10 AS (
    SELECT *
    FROM country_revenue
    ORDER BY revenue DESC
    LIMIT 10
)
SELECT 
    t.Country,
    t.revenue,
    ROUND((t.revenue * 100.0) / tr.total, 2) AS percent_of_total,
    ROUND(
        (SELECT SUM(revenue) FROM top_10) * 100.0 / tr.total,
        2
    ) AS top10_total_percent
FROM top_10 t, total_revenue tr
ORDER BY t.revenue DESC;

SELECT 
    CustomerID,
    SUM(CAST(Quantity AS INTEGER) * CAST(UnitPrice AS REAL)) AS total_revenue
FROM data_kaggle
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 1;

SELECT Country,
       SUM(CAST(Quantity AS INTEGER) * CAST(UnitPrice AS REAL)) AS total_revenue
FROM data_kaggle
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 1;
