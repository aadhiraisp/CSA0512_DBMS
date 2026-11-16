mysql> SELECT * FROM Sender;
+----------+------------+-------------+
| SenderID | SenderName | SenderPhone |
+----------+------------+-------------+
|        1 | Arun       | 9876543210  |
|        2 | Priya      | 9876543211  |
|        3 | Kavin      | 9876543212  |
|        4 | Ravi       | 9876543213  |
|        5 | Manoj      | 9876543214  |
+----------+------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Service;
+-----------+-------------+-------------------+
| ServiceID | ServiceCode | ServiceName       |
+-----------+-------------+-------------------+
|         1 | EXP01       | Express Delivery  |
|         2 | STD02       | Standard Delivery |
|         3 | ECO03       | Economy Delivery  |
|         4 | PRE04       | Premium Delivery  |
|         5 | SPE05       | Special Delivery  |
+-----------+-------------+-------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Coordinator;
+---------------+-----------------+
| CoordinatorID | CoordinatorName |
+---------------+-----------------+
|           101 | Kumar           |
|           102 | Suresh          |
|           103 | Ramesh          |
+---------------+-----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM CompletionPolicy;
+-----------------+----------------+
| CompletionValue | CompletionBand |
+-----------------+----------------+
|           35.00 | Low            |
|           38.00 | Low            |
|           39.00 | Medium         |
|           40.00 | Medium         |
|           45.00 | High           |
|           50.00 | High           |
+-----------------+----------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM ParcelObservation;
+----------+-----------+--------------+---------------+---------+------------+-----------------+-------------+
| SenderID | ServiceID | DispatchWave | CoordinatorID | ActorID | RouteGroup | CompletionValue | RouteFactor |
+----------+-----------+--------------+---------------+---------+------------+-----------------+-------------+
|        1 |         1 |            1 |           101 |       1 | RG1        |           45.00 |        1.20 |
|        1 |         2 |            2 |           102 |       1 | RG2        |           38.00 |        1.50 |
|        2 |         1 |            1 |           101 |       2 | RG1        |           40.00 |        1.20 |
|        2 |         2 |            2 |           103 |       2 | RG2        |           50.00 |        1.50 |
|        3 |         1 |            4 |           102 |       1 | RG1        |           35.00 |        1.20 |
|        3 |         3 |            4 |           103 |       2 | RG3        |           45.00 |        1.80 |
+----------+-----------+--------------+---------------+---------+------------+-----------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Tracking_Read_Card;
+----------+-----------+--------------+------------+-------------+-------------------+-----------------+---------+-----------------+----------------+-------------+
| SenderID | ServiceID | DispatchWave | SenderName | ServiceCode | ServiceName       | CoordinatorName | ActorID | CompletionValue | CompletionBand | RouteFactor |
+----------+-----------+--------------+------------+-------------+-------------------+-----------------+---------+-----------------+----------------+-------------+
|        1 |         1 |            1 | Arun       | EXP01       | Express Delivery  | Kumar           |       1 |           45.00 | High           |        1.20 |
|        1 |         2 |            2 | Arun       | STD02       | Standard Delivery | Suresh          |       1 |           38.00 | Low            |        1.50 |
|        2 |         1 |            1 | Priya      | EXP01       | Express Delivery  | Kumar           |       2 |           40.00 | Medium         |        1.20 |
|        2 |         2 |            2 | Priya      | STD02       | Standard Delivery | Ramesh          |       2 |           50.00 | High           |        1.50 |
|        3 |         1 |            4 | Kavin      | EXP01       | Express Delivery  | Suresh          |       1 |           35.00 | Low            |        1.20 |
|        3 |         3 |            4 | Kavin      | ECO03       | Economy Delivery  | Ramesh          |       2 |           45.00 | High           |        1.80 |
+----------+-----------+--------------+------------+-------------+-------------------+-----------------+---------+-----------------+----------------+-------------+
6 rows in set (0.00 sec)

