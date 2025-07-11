-- PERCOBAAN 1
-- Menampilkan tanggal dan waktu saat ini dalam berbagai format
SELECT 
	GETDATE() AS currentdatetime, 
	FORMAT(GETDATE(), 'yyyy-MM-dd') AS currentdate,
	FORMAT(GETDATE(), 'HH:mm:ss') AS currenttime,
	FORMAT(GETDATE(), 'yyyy') AS currentyear,
	FORMAT(GETDATE(), 'MM') AS currentmonth,
	FORMAT(GETDATE(), 'dd') AS currentday,
	FORMAT(GETDATE(), 'yyyy') AS currentyear,
	DATEPART(ISO_WEEK, GETDATE()) AS currentweeknumber,
	DATENAME(MONTH, GETDATE()) AS currentmonthname;

-- PERCOBAAN 2
-- Menampilkan tanggal hari ini dengan berbagai cara konversi dan format
SELECT 
	CAST(GETDATE() AS DATE) AS todaysdate;

SELECT
	FORMAT(GETDATE(), 'MMM dd, yyyy') AS todaysdate;

SELECT
	CONVERT(varchar(11), GETDATE(), 106) AS todaysdate;

-- PERCOBAAN 3
-- Operasi penambahan dan selisih tanggal, serta mendapatkan hari pertama bulan
SELECT
	DATEADD(MONTH, 5, GETDATE()) AS fivemonths,
	DATEDIFF(DAY, GETDATE(), DATEADD(MONTH, 5, GETDATE())) AS diffdays,
	DATEDIFF(WEEK, '1945-08-17', '2024-08-17') AS diffweeks,
	DATEADD(DAY, 1 - DAY(GETDATE()), GETDATE()) AS firstday;

-- PERCOBAAN 4
-- Validasi dan konversi string ke tipe DATE pada tabel Sales.Somedates
-- CREATE TABLE Sales.Somedates ( isitdate varchar(9));

INSERT INTO Sales.Somedates (isitdate) VALUES 
	('20230101'),
	('20230102'),
	('20230103X'),
	('20230104'),
	('20230105'),
	('20230106'),
	('20230107Y'),
	('20230108');

SELECT
	d.isitdate, 
	CASE
		WHEN ISDATE(isitdate) = 1 THEN CONVERT(DATE, d.isitdate)
		ELSE NULL
	END AS converteddate
FROM Sales.Somedates AS d;

SELECT
	SYSDATETIME() AS systemDate,
	CURRENT_TIMESTAMP AS currentTIme

-- Percobaan 5
-- Filter data pesanan berdasarkan bulan dan tahun pengiriman
SELECT 
	custid, shipname, shippeddate 
FROM Sales.Orders WHERE MONTH(shippeddate) = 3 AND YEAR(shippeddate) = 2008;

-- Percobaan 6
-- Mendapatkan tanggal hari ini, tanggal awal bulan, dan tanggal akhir bulan
SELECT
	GETDATE() AS tanggalMengerjakan,
	DATEADD(DAY, 1 - DAY(GETDATE()), GETDATE()) AS tanggalAwal,
	EOMONTH(GETDATE()) AS tanggalTerakhir;

-- Percobaan 7
-- Menampilkan pesanan yang dibuat pada 5 hari terakhir di bulan tersebut
SELECT
	orderid, custid, orderdate, shipaddress 
FROM Sales.Orders WHERE DATEPART(DAY, orderdate) >= (DAY(EOMONTH(orderdate)) - 4);

-- Percobaan 8 
-- Menggabungkan nama kontak dan kota dalam satu kolom
SELECT
	contactname + ' (city: ' + city + ')' AS contactdetails
FROM Sales.Customers;

-- Percobaan 9
-- Menampilkan kontak dengan nama depan huruf A-G
SELECT
	contactname, contacttitle
FROM Sales.Customers WHERE contactname LIKE '[A-G]%';

-- Percobaan 10
-- Mengganti karakter koma pada nama kontak dengan spasi
SELECT
	REPLACE(contactname, ',', ' ') AS contactname
FROM Sales.Customers;

-- Percobaan 11
-- Membuat kode pelanggan dengan format khusus
SELECT 
    custid, 
    CONCAT('C', RIGHT('00000' + CAST(custid AS VARCHAR(6)), 5)) AS customer_code
FROM Sales.Customers;

-- Percobaan 12
-- Menghitung jumlah huruf 'a' pada nama kontak
SELECT
	contactname,
	LEN(contactname) - LEN(REPLACE(contactname, 'a', '')) AS countofa
FROM Sales.Customers;