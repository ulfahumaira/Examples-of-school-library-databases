CREATE TABLE Denda(
	ID int NOT NULL AUTO_INCREMENT,
	ID_Siswa int NOT NULL,
	ID_Peminjam int NOT NULL
	Biaya_Denda int NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Siswa) REFERENCES Siswa(ID)
	);
