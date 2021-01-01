CREATE TABLE Petugas(
	ID int NOT NULL AUTO_INCREMENT,
	Nama_Petugas varchar(50) NOT NULL,
	Tanggal_Mulai date NOT NULL,
	Tanggal_Akhir date,
	No_Hp varchar(15),
	PRIMARY KEY (ID));
