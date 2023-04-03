create database ECZANE_DB
use ECZANE_DB

--Eczane Tablosu Olu�turduk
CREATE TABLE eczane (
    eczaneID int IDENTITY(1,1) NOT NULL,
    eczane_adres varchar(255) NOT NULL,
    eczane_iletisim varchar(255),
	eczane_isim varchar(255),
    PRIMARY KEY (eczaneID)
);
--Doktor Tablosu Olu�turduk
CREATE TABLE doktor (
    doktorID int  IDENTITY(1,1) NOT NULL,
    doktor_isim varchar(255) NOT NULL,
    doktor_uzmanlik varchar(255),
    chastane varchar(255),
	doktor_iletisim varchar(255),
    PRIMARY KEY (doktorID)
);
--Tedarik Tablosu Olu�turduk
CREATE TABLE tedarikci (
    tedarikciID int IDENTITY(1,1) NOT NULL,
    tedarikci_isim varchar(255) NOT NULL,
    tedarikci_iletisim varchar(255),
	tedarikci_adres varchar(255),
    PRIMARY KEY (tedarikciID)
);
--Hasta Tablosu Olu�turduk
CREATE TABLE hasta (
    hastaID int  IDENTITY(1,1) NOT NULL,
	hasta_tc varchar(255) NOT NULL,
    hasta_adres varchar(255),
    hasta_iletisim varchar(255),
	hasta_cinsiyet varchar(255),
	doktorid int not null Foreign key references doktor(doktorID),
    PRIMARY KEY (hastaID)
);
--�al��an Tablosu Olu�turduk
CREATE TABLE calisan (
    calisanID int IDENTITY(1,1) NOT NULL,
    calisan_isim varchar(255) NOT NULL,
    calisan_vardiya varchar(255),
    calisan_tecrube varchar(255),
	calisan_iletisim varchar(255),
	eczaneID int not null foreign key references eczane (eczaneID),
    PRIMARY KEY (calisanID)
);
--�la� Tablosu Olu�turduk
CREATE TABLE ilac (
    ilacID int  IDENTITY(1,1) NOT NULL,
    ilac_isim varchar(255) NOT NULL,
    ilac_fiyat varchar(255),
    ilac_uretim varchar(255),
	ilac_stok int,
	hastaid int  not null foreign key references hasta(hastaID),
	eczaneid int not null foreign key references eczane(eczaneID),
	doktorid int not null foreign key references doktor(doktorID),
	sirketid int not null foreign key references tedarikci(tedarikciID),
	kisiid int   not null foreign key references calisan(calisanID),
    PRIMARY KEY (ilacID)
);
--Eczane tablosuna veri giri�i yapt�k
insert into eczane values('Haliliye/�anl�urfa','4145698965','Erkan Eczanesi')
insert into eczane values('Karak�pr�/�anl�urfa','4147852114','Sevgi Eczanesi')
--Doktor tablosuna veri giri�i yapt�k
insert into doktor values('Mehmet G�ne�','Kulak Burun Bo�az','500 Yatakli','5425478962');
insert into doktor values('Fatma Ayg�n','Kad�n Hastal�klar�','500 Yatakli','5426011993');
insert into doktor values('Sena Ulusoy', '�ocuk Sa�l���', 'E�itim Ve Ara�tirma', '5422512598');
insert into doktor values('Servet ��m�ek', 'Plastik Cerrahi', '800 Yatakli', '5423516251');
insert into doktor values('Helin B�y�k','Genel Cerrahi','500 Yatakli','5425478962');
--Tedarik tablosuna veri giri�i yapt�k
insert into tedarikci values('Prifez','4143156598','�stanbul');
insert into tedarikci values('Sinivac','4143140050','Antalya');
--Hasta tablosuna veri giri�i yapt�k
insert into hasta values('37367183008','Haliliye/�anl�urfa','5425896564','Erkek',1);
insert into hasta values('36925651237', 'Karak�pr�/�anl�urfa', '5426023661', 'Kad�n',2); 
insert into hasta values('76925651238', 'Eyy�biye/�anl�urfa', '5426023662', 'Erkek',3); 
insert into hasta values('46925651239', 'Suru�/�anl�urfa', '5426023663', 'Kad�n',4); 
insert into hasta values('36925651240', 'Harran/�anl�urfa', '5426023664', 'Erkek',5);
insert into hasta values('56925651241', 'Halfeti/�anl�urfa', '5426023665', 'Erkek',2);
insert into hasta values('47925651242', 'Ak�akale/�anl�urfa', '5426023666', 'Kad�n',1); 
insert into hasta values('33267183008','Birecik/�anl�urfa','5425896564','Erkek',4); 
insert into hasta values('32367183008','Siverek/�anl�urfa','5425896564','Kad�n',5); 
insert into hasta values('31267183008','Ceylanp�nar/�anl�urfa','5425896564','Erkek',3);
--�al��an tablosuna veri giri�i yapt�k
insert into calisan values('Ahmet Bal','G�nd�z','5','5412593545',1);
insert into calisan values('Mehmet Pekmez','Gece','3','5436172039',1);
--�la� tablosuna veri giri�i yapt�k
insert into ilac values('AFINITOR','10 TL','ABD',5,1,1,1,1,1);
insert into ilac values('ALOMIDE','7 TL','ABD',5,1,1,2,1,1);
insert into ilac values('Arzerra','6 TL','ABD',5,2,1,3,1,1);
insert into ilac values('AZARGA','4 TL','T�rkiye',5,2,1,4,1,1);
insert into ilac values('Azopt','5 TL','T�rkiye',5,3,1,5,1,1);
insert into ilac values('Betoptic','10 TL','T�rkiye',5,3,1,1,1,1);
insert into ilac values('CATAFLAM','20 TL','�spanya',5,4,1,2,1,1);
insert into ilac values('Certican','3 TL','�spanya',5,4,1,3,1,1);
insert into ilac values('Ciloxan','8 TL','�spanya',5,5,1,4,1,1);
insert into ilac values('CO-D�OVAN','12 TL','Almanya',5,5,1,5,1,1);
insert into ilac values('DESFERAL','14 TL','Almanya',5,6,1,1,1,1);
insert into ilac values('DEXA-S�NE','17 TL','Almanya',5,6,1,2,1,1);
insert into ilac values('Diovan','52 TL','Almanya',5,7,1,3,1,1);
insert into ilac values('DUOTRAV','23 TL','Portekiz',5,7,1,4,1,2);
insert into ilac values('EMAD�NE','12 TL','�ngiltere',5,8,1,5,1,2);
insert into ilac values('Exelon','11 TL','K�ba',5,8,1,1,2,2);
insert into ilac values('EXFORGE','9 TL','�in',5,9,1,2,2,2);
insert into ilac values('Forge','8 TL','�in',5,9,1,3,2,2);
insert into ilac values('Asprin','7 TL','Japonya',5,10,1,4,2,2);
insert into ilac values('EXJADE','30 TL','Japonya',5,10,1,5,2,2);

--ila� bilgilerini listeleyen SQL sorgu kodu
select ilac_isim,ilac_fiyat,ilac_uretim from ilac 

DECLARE @sayac INT =1;
WHILE @sayac < 2
BEGIN
select ilac.ilac_isim,ilac_stok from ilac
SET @sayac +=1
END;
GO

select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='37367183008'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='36925651237'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='76925651238'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='46925651239'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='36925651240'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='56925651241'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='47925651242'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='33267183008'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='32367183008'
select hasta_tc , ilac_isim from hasta  INNER JOIN  ilac on  hasta.hastaID =ilac.hastaid where hasta.hasta_tc ='31267183008'

UPDATE ilac
SET ilac_stok = 3

DECLARE @sayac INT =1;
WHILE @sayac < 2
BEGIN
select ilac.ilac_isim,ilac_stok from ilac
SET @sayac +=1
END;
GO




