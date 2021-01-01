DELIMITER $$
CREATE OR REPLACE PROCEDURE 
InsertKelas() 
BEGIN
	DECLARE numb1 int DEFAULT 1;
	DECLARE numb2 int DEFAULT 1;
	DECLARE numb3 int DEFAULT 1;
	WHILE numb1 < 10 DO
		INSERT INTO kelas(Nama_Kelas,Tingkat) VALUES (concat('X.',numb1),’1’);
		set numb1 = numb1 + 1;
	end WHILE;
	WHILE numb2 < 11 DO
		INSERT INTO kelas(Nama_Kelas,Tingkat)  VALUES (concat('XI.',numb2),’2’);
		set numb2 = numb2 + 1;
	end WHILE;
	WHILE numb3 < 11 DO
		INSERT INTO kelas(Nama_Kelas,Tingkat)  VALUES (concat('XII.',numb3),’3’);
		set numb3 = numb3 + 1;
	end WHILE;
	commit;
end $$

call InsertKelas();
