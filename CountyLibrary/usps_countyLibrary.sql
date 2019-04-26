USE db_countyLibrary;

-- Stored Procedure 1

CREATE PROC dbo.uspSumSharpstownLostTribe
AS
SELECT SUM(a.Number_Of_Copies) AS 'Sharpstown_Lost_Tribe_Copies'
FROM BOOK_COPIES a
INNER JOIN LIBRARY_BRANCH b ON b.BranchID = a.BranchID
INNER JOIN BOOKS c ON c.BookID = a.BookID
WHERE b.BranchName = 'Sharpstown' AND c.Title = 'The Lost Tribe'
GO

-- Stored Procedure 2

CREATE PROC dbo.uspSumTotalLostTribe
AS
SELECT b.BranchName,
	 SUM(a.Number_Of_Copies) AS 'Lost_Tribe_Copies'
FROM BOOK_COPIES a
INNER JOIN LIBRARY_BRANCH b ON b.BranchID = a.BranchID
INNER JOIN BOOKS c ON c.BookID = a.BookID
WHERE c.Title = 'The Lost Tribe'
GROUP BY b.BranchName
GO

-- Stored Procedure 3

CREATE PROC dbo.uspSelectNoLoanBorrower
AS
SELECT BorrowerName
FROM BORROWER
WHERE CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS)
GO


-- Stored Procedure 4

CREATE PROC dbo.uspSelectSharpstownBorrowers
AS
SELECT B.Title, c.BorrowerName, c.BorrowerAddress
FROM BOOK_LOANS a
INNER JOIN BOOKS b ON b.BookID = a.BookID
INNER JOIN BORROWER c ON c.CardNo = a.CardNo
INNER JOIN LIBRARY_BRANCH d ON d.BranchID = a.BranchID
WHERE d.BranchName = 'Sharpstown' AND a.DateDue = (SELECT CONVERT(varchar, getdate(), 23));
GO

-- Stored Procedure 5
CREATE PROC dbo.uspCountBookLoansByBranch
AS
SELECT a.BranchName, COUNT(b.BranchID) AS TotalBooksLoaned
FROM LIBRARY_BRANCH a
INNER JOIN BOOK_LOANS b ON b.BranchID = a. BranchID
WHERE a.BranchID = b.BranchID
GROUP BY a.BranchName
GO

-- Stored Procedure 6

CREATE PROC dbo.uspSelectHighVolumeBorrowers
AS
SELECT a.BorrowerName, a.BorrowerAddress, Count(b.CardNo) AS Books_Checked_Out
FROM BORROWER a
INNER JOIN BOOK_LOANS b ON b.CardNo = a.CardNo
GROUP BY a.BorrowerName, a.BorrowerAddress
Having (Select COUNT(b.CardNo)) > 5
GO

-- Stored Procedure 7
CREATE PROC dbo.uspSelectKingInCentral
AS
SELECT a.Title, c.Number_Of_Copies
FROM BOOKS a
INNER JOIN BOOK_AUTHORS b ON b.BookID = a.BookID
INNER JOIN BOOK_COPIES c ON c.BookID = a.BookID
INNER JOIN LIBRARY_BRANCH d ON d.BranchID = c.BranchID
WHERE b.AuthorName = 'Stephen King' AND d.BranchName = 'Central'
GO