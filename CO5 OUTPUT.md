mysql>
mysql> DELIMITER ;
mysql>
mysql> -- ==========================================
mysql> -- 6. EXECUTE WATER TOKEN TRANSFER
mysql> -- ==========================================
mysql>
mysql> CALL Move_Water_Tokens(
    ->     'REQ001', 101, 1, 2, 50
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CALL Move_Water_Tokens(
    ->     'REQ002', 102, 2, 3, 100
    -> );
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> CALL Move_Water_Tokens(
    ->     'REQ003', 103, 3, 4, 75
    -> );
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 7. DISPLAY UPDATED BALANCES
mysql> -- ==========================================
mysql>
mysql> SELECT * FROM Canal_Pool;
+---------+-------------+---------+
| Pool_ID | Pool_Name   | Balance |
+---------+-------------+---------+
|       1 | North Canal |     950 |
|       2 | South Canal |     950 |
|       3 | East Canal  |    1025 |
|       4 | West Canal  |    1075 |
+---------+-------------+---------+
4 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 8. DISPLAY FARM DAILY USAGE
mysql> -- ==========================================
mysql>
mysql> SELECT * FROM Farm_Usage;
+---------+------------+-------------+
| Farm_ID | Usage_Date | Used_Tokens |
+---------+------------+-------------+
|     101 | 2026-11-22 |          50 |
|     102 | 2026-11-22 |         100 |
|     103 | 2026-11-22 |          75 |
+---------+------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 9. DISPLAY DELIVERY HISTORY
mysql> -- ==========================================
mysql>
mysql> SELECT * FROM Delivery;
+------------+---------+-------------+------------------+--------+---------------+-----------+
| Request_ID | Farm_ID | Source_Pool | Destination_Pool | Tokens | Delivery_Date | Status    |
+------------+---------+-------------+------------------+--------+---------------+-----------+
| REQ001     |     101 |           1 |                2 |     50 | 2026-11-22    | COMPLETED |
| REQ002     |     102 |           2 |                3 |    100 | 2026-11-22    | COMPLETED |
| REQ003     |     103 |           3 |                4 |     75 | 2026-11-22    | COMPLETED |
+------------+---------+-------------+------------------+--------+---------------+-----------+
3 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 10. TRANSACTION ROLLBACK EXAMPLE
mysql> -- ==========================================
mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Canal_Pool
    -> SET Balance = Balance - 100
    -> WHERE Pool_ID = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT * FROM Canal_Pool;
+---------+-------------+---------+
| Pool_ID | Pool_Name   | Balance |
+---------+-------------+---------+
|       1 | North Canal |     950 |
|       2 | South Canal |     950 |
|       3 | East Canal  |    1025 |
|       4 | West Canal  |    1075 |
+---------+-------------+---------+
4 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 11. COMMIT EXAMPLE
mysql> -- ==========================================
mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Canal_Pool
    -> SET Balance = Balance + 25
    -> WHERE Pool_ID = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> SELECT * FROM Canal_Pool;
+---------+-------------+---------+
| Pool_ID | Pool_Name   | Balance |
+---------+-------------+---------+
|       1 | North Canal |     950 |
|       2 | South Canal |     975 |
|       3 | East Canal  |    1025 |
|       4 | West Canal  |    1075 |
+---------+-------------+---------+
4 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 12. CHECK TOKEN CONSERVATION
mysql> -- ==========================================
mysql>
mysql> SELECT SUM(Balance) AS Total_Water_Tokens
    -> FROM Canal_Pool;
+--------------------+
| Total_Water_Tokens |
+--------------------+
|               4025 |
+--------------------+
1 row in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 13. CHECK FARM DAILY LIMIT
mysql> -- ==========================================
mysql>
mysql> SELECT
    ->     F.Farm_Name,
    ->     F.Daily_Ceiling,
    ->     COALESCE(U.Used_Tokens, 0) AS Used_Tokens,
    ->     F.Daily_Ceiling -
    ->     COALESCE(U.Used_Tokens, 0) AS Remaining_Tokens
    -> FROM Farm F
    -> LEFT JOIN Farm_Usage U
    -> ON F.Farm_ID = U.Farm_ID
    -> AND U.Usage_Date = CURDATE();
+-----------+---------------+-------------+------------------+
| Farm_Name | Daily_Ceiling | Used_Tokens | Remaining_Tokens |
+-----------+---------------+-------------+------------------+
| Farm A    |           200 |          50 |              150 |
| Farm B    |           300 |         100 |              200 |
| Farm C    |           250 |          75 |              175 |
+-----------+---------------+-------------+------------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 14. REPORT GENERATION
mysql> -- ==========================================
mysql>
mysql> SELECT
    ->     P.Pool_Name,
    ->     P.Balance
    -> FROM Canal_Pool P
    -> ORDER BY P.Pool_ID;
+-------------+---------+
| Pool_Name   | Balance |
+-------------+---------+
| North Canal |     950 |
| South Canal |     975 |
| East Canal  |    1025 |
| West Canal  |    1075 |
+-------------+---------+
4 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 15. DELIVERY SUMMARY
mysql> -- ==========================================
mysql>
mysql> SELECT
    ->     Status,
    ->     COUNT(*) AS Total_Deliveries,
    ->     SUM(Tokens) AS Total_Tokens
    -> FROM Delivery
    -> GROUP BY Status;
+-----------+------------------+--------------+
| Status    | Total_Deliveries | Total_Tokens |
+-----------+------------------+--------------+
| COMPLETED |                3 |          225 |
+-----------+------------------+--------------+
1 row in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 16. TOTAL FARM ALLOCATION
mysql> -- ==========================================
mysql>
mysql> SELECT
    ->     F.Farm_Name,
    ->     SUM(D.Tokens) AS Total_Allocated
    -> FROM Farm F
    -> LEFT JOIN Delivery D
    -> ON F.Farm_ID = D.Farm_ID
    -> GROUP BY F.Farm_ID, F.Farm_Name;
+-----------+-----------------+
| Farm_Name | Total_Allocated |
+-----------+-----------------+
| Farm A    |              50 |
| Farm B    |             100 |
| Farm C    |              75 |
+-----------+-----------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 17. CHECK DUPLICATE REQUESTS
mysql> -- ==========================================
mysql>
mysql> SELECT Request_ID, COUNT(*)
    -> FROM Delivery
    -> GROUP BY Request_ID
    -> HAVING COUNT(*) > 1;
Empty set (0.00 sec)

mysql>
mysql> -- ==========================================
mysql> -- 18. FINAL DATABASE REPORT
mysql> -- ==========================================
mysql>
mysql> SELECT 'CANAL POOL DETAILS' AS Report;
+--------------------+
| Report             |
+--------------------+
| CANAL POOL DETAILS |
+--------------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT * FROM Canal_Pool;
+---------+-------------+---------+
| Pool_ID | Pool_Name   | Balance |
+---------+-------------+---------+
|       1 | North Canal |     950 |
|       2 | South Canal |     975 |
|       3 | East Canal  |    1025 |
|       4 | West Canal  |    1075 |
+---------+-------------+---------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT 'FARM DETAILS' AS Report;
+--------------+
| Report       |
+--------------+
| FARM DETAILS |
+--------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT * FROM Farm;
+---------+-----------+---------------+
| Farm_ID | Farm_Name | Daily_Ceiling |
+---------+-----------+---------------+
|     101 | Farm A    |           200 |
|     102 | Farm B    |           300 |
|     103 | Farm C    |           250 |
+---------+-----------+---------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT 'FARM USAGE DETAILS' AS Report;
+--------------------+
| Report             |
+--------------------+
| FARM USAGE DETAILS |
+--------------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT * FROM Farm_Usage;
+---------+------------+-------------+
| Farm_ID | Usage_Date | Used_Tokens |
+---------+------------+-------------+
|     101 | 2026-11-22 |          50 |
|     102 | 2026-11-22 |         100 |
|     103 | 2026-11-22 |          75 |
+---------+------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT 'DELIVERY DETAILS' AS Report;
+------------------+
| Report           |
+------------------+
| DELIVERY DETAILS |
+------------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT * FROM Delivery;
+------------+---------+-------------+------------------+--------+---------------+-----------+
| Request_ID | Farm_ID | Source_Pool | Destination_Pool | Tokens | Delivery_Date | Status    |
+------------+---------+-------------+------------------+--------+---------------+-----------+
| REQ001     |     101 |           1 |                2 |     50 | 2026-11-22    | COMPLETED |
| REQ002     |     102 |           2 |                3 |    100 | 2026-11-22    | COMPLETED |
| REQ003     |     103 |           3 |                4 |     75 | 2026-11-22    | COMPLETED |
+------------+---------+-------------+------------------+--------+---------------+-----------+
3 rows in set (0.00 sec)
