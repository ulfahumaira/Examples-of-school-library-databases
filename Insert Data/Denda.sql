INSERT INTO denda (ID_Siswa,ID_Peminjam,Biaya_Denda)
SELECT ID_Siswa,ID, DATEDIFF( Tanggal_Pengembalian, Batas_Pengembalian)*1000
FROM peminjam_buku
WHERE denda=1;
commit;
