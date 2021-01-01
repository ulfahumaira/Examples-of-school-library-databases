DELIMITER $$
CREATE OR REPLACE PROCEDURE 
InsertBuku() 
begin 
	DECLARE numb int DEFAULT 0;
	WHILE numb < 1500 DO
		INSERT INTO buku(Nama_Buku,ID_Kategori, Kategori_Peminjaman) 
		VALUES ((select concat(RANDOMNAMES(),' ',RANDOMNAMES()) from dual),(select RANDBETWEEN(1,73) from dual),
		(select case when rand() < 0.5 then 1 else 0 end));
	set numb = numb + 1;
	end WHILE;
	commit;
end $$

call insertbuku();
