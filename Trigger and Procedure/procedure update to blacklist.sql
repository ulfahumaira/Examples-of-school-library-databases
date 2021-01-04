DELIMITER $$
CREATE OR REPLACE PROCEDURE 
updatetoblacklist() 
begin 
DECLARE tanggalkembali date;
DECLARE bayar boolean;
DECLARE tagihan boolean;
DECLARE temp int;
DECLARE numb int DEFAULT 1;
WHILE numb <= (select a.id from peminjam_buku a where a.Tanggal_Pengembalian is not null)  DO
	select bayar into bayar from denda where ID_Peminjam = numb;
 	select Tanggal_Pengembalian into tanggalkembali from peminjam_buku  where ID = numb;
    select Denda into tagihan from peminjam_buku  where ID = numb;
    select ID_Siswa into temp from peminjam_buku  where ID = numb;
 	if bayar = 0 and tanggalkembali = dateformat(sysdate(),'%y-%m-%d') and tagihan = 1 THEN
 		update siswa set blacklist = 1 where id = temp; 
     end if;
	set numb = numb + 1;
end WHILE;
commit;
end $$
