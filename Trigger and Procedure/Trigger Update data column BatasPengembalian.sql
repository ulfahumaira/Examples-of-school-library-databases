DELIMITER //
CREATE OR REPLACE TRIGGER update_batas_peminjaman 
BEFORE INSERT on peminjam_buku for EACH row 
begin 
	SET new.batas_pengembalian=new.tanggal_peminjaman + INTERVAL 3 day; 
end; //
DELIMITER ;
