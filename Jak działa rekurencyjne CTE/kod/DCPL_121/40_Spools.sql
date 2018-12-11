USE AdventureWorks2012;
GO

-- Table spool
SELECT
    sp.BusinessEntityID,
    sp.TerritoryID,
    (
        SELECT
            SUM(soh.TaxAmt)
        FROM Sales.SalesOrderHeader soh
        WHERE soh.TerritoryID = sp.TerritoryID
    )
FROM Sales.SalesPerson sp
;

-- Index Spool
SELECT
    p.Name,
    p.ProductSubcategoryID,
    p.ListPrice,
    ps.*
FROM Production.Product p

    CROSS APPLY (
        SELECT
            MinPrice    = MIN(p1.ListPrice),
            MaxPrice    = MAX(p1.ListPrice),
            AvgPrice    = AVG(p1.ListPrice)
        FROM Production.Product p1
        WHERE p1.ProductSubcategoryID = p.ProductSubcategoryID
    ) ps
WHERE p.ProductSubcategoryID IS NOT NULL
;

-- Row Count Spool
SELECT
    CustomerID,
    DueDate,
    TotalDue
FROM Sales.SalesOrderHeader
WHERE NOT EXISTS (
    SELECT *
    FROM Sales.SalesOrderDetail
    WHERE UnitPrice = 200
)
;