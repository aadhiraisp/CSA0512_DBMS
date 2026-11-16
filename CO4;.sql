CREATE DATABASE IF NOT EXISTS BankTxnDB;
USE BankTxnDB;

-- Create Transaction Table
CREATE TABLE TXN (
    TxnID BIGINT PRIMARY KEY,
    AccountNo BIGINT NOT NULL,
    Branch VARCHAR(50) NOT NULL,
    TxnTime DATETIME NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    TxnType VARCHAR(20),
    Balance DECIMAL(12,2)
);

-- Insert Sample Transactions
INSERT INTO TXN VALUES
(1001,50001,'Chennai','2026-11-01 09:00:00',5000.00,'Credit',15000.00),
(1002,50002,'Salem','2026-11-01 09:15:00',2000.00,'Debit',8000.00),
(1003,50003,'Chennai','2026-11-01 10:00:00',3000.00,'Credit',12000.00),
(1004,50001,'Madurai','2026-11-01 10:30:00',1000.00,'Debit',14000.00),
(1005,50004,'Salem','2026-11-01 11:00:00',4500.00,'Credit',9500.00),
(1006,50002,'Chennai','2026-11-01 12:00:00',1500.00,'Debit',6500.00),
(1007,50005,'Madurai','2026-11-01 13:00:00',2500.00,'Credit',11000.00),
(1008,50003,'Salem','2026-11-01 14:00:00',500.00,'Debit',11500.00);

-- Display All Transactions
SELECT * FROM TXN;

-- Calculate Blocking Factor
SELECT FLOOR(4096 / 200) AS BlockingFactor;

-- Calculate Number of Blocks
SELECT CEIL(1000000 / FLOOR(4096 / 200)) AS TotalBlocks;

-- Heap File Search
SELECT * FROM TXN
WHERE TxnID = 1003;

-- Sorted File Search
SELECT * FROM TXN
WHERE TxnID BETWEEN 1001 AND 1005
ORDER BY TxnID;

-- Account Number Search
SELECT * FROM TXN
WHERE AccountNo = 50001;

-- Branch Search
SELECT * FROM TXN
WHERE Branch = 'Chennai';

-- Create Indexes
CREATE INDEX idx_account ON TXN(AccountNo);
CREATE INDEX idx_branch ON TXN(Branch);
CREATE INDEX idx_txntime ON TXN(TxnTime);

-- Display Indexes
SHOW INDEX FROM TXN;

-- Check Query Execution Plan
EXPLAIN SELECT * FROM TXN
WHERE AccountNo = 50001;

EXPLAIN SELECT * FROM TXN
WHERE Branch = 'Chennai';

EXPLAIN SELECT * FROM TXN
WHERE TxnID BETWEEN 1001 AND 1005;

-- B+ Tree Index Demonstration
-- InnoDB automatically uses B+ Tree indexes.
CREATE INDEX idx_txnid_btree ON TXN(TxnID);

-- B+ Tree Equality Search
SELECT * FROM TXN
WHERE TxnID = 1005;

-- B+ Tree Range Search
SELECT * FROM TXN
WHERE TxnID BETWEEN 1002 AND 1007
ORDER BY TxnID;

-- Hash Index Demonstration Using MEMORY Engine
CREATE TABLE HashTxn (
    TxnID BIGINT PRIMARY KEY,
    AccountNo BIGINT,
    Amount DECIMAL(12,2),
    INDEX USING HASH (AccountNo)
) ENGINE=MEMORY;

-- Insert Hash Records
INSERT INTO HashTxn VALUES
(1,50001,5000.00),
(2,50002,2000.00),
(3,50003,3000.00),
(4,50004,4500.00),
(5,50005,2500.00);

-- Hash Search
SELECT * FROM HashTxn
WHERE AccountNo = 50001;

-- Hash Table Display
SELECT * FROM HashTxn;

-- Insert a New Transaction
INSERT INTO TXN VALUES
(1009,50006,'Chennai','2026-11-02 09:00:00',6000.00,'Credit',16000.00);

-- Update Transaction
UPDATE TXN
SET Amount = 5500.00
WHERE TxnID = 1009;

-- Delete Transaction
DELETE FROM TXN
WHERE TxnID = 1009;

-- Transaction Count
SELECT COUNT(*) AS TotalTransactions
FROM TXN;

-- Branch-wise Transaction Count
SELECT Branch, COUNT(*) AS TotalTransactions
FROM TXN
GROUP BY Branch;

-- Branch-wise Transaction Amount
SELECT Branch, SUM(Amount) AS TotalAmount
FROM TXN
GROUP BY Branch;

-- Account-wise Transaction Details
SELECT AccountNo, COUNT(*) AS TransactionCount,
       SUM(Amount) AS TotalAmount
FROM TXN
GROUP BY AccountNo;

-- Range Query
SELECT * FROM TXN
WHERE TxnTime BETWEEN '2026-11-01 09:00:00'
AND '2026-11-01 14:00:00'
ORDER BY TxnTime;

-- Performance Analysis
EXPLAIN ANALYZE
SELECT * FROM TXN
WHERE AccountNo = 50001;

EXPLAIN ANALYZE
SELECT * FROM TXN
WHERE Branch = 'Chennai';

-- Display Table Storage Information
SELECT TABLE_NAME, ENGINE, TABLE_ROWS,
       DATA_LENGTH, INDEX_LENGTH
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'BankTxnDB';

-- Create UPI Transaction Table
CREATE TABLE UPI_TXN (
    GatewayTxnID BIGINT UNSIGNED PRIMARY KEY,
    AccountNo BIGINT NOT NULL,
    Branch VARCHAR(50),
    Amount DECIMAL(12,2) NOT NULL,
    IngestionTime DATETIME NOT NULL,
    BatchHour DATETIME NOT NULL
);

-- Insert UPI Transactions
INSERT INTO UPI_TXN VALUES
(987654321001,50001,'Chennai',1500.00,
 '2026-11-15 10:10:00','2026-11-15 10:00:00'),
(987654321002,50002,'Salem',2500.00,
 '2026-11-15 10:15:00','2026-11-15 10:00:00'),
(987654321003,50003,'Madurai',3500.00,
 '2026-11-15 10:20:00','2026-11-15 10:00:00');

-- Create UPI Indexes
CREATE INDEX idx_gateway_account
ON UPI_TXN(AccountNo, IngestionTime);

CREATE INDEX idx_gateway_branch
ON UPI_TXN(Branch, IngestionTime);

CREATE INDEX idx_ingestion_time
ON UPI_TXN(IngestionTime);

-- Search Using Gateway Transaction ID
SELECT * FROM UPI_TXN
WHERE GatewayTxnID = 987654321001;

-- Hourly Reconciliation
SELECT * FROM UPI_TXN
WHERE IngestionTime >= '2026-11-15 10:00:00'
AND IngestionTime < '2026-11-15 11:00:00'
ORDER BY IngestionTime;

-- Account-wise UPI Transactions
SELECT * FROM UPI_TXN
WHERE AccountNo = 50001
ORDER BY IngestionTime;

-- Branch-wise UPI Transactions
SELECT * FROM UPI_TXN
WHERE Branch = 'Chennai'
ORDER BY IngestionTime;

-- UPI Transaction Count
SELECT COUNT(*) AS TotalUPITransactions
FROM UPI_TXN;

-- Final Display
SELECT * FROM TXN;
SELECT * FROM UPI_TXN;
SELECT * FROM HashTxn;