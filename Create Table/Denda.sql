CREATE TABLE Denda(
	ID int NOT NULL AUTO_INCREMENT,
	ID_Siswa int NOT NULL,
	ID_Peminjam int NOT NULL
	Biaya_Denda int NOT NULL,
	Bayar boolean,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Siswa) REFERENCES Siswa(ID),
	FOREIGN KEY (ID_Peminjan) REFERENCES Peminjam_buku(ID)
	);
