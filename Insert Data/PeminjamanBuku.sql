DELIMITER $$
CREATE OR REPLACE PROCEDURE 
InsertPeminjam() 
begin 
	DECLARE numb int DEFAULT 0;
	WHILE numb < 100 DO
	INSERT INTO peminjam_buku(ID_Buku,ID_Siswa, Tanggal_Peminjaman,ID_Petugas) 
	VALUES ((select RANDBETWEEN(1,1500) from dual),(select RANDBETWEEN(1,500) from dual),
	(FROM_UNIXTIME(UNIX_TIMESTAMP('2020-12-30 00:00:00') - FLOOR(0 + (RAND() * 15552000)))),
	(select RANDBETWEEN(1,50) from dual));
	set numb = numb + 1;
	end WHILE;
	commit;
	-- update untuk mengisi data batas pengembalian berdasarkan random date
	UPDATE peminjam_buku set Batas_Pengembalian = DATE_ADD(Tanggal_Peminjaman , INTERVAL 3 DAY);
	commit;
	-- update untuk mengisi random tanggal pengembalian berdasarkan data tanggal peminjaman
	UPDATE peminjam_buku set Tanggal_Pengembalian = DATE_ADD(Tanggal_Peminjaman , INTERVAL (select RANDBETWEEN(0,5) from dual) DAY);
	COMMIT;
	-- update untuk mengisi denda jika tanggal pengembalian melewati batas pengembalian
	UPDATE peminjam_buku SET denda = CASE
	WHEN datediff(Tanggal_Pengembalian,Batas_Pengembalian) <= 0 THEN 0 ELSE 1
	END;
	Commit;
end $$

call InsertPeminjam();


--if the data consist ID book which can’t be lend, then:
DELETE from peminjam_buku where ID_Buku in ( select id from buku where kategori_peminjaman = 0);
commit;
