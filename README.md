## Objective
Analyze transactional e-commerce data to uncover insights about revenue, customers, and product performance.

---

## Dataset
- Source: Kaggle
- Columns: InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

---

## Key Questions
1. What is total revenue?
2. Which consumer has the biggest revenue?
3. Which products sell the most?
4. Which customers generate the most revenue?
5. How much of the revenue goes through the top 10 countries?

---

## Key Insights
- The total revenue is $9747747.934
- The United Kingdom has the most revenue with $8187806.364
- WORLD WAR 2 GLIDERS ASSTD DESIGNS sell the most
- Customer 14646 drives the most sales
- 97.26% of revenue goes throguh the top 10 countries

---

## SQL Techniques Used
- Aggregations (`SUM`, `COUNT`)
- `GROUP BY`
- `ORDER BY`
- Filtering (`WHERE`)
- Data type casting

---

## Example Query
```sql
SELECT Country, 
       SUM(CAST(Quantity AS INTEGER) * CAST(UnitPrice AS REAL)) AS revenue
FROM data_kaggle
GROUP BY Country
ORDER BY revenue DESC;
