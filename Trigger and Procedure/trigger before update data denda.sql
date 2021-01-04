DELIMITER //
CREATE OR REPLACE TRIGGER UpdateDataDenda BEFORE UPDATE on denda 
for EACH row 
begin 
IF new.bayar > 1 
	THEN 
	UPDATE siswa a set a.Blacklist = 0 where a.ID = new.ID_Siswa;
end if;
end; //
DELIMITER ;
