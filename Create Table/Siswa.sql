CREATE TABLE Siswa(
	ID int NOT NULL AUTO_INCREMENT,
	First_Name varchar(50) NOT NULL,
	Last_Name varchar(50),
	ID_Kelas int NOT NULL,
	Alamat_Siswa varchar(255),
	No_Hp varchar(15),
	Nama_Orangtua varchar(50),
	No_Hp_Ortu varchar(15),
	Nama_Wali varchar(50),
	No_Hp_Wali varchar(15),
	Blacklist Boolean,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Kelas) REFERENCES Kelas(ID));
