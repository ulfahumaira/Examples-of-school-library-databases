INSERT INTO denda (ID_Siswa,ID_Peminjam,Biaya_Denda,Bayar)
SELECT ID_Siswa,ID, DATEDIFF( Tanggal_Pengembalian, Batas_Pengembalian)*1000,(select case when rand() < 0.5 then 1 else 0 end))
FROM peminjam_buku
WHERE denda=1;
commit;
