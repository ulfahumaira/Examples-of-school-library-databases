CREATE TABLE Buku(
	ID int NOT NULL AUTO_INCREMENT,
	Nama_Buku varchar(100) NOT NULL,
	ID_Kategori int;
	Kategori_Peminjaman Boolean;
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Kategori) REFERENCES Kategori_Buku(ID));
