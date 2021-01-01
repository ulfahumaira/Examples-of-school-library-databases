--Get random names

DELIMITER %%
CREATE OR REPLACE FUNCTION RANDOMNAMES()
RETURNS varchar(10)
BEGIN
	DECLARE name1 varchar(10);
	DECLARE name varchar(10) DEFAULT 'A';
	DECLARE numb int;
	DECLARE counter int DEFAULT 0;
	set numb = floor((rand()*5));
	while counter <= numb do
		set name1 = concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26, 1),substring('AIUEOAIUEOAIUEOAIUEO', rand()*10, 1));
		SET name = concat(name,name1);
		set counter = counter + 1;
	end while;
	RETURN name;
end; %%
DELIMITER ;

--Get Random Alamat siswa

DELIMITER %%
CREATE OR REPLACE FUNCTION RANDOMALAMAT()
RETURNS varchar(50)
BEGIN
	DECLARE alamat1 varchar(50); DECLARE alamat2 varchar(50) DEFAULT 'Jl.';
	DECLARE alamat3 varchar(50); DECLARE alamat4 varchar(50) DEFAULT 'A';
	DECLARE alamat varchar(50); DECLARE hasil varchar(50);
	DECLARE numb int;
	DECLARE counter int DEFAULT 0;
	set numb = floor((rand()*5));
	while counter <= numb do
		set alamat1 = concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26, 1),substring('AIUEOAIUEOAIUEOAIUEO', rand()*10, 1));
		SET alamat2 = concat(alamat2,alamat1);
		set counter = counter + 1;
	end while;
	set numb = floor((rand()*5));
	set counter = 0;
	while counter <= numb do
		set alamat3 = concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26, 1),substring('AIUEOAIUEOAIUEOAIUEO', rand()*10, 1));
		SET alamat4 = concat(alamat4,alamat3);
		set counter = counter + 1;
	end while;
	set alamat = concat(alamat2,' ',alamat4,' no.',floor((rand()*99)));
	RETURN alamat;
end; %%
DELIMITER ;

--Get random ID Kelas

DELIMITER %%
CREATE OR REPLACE FUNCTION RANDBETWEEN(LowerBound int, UpperBound INT)
RETURNS int
BEGIN
	DECLARE temp int;
	set temp = (select FLOOR( RAND() * (UpperBound-LowerBound) + LowerBound)); 
	RETURN temp;
end; %%
DELIMITER ;

--Get random nomor hp

DELIMITER %%
CREATE OR REPLACE FUNCTION RANDOMNUMBER()
RETURNS varchar(15)
BEGIN
	DECLARE temp1 varchar(15); DECLARE temp2 varchar(15) DEFAULT '08';DECLARE numb int;
	DECLARE counter int DEFAULT 0;
	set numb = (select randbetween(8,11) from dual);
	while counter <= numb do
		set temp1 = substring('0123456789', rand()*9, 1);
		SET temp2 = concat(temp2,temp1);
		set counter = counter + 1;
	end while;
	RETURN temp2;
end; %%
DELIMITER ;

--Insert Data siswa

DELIMITER $$
CREATE OR REPLACE PROCEDURE 
InsertSiswa() 
begin 
	DECLARE numb int DEFAULT 0;
	WHILE numb < 500 DO
		INSERT INTO siswa(First_Name, Last_Name, ID_Kelas, Alamat_Siswa, No_Hp, Nama_Orangtua, No_Hp_Ortu, Nama_Wali, No_Hp_Wali, Blacklist) 
		VALUES ((select RANDOMNAMES() from dual),(select RANDOMNAMES() from dual),(select RANDBETWEEN(3,31) from dual), 
		(select RANDOMALAMAT() from dual), (select RANDOMNUMBER() from dual), (select RANDOMNAMES() from dual),
		(select RANDOMNUMBER() from dual),(select RANDOMNAMES() from dual),(select RANDOMNUMBER() from dual), 
		(select case when rand() < 0.5 then 0 else 1 end));
		set numb = numb + 1;
	end WHILE;
	commit;
end $$

call InsertSiswa();
