DELIMITER $$
CREATE OR REPLACE PROCEDURE 
InsertPetugas() 
begin 
	DECLARE numb1 int DEFAULT 0;
	WHILE numb1 < 50 DO
		INSERT INTO petugas(Nama_Petugas, Tanggal_Mulai, No_Hp) 
		VALUES ((select randomnames() from dual),(FROM_UNIXTIME(UNIX_TIMESTAMP('2020-12-30 00:00:00') - FLOOR(0 + (RAND() * 630720000)))),
		(select randomnumber() from dual));
		set numb1 = numb1 + 1;
	end WHILE;
	commit;
end $$

call InsertPetugas();
