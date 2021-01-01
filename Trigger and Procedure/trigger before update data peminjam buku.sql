DELIMITER //
CREATE OR REPLACE TRIGGER UpdateDataPeminjamDanDenda BEFORE UPDATE on peminjam_buku 
for EACH row 
begin 
	IF 
		datediff(new.Tanggal_Pengembalian,old.Batas_Pengembalian) > 0 
	THEN 
		set new.Denda = 1;
		INSERT INTO denda(ID_Siswa,Biaya_Denda,id_peminjam) 
		VALUES (old.ID_Siswa,datediff(new.Tanggal_Pengembalian,old.Batas_Pengembalian)*1000,old.ID);
	ELSE
		SET new.Denda = 0;
	end if;
end; //
DELIMITER ;
