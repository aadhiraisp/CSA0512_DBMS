+---------+----------------+-----------+-------------+-------------+
| loan_id | loan_reference | lender_id | custody_end | loan_status |
+---------+----------------+-----------+-------------+-------------+
|      28 | LN-000000028   |      1008 | 2026-02-08  | OPEN        |
|       1 | LN-000000001   |      1011 | 2026-02-11  | OPEN        |
|      29 | LN-000000029   |      1019 | 2026-02-19  | OPEN        |
|       2 | LN-000000002   |      1022 | 2026-02-22  | OPEN        |
|       3 | LN-000000003   |      1033 | 2026-03-05  | OPEN        |
|      31 | LN-000000031   |      1041 | 2026-03-13  | OPEN        |
|       4 | LN-000000004   |      1044 | 2026-03-16  | OPEN        |
|      32 | LN-000000032   |      1052 | 2026-03-24  | OPEN        |
|      33 | LN-000000033   |      1063 | 2026-04-04  | OPEN        |
|       6 | LN-000000006   |      1066 | 2026-04-07  | OPEN        |
|      34 | LN-000000034   |      1074 | 2026-04-15  | OPEN        |
|       7 | LN-000000007   |      1077 | 2026-04-18  | OPEN        |
|       8 | LN-000000008   |      1088 | 2026-04-29  | OPEN        |
|      36 | LN-000000036   |      1096 | 2026-05-07  | OPEN        |
|       9 | LN-000000009   |      1099 | 2026-05-10  | OPEN        |
|      37 | LN-000000037   |      1007 | 2026-05-18  | OPEN        |
|      38 | LN-000000038   |      1018 | 2026-05-29  | OPEN        |
|      11 | LN-000000011   |      1021 | 2026-06-01  | OPEN        |
|      39 | LN-000000039   |      1029 | 2026-06-09  | OPEN        |
|      12 | LN-000000012   |      1032 | 2026-06-12  | OPEN        |
+---------+----------------+-----------+-------------+-------------+
20 rows in set (0.00 sec)
+-------------+--------------+--------------------+
| artifact_id | accession_no | artifact_title     |
+-------------+--------------+--------------------+
|           1 | MM-000001    | Museum Artifact 1  |
|           2 | MM-000002    | Museum Artifact 2  |
|           3 | MM-000003    | Museum Artifact 3  |
|           4 | MM-000004    | Museum Artifact 4  |
|           5 | MM-000005    | Museum Artifact 5  |
|           6 | MM-000006    | Museum Artifact 6  |
|           7 | MM-000007    | Museum Artifact 7  |
|           8 | MM-000008    | Museum Artifact 8  |
|           9 | MM-000009    | Museum Artifact 9  |
|          10 | MM-000010    | Museum Artifact 10 |
|          11 | MM-000011    | Museum Artifact 11 |
|          12 | MM-000012    | Museum Artifact 12 |
|          13 | MM-000013    | Museum Artifact 13 |
|          14 | MM-000014    | Museum Artifact 14 |
|          15 | MM-000015    | Museum Artifact 15 |
|          16 | MM-000016    | Museum Artifact 16 |
|          17 | MM-000017    | Museum Artifact 17 |
|          18 | MM-000018    | Museum Artifact 18 |
|          19 | MM-000019    | Museum Artifact 19 |
|          20 | MM-000020    | Museum Artifact 20 |
+-------------+--------------+--------------------+
20 rows in set (0.01 sec)
+---------+------------+-------------+----------------+
| loan_id | given_name | family_name | artifact_count |
+---------+------------+-------------+----------------+
|       1 | Lender11   | Family11    |              1 |
|       2 | Lender22   | Family22    |              1 |
|       3 | Lender33   | Family33    |              1 |
|       4 | Lender44   | Family44    |              1 |
|       5 | Lender55   | Family55    |              1 |
|       6 | Lender66   | Family66    |              1 |
|       7 | Lender77   | Family77    |              1 |
|       8 | Lender88   | Family88    |              1 |
|       9 | Lender99   | Family99    |              1 |
|      10 | Lender10   | Family10    |              1 |
|      11 | Lender21   | Family21    |              1 |
|      12 | Lender32   | Family32    |              1 |
|      13 | Lender43   | Family43    |              1 |
|      14 | Lender54   | Family54    |              1 |
|      15 | Lender65   | Family65    |              1 |
|      16 | Lender76   | Family76    |              1 |
|      17 | Lender87   | Family87    |              1 |
|      18 | Lender98   | Family98    |              1 |
|      19 | Lender9    | Family9     |              1 |
|      20 | Lender20   | Family20    |              1 |
+---------+------------+-------------+----------------+
20 rows in set (0.01 sec)
    -> LIMIT 20;
+---------------------+---------+--------------+--------------+----------------------+-----------------+---------------+
| exhibition_name     | slot_no | gallery_name | accession_no | artifact_title       | placement_start | placement_end |
+---------------------+---------+--------------+--------------+----------------------+-----------------+---------------+
| Art Across Time     |      12 | Gallery 2    | MM-005532    | Museum Artifact 5532 | 2026-05-15      | 2026-06-02    |
| Art Across Time     |      32 | Gallery 2    | MM-008752    | Museum Artifact 8752 | 2026-02-24      | 2026-03-14    |
| Sculpture in Space  |       4 | Gallery 4    | MM-007844    | Museum Artifact 7844 | 2026-02-16      | 2026-03-06    |
| Sculpture in Space  |      24 | Gallery 4    | MM-002064    | Museum Artifact 2064 | 2026-09-24      | 2026-10-12    |
| Sculpture in Space  |      44 | Gallery 4    | MM-005284    | Museum Artifact 5284 | 2026-07-06      | 2026-07-24    |
| The Natural World   |      16 | Gallery 6    | MM-004376    | Museum Artifact 4376 | 2026-06-28      | 2026-07-16    |
| The Natural World   |      36 | Gallery 6    | MM-007596    | Museum Artifact 7596 | 2026-04-09      | 2026-04-27    |
| Decorative Heritage |       8 | Gallery 8    | MM-006688    | Museum Artifact 6688 | 2026-04-01      | 2026-04-19    |
| Decorative Heritage |      28 | Gallery 8    | MM-000908    | Museum Artifact 908  | 2026-01-11      | 2026-01-29    |
| Decorative Heritage |      48 | Gallery 8    | MM-004128    | Museum Artifact 4128 | 2026-08-19      | 2026-09-06    |
| Temporary Treasures |      20 | Gallery 10   | MM-003220    | Museum Artifact 3220 | 2026-08-11      | 2026-08-29    |
| Temporary Treasures |      40 | Gallery 10   | MM-006440    | Museum Artifact 6440 | 2026-05-23      | 2026-06-10    |
+---------------------+---------+--------------+--------------+----------------------+-----------------+---------------+
12 rows in set (0.00 sec)
+-------------+--------------------+--------------+-----------------+-----------------------+-----------------+------------+----------+
| artifact_id | artifact_title     | owner_kind   | owner_person_id | owner_organization_id | ownership_share | valid_from | valid_to |
+-------------+--------------------+--------------+-----------------+-----------------------+-----------------+------------+----------+
|           1 | Museum Artifact 1  | PERSON       |            1001 |                  NULL |           60.00 | 2026-06-01 | NULL     |
|           1 | Museum Artifact 1  | ORGANIZATION |            NULL |                     1 |           40.00 | 2026-06-01 | NULL     |
|           2 | Museum Artifact 2  | PERSON       |            1002 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           3 | Museum Artifact 3  | PERSON       |            1003 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           4 | Museum Artifact 4  | PERSON       |            1004 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           5 | Museum Artifact 5  | PERSON       |            1005 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           6 | Museum Artifact 6  | PERSON       |            1006 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           7 | Museum Artifact 7  | PERSON       |            1007 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           8 | Museum Artifact 8  | PERSON       |            1008 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|           9 | Museum Artifact 9  | PERSON       |            1009 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          10 | Museum Artifact 10 | PERSON       |            1010 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          11 | Museum Artifact 11 | PERSON       |            1011 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          12 | Museum Artifact 12 | PERSON       |            1012 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          13 | Museum Artifact 13 | PERSON       |            1013 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          14 | Museum Artifact 14 | PERSON       |            1014 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          15 | Museum Artifact 15 | PERSON       |            1015 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          16 | Museum Artifact 16 | PERSON       |            1016 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          17 | Museum Artifact 17 | PERSON       |            1017 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          18 | Museum Artifact 18 | PERSON       |            1018 |                  NULL |          100.00 | 2020-01-01 | NULL     |
|          19 | Museum Artifact 19 | PERSON       |            1019 |                  NULL |          100.00 | 2020-01-01 | NULL     |
+-------------+--------------------+--------------+-----------------+-----------------------+-----------------+------------+----------+
20 rows in set (0.07 sec)

mysql>
mysql> -- Q8: Custody lines missing condition reports.
mysql> SELECT lo.loan_object_id,lo.loan_id,lo.artifact_id
    -> FROM loan_object lo
    -> LEFT JOIN condition_report cr ON cr.loan_object_id=lo.loan_object_id
    -> WHERE cr.report_id IS NULL
    -> ORDER BY lo.loan_object_id
    -> LIMIT 20;
+----------------+---------+-------------+
| loan_object_id | loan_id | artifact_id |
+----------------+---------+-------------+
|              3 |       3 |        3633 |
|              6 |       6 |        7266 |
|              9 |       9 |        1899 |
|             12 |      12 |        5532 |
|             15 |      15 |         165 |
|             18 |      18 |        3798 |
|             21 |      21 |        7431 |
|             24 |      24 |        2064 |
|             27 |      27 |        5697 |
|             30 |      30 |         330 |
|             33 |      33 |        3963 |
|             36 |      36 |        7596 |
|             39 |      39 |        2229 |
|             42 |      42 |        5862 |
|             45 |      45 |         495 |
|             48 |      48 |        4128 |
+----------------+---------+-------------+
16 rows in set (0.00 sec)

mysql>
mysql> -- 8. SUMMARY COUNTS AND MEDIAN-STYLE QUERY TIMING TEMPLATE
mysql> -- Run each CALL separately and record elapsed time from Workbench execution timing.
mysql> SELECT 'person' AS table_name,COUNT(*) AS row_count FROM person
    -> UNION ALL SELECT 'lender',COUNT(*) FROM lender
    -> UNION ALL SELECT 'loan',COUNT(*) FROM loan
    -> UNION ALL SELECT 'loan_object',COUNT(*) FROM loan_object
    -> UNION ALL SELECT 'condition_report',COUNT(*) FROM condition_report
    -> UNION ALL SELECT 'placement',COUNT(*) FROM placement
    -> UNION ALL SELECT 'artifact_owner',COUNT(*) FROM artifact_owner;
+------------------+-----------+
| table_name       | row_count |
+------------------+-----------+
| person           |       140 |
| lender           |       100 |
| loan             |        50 |
| loan_object      |        50 |
| condition_report |        34 |
| placement        |        12 |
| artifact_owner   |      9002 |
+------------------+-----------+
7 rows in set (0.01 sec)

mysql>
mysql> -- JOIN count for a repeatable workload query.
mysql> SELECT COUNT(*) AS joined_custody_evidence_rows
    -> FROM loan l
    -> JOIN loan_object lo ON lo.loan_id=l.loan_id
    -> JOIN artifact a ON a.artifact_id=lo.artifact_id
    -> LEFT JOIN condition_report cr ON cr.loan_object_id=lo.loan_object_id;
+------------------------------+
| joined_custody_evidence_rows |
+------------------------------+
|                           50 |
+------------------------------+
1 row in set (0.00 sec)

mysql>
