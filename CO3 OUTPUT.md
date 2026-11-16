mysql> -- Display Tables
mysql> SELECT * FROM Customer;
+------------+--------------+-------------------+
| CustomerID | CustomerName | CustomerEmail     |
+------------+--------------+-------------------+
| C01        | Arun         | arun@example.com  |
| C02        | Priya        | priya@example.com |
| C03        | Kavin        | kavin@example.com |
+------------+--------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Category;
+------------+--------------+
| CategoryID | CategoryName |
+------------+--------------+
| CAT1       | Drinkware    |
| CAT2       | Stationery   |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Supplier;
+------------+----------------+---------------+
| SupplierID | SupplierName   | SupplierPhone |
+------------+----------------+---------------+
| S01        | Alpha Supplies | 9000000001    |
| S02        | Beta Traders   | 9000000002    |
+------------+----------------+---------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Warehouse;
+-------------+---------------+
| WarehouseID | WarehouseCity |
+-------------+---------------+
| W1          | Chennai       |
| W2          | Salem         |
+-------------+---------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Product;
+-----------+-------------+-----------+------------+------------+
| ProductID | ProductName | UnitPrice | CategoryID | SupplierID |
+-----------+-------------+-----------+------------+------------+
| P10       | Bottle      |    250.00 | CAT1       | S01        |
| P20       | Notebook    |    100.00 | CAT2       | S02        |
| P30       | Pen         |     50.00 | CAT2       | S02        |
+-----------+-------------+-----------+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM OrderHeader;
+---------+------------+------------+---------------+----------+
| OrderID | OrderDate  | CustomerID | ShipStreet    | ShipCity |
+---------+------------+------------+---------------+----------+
| O101    | 2026-10-01 | C01        | 12 Lake Road  | Chennai  |
| O102    | 2026-10-02 | C02        | 8 Park Street | Salem    |
| O103    | 2026-10-03 | C03        | 4 Main Road   | Madurai  |
+---------+------------+------------+---------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM OrderItem;
+---------+-----------+----------+-------------+-----------+
| OrderID | ProductID | Quantity | WarehouseID | PricePaid |
+---------+-----------+----------+-------------+-----------+
| O101    | P10       |        2 | W1          |    250.00 |
| O101    | P20       |        1 | W2          |    100.00 |
| O102    | P10       |        1 | W1          |    240.00 |
| O102    | P20       |        3 | W2          |    100.00 |
| O103    | P20       |        2 | W2          |     95.00 |
| O103    | P30       |        1 | W2          |     50.00 |
+---------+-----------+----------+-------------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM ProductTag;
+-----------+----------+
| ProductID | Tag      |
+-----------+----------+
| P10       | BPA-free |
| P10       | Reusable |
| P20       | Ruled    |
| P30       | Fine-tip |
| P30       | Smooth   |
+-----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM ProductColour;
+-----------+--------+
| ProductID | Colour |
+-----------+--------+
| P10       | Blue   |
| P10       | Green  |
| P20       | White  |
| P30       | Black  |
+-----------+--------+
4 rows in set (0.00 sec)

mysql>
mysql> -- Check Duplicate Customer Details
mysql> SELECT CustomerID, COUNT(*)
    -> FROM Customer
    -> GROUP BY CustomerID
    -> HAVING COUNT(*) > 1;
Empty set (0.00 sec)

mysql>
mysql> -- Check Product Details
mysql> SELECT ProductID, ProductName, UnitPrice
    -> FROM Product;
+-----------+-------------+-----------+
| ProductID | ProductName | UnitPrice |
+-----------+-------------+-----------+
| P10       | Bottle      |    250.00 |
| P20       | Notebook    |    100.00 |
| P30       | Pen         |     50.00 |
+-----------+-------------+-----------+
3 rows in set (0.00 sec)

mysql>
mysql> -- Display Order Details
mysql> SELECT O.OrderID, O.OrderDate, C.CustomerName,
    ->        P.ProductName, I.Quantity, I.PricePaid
    -> FROM OrderHeader O
    -> JOIN Customer C ON O.CustomerID = C.CustomerID
    -> JOIN OrderItem I ON O.OrderID = I.OrderID
    -> JOIN Product P ON I.ProductID = P.ProductID;
+---------+------------+--------------+-------------+----------+-----------+
| OrderID | OrderDate  | CustomerName | ProductName | Quantity | PricePaid |
+---------+------------+--------------+-------------+----------+-----------+
| O101    | 2026-10-01 | Arun         | Bottle      |        2 |    250.00 |
| O101    | 2026-10-01 | Arun         | Notebook    |        1 |    100.00 |
| O102    | 2026-10-02 | Priya        | Bottle      |        1 |    240.00 |
| O102    | 2026-10-02 | Priya        | Notebook    |        3 |    100.00 |
| O103    | 2026-10-03 | Kavin        | Notebook    |        2 |     95.00 |
| O103    | 2026-10-03 | Kavin        | Pen         |        1 |     50.00 |
+---------+------------+--------------+-------------+----------+-----------+
6 rows in set (0.00 sec)

mysql>
mysql> -- Display Product and Supplier Details
mysql> SELECT P.ProductID, P.ProductName,
    ->        S.SupplierName, S.SupplierPhone
    -> FROM Product P
    -> JOIN Supplier S ON P.SupplierID = S.SupplierID;
+-----------+-------------+----------------+---------------+
| ProductID | ProductName | SupplierName   | SupplierPhone |
+-----------+-------------+----------------+---------------+
| P10       | Bottle      | Alpha Supplies | 9000000001    |
| P20       | Notebook    | Beta Traders   | 9000000002    |
| P30       | Pen         | Beta Traders   | 9000000002    |
+-----------+-------------+----------------+---------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- Display Product Tags
mysql> SELECT * FROM ProductTag;
+-----------+----------+
| ProductID | Tag      |
+-----------+----------+
| P10       | BPA-free |
| P10       | Reusable |
| P20       | Ruled    |
| P30       | Fine-tip |
| P30       | Smooth   |
+-----------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> -- Display Product Colours
mysql> SELECT * FROM ProductColour;
+-----------+--------+
| ProductID | Colour |
+-----------+--------+
| P10       | Blue   |
| P10       | Green  |
| P20       | White  |
| P30       | Black  |
+-----------+--------+
4 rows in set (0.00 sec)

mysql>
mysql> -- Create Indexes
mysql> CREATE INDEX idx_customer ON OrderHeader(CustomerID);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_product ON OrderItem(ProductID);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_orderdate ON OrderHeader(OrderDate);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Check Query Execution Plan
mysql> EXPLAIN SELECT * FROM OrderHeader
    -> WHERE CustomerID = 'C01';
+----+-------------+-------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | OrderHeader | NULL       | ref  | idx_customer  | idx_customer | 50      | const |    1 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql>
mysql> EXPLAIN SELECT * FROM OrderItem
    -> WHERE ProductID = 'P10';
+----+-------------+-----------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | OrderItem | NULL       | ref  | idx_product   | idx_product | 50      | const |    2 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql>
mysql> -- Create Product Price History
mysql> CREATE TABLE ProductPriceHistory (
    ->     PriceID INT AUTO_INCREMENT PRIMARY KEY,
    ->     ProductID VARCHAR(12) NOT NULL,
    ->     UnitPrice DECIMAL(10,2) NOT NULL,
    ->     ValidFrom DATE NOT NULL,
    ->     ValidTo DATE,
    ->     FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> -- Insert Price History
mysql> INSERT INTO ProductPriceHistory
    -> (ProductID, UnitPrice, ValidFrom, ValidTo)
    -> VALUES
    -> ('P10',250.00,'2026-09-01','2026-10-01'),
    -> ('P10',240.00,'2026-10-01',NULL),
    -> ('P20',100.00,'2026-09-01','2026-10-01'),
    -> ('P20',95.00,'2026-10-01',NULL);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Display Price History
mysql> SELECT * FROM ProductPriceHistory;
+---------+-----------+-----------+------------+------------+
| PriceID | ProductID | UnitPrice | ValidFrom  | ValidTo    |
+---------+-----------+-----------+------------+------------+
|       1 | P10       |    250.00 | 2026-09-01 | 2026-10-01 |
|       2 | P10       |    240.00 | 2026-10-01 | NULL       |
|       3 | P20       |    100.00 | 2026-09-01 | 2026-10-01 |
|       4 | P20       |     95.00 | 2026-10-01 | NULL       |
+---------+-----------+-----------+------------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> -- Display Actual Price Paid by Customers
mysql> SELECT O.OrderID, P.ProductName,
    ->        I.Quantity, I.PricePaid,
    ->        (I.Quantity * I.PricePaid) AS TotalAmount
    -> FROM OrderItem I
    -> JOIN OrderHeader O ON I.OrderID = O.OrderID
    -> JOIN Product P ON I.ProductID = P.ProductID;
+---------+-------------+----------+-----------+-------------+
| OrderID | ProductName | Quantity | PricePaid | TotalAmount |
+---------+-------------+----------+-----------+-------------+
| O101    | Bottle      |        2 |    250.00 |      500.00 |
| O101    | Notebook    |        1 |    100.00 |      100.00 |
| O102    | Bottle      |        1 |    240.00 |      240.00 |
| O102    | Notebook    |        3 |    100.00 |      300.00 |
| O103    | Notebook    |        2 |     95.00 |      190.00 |
| O103    | Pen         |        1 |     50.00 |       50.00 |
+---------+-------------+----------+-----------+-------------+
6 rows in set (0.01 sec)

mysql>
mysql> -- Update Product Price
mysql> UPDATE Product
    -> SET UnitPrice = 260.00
    -> WHERE ProductID = 'P10';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Delete a Product Tag
mysql> DELETE FROM ProductTag
    -> WHERE ProductID = 'P10' AND Tag = 'BPA-free';
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Final Table Display
mysql> SELECT * FROM Customer;
+------------+--------------+-------------------+
| CustomerID | CustomerName | CustomerEmail     |
+------------+--------------+-------------------+
| C01        | Arun         | arun@example.com  |
| C02        | Priya        | priya@example.com |
| C03        | Kavin        | kavin@example.com |
+------------+--------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Product;
+-----------+-------------+-----------+------------+------------+
| ProductID | ProductName | UnitPrice | CategoryID | SupplierID |
+-----------+-------------+-----------+------------+------------+
| P10       | Bottle      |    260.00 | CAT1       | S01        |
| P20       | Notebook    |    100.00 | CAT2       | S02        |
| P30       | Pen         |     50.00 | CAT2       | S02        |
+-----------+-------------+-----------+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM OrderHeader;
+---------+------------+------------+---------------+----------+
| OrderID | OrderDate  | CustomerID | ShipStreet    | ShipCity |
+---------+------------+------------+---------------+----------+
| O101    | 2026-10-01 | C01        | 12 Lake Road  | Chennai  |
| O102    | 2026-10-02 | C02        | 8 Park Street | Salem    |
| O103    | 2026-10-03 | C03        | 4 Main Road   | Madurai  |
+---------+------------+------------+---------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM OrderItem;
+---------+-----------+----------+-------------+-----------+
| OrderID | ProductID | Quantity | WarehouseID | PricePaid |
+---------+-----------+----------+-------------+-----------+
| O101    | P10       |        2 | W1          |    250.00 |
| O101    | P20       |        1 | W2          |    100.00 |
| O102    | P10       |        1 | W1          |    240.00 |
| O102    | P20       |        3 | W2          |    100.00 |
| O103    | P20       |        2 | W2          |     95.00 |
| O103    | P30       |        1 | W2          |     50.00 |
+---------+-----------+----------+-------------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM ProductPriceHistory;
