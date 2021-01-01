DELIMITER //
CREATE OR REPLACE TRIGGER UpdateDataPeminjam BEFORE INSERT on peminjam_buku for EACH row 
begin 
	if 
		new.ID_Buku in (select id from buku where kategori_peminjaman = 0) 
		then signal SQLSTATE '45000' set MESSAGE_TEXT = 'Buku tidak bisa di pinjam';
	ELSEIF 
		new.ID_Siswa in (SELECT id from siswa where blacklist = 1)
		then signal SQLSTATE '45000' set MESSAGE_TEXT = 'Siswa masuk kategori blacklist';
	ELSE 
		set new.batas_pengembalian=new.tanggal_peminjaman + INTERVAL 3 day;
	end if;
end; //
DELIMITER ;
