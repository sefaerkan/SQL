create database ECZANE_DB
use ECZANE_DB

--Eczane Tablosu Oluþturduk
CREATE TABLE eczane (
    eczaneID int IDENTITY(1,1) NOT NULL,
    eczane_adres varchar(255) NOT NULL,
    eczane_iletisim varchar(255),
	eczane_isim varchar(255),
    PRIMARY KEY (eczaneID)
);
--Doktor Tablosu Oluþturduk
CREATE TABLE doktor (
    doktorID int  IDENTITY(1,1) NOT NULL,
    doktor_isim varchar(255) NOT NULL,
    doktor_uzmanlik varchar(255),
    chastane varchar(255),
	doktor_iletisim varchar(255),
    PRIMARY KEY (doktorID)
);
--Tedarik Tablosu Oluþturduk
CREATE TABLE tedarikci (
    tedarikciID int IDENTITY(1,1) NOT NULL,
    tedarikci_isim varchar(255) NOT NULL,
    tedarikci_iletisim varchar(255),
	tedarikci_adres varchar(255),
    PRIMARY KEY (tedarikciID)
);
--Hasta Tablosu Oluþturduk
CREATE TABLE hasta (
    hastaID int  IDENTITY(1,1) NOT NULL,
	hasta_tc varchar(255) NOT NULL,
    hasta_adres varchar(255),
    hasta_iletisim varchar(255),
	hasta_cinsiyet varchar(255),
	doktorid int not null Foreign key references doktor(doktorID),
    PRIMARY KEY (hastaID)
);
--Çalýþan Tablosu Oluþturduk
CREATE TABLE calisan (
    calisanID int IDENTITY(1,1) NOT NULL,
    calisan_isim varchar(255) NOT NULL,
    calisan_vardiya varchar(255),
    calisan_tecrube varchar(255),
	calisan_iletisim varchar(255),
	eczaneID int not null foreign key references eczane (eczaneID),
    PRIMARY KEY (calisanID)
);
--Ýlaç Tablosu Oluþturduk
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
--Eczane tablosuna veri giriþi yaptýk
insert into eczane values('Haliliye/Þanlýurfa','4145698965','Erkan Eczanesi')
insert into eczane values('Karaköprü/Þanlýurfa','4147852114','Sevgi Eczanesi')
--Doktor tablosuna veri giriþi yaptýk
insert into doktor values('Mehmet Güneþ','Kulak Burun Boðaz','500 Yatakli','5425478962');
insert into doktor values('Fatma Aygün','Kadýn Hastalýklarý','500 Yatakli','5426011993');
insert into doktor values('Sena Ulusoy', 'Çocuk Saðlýðý', 'Eðitim Ve Araþtirma', '5422512598');
insert into doktor values('Servet ÞÝmþek', 'Plastik Cerrahi', '800 Yatakli', '5423516251');
insert into doktor values('Helin Büyük','Genel Cerrahi','500 Yatakli','5425478962');
--Tedarik tablosuna veri giriþi yaptýk
insert into tedarikci values('Prifez','4143156598','Ýstanbul');
insert into tedarikci values('Sinivac','4143140050','Antalya');
--Hasta tablosuna veri giriþi yaptýk
insert into hasta values('37367183008','Haliliye/Þanlýurfa','5425896564','Erkek',1);
insert into hasta values('36925651237', 'Karaköprü/Þanlýurfa', '5426023661', 'Kadýn',2); 
insert into hasta values('76925651238', 'Eyyübiye/Þanlýurfa', '5426023662', 'Erkek',3); 
insert into hasta values('46925651239', 'Suruç/Þanlýurfa', '5426023663', 'Kadýn',4); 
insert into hasta values('36925651240', 'Harran/Þanlýurfa', '5426023664', 'Erkek',5);
insert into hasta values('56925651241', 'Halfeti/Þanlýurfa', '5426023665', 'Erkek',2);
insert into hasta values('47925651242', 'Akçakale/Þanlýurfa', '5426023666', 'Kadýn',1); 
insert into hasta values('33267183008','Birecik/Þanlýurfa','5425896564','Erkek',4); 
insert into hasta values('32367183008','Siverek/Þanlýurfa','5425896564','Kadýn',5); 
insert into hasta values('31267183008','Ceylanpýnar/Þanlýurfa','5425896564','Erkek',3);
--Çalýþan tablosuna veri giriþi yaptýk
insert into calisan values('Ahmet Bal','Gündüz','5','5412593545',1);
insert into calisan values('Mehmet Pekmez','Gece','3','5436172039',1);
--Ýlaç tablosuna veri giriþi yaptýk
insert into ilac values('AFINITOR','10 TL','ABD',5,1,1,1,1,1);
insert into ilac values('ALOMIDE','7 TL','ABD',5,1,1,2,1,1);
insert into ilac values('Arzerra','6 TL','ABD',5,2,1,3,1,1);
insert into ilac values('AZARGA','4 TL','Türkiye',5,2,1,4,1,1);
insert into ilac values('Azopt','5 TL','Türkiye',5,3,1,5,1,1);
insert into ilac values('Betoptic','10 TL','Türkiye',5,3,1,1,1,1);
insert into ilac values('CATAFLAM','20 TL','Ýspanya',5,4,1,2,1,1);
insert into ilac values('Certican','3 TL','Ýspanya',5,4,1,3,1,1);
insert into ilac values('Ciloxan','8 TL','Ýspanya',5,5,1,4,1,1);
insert into ilac values('CO-DÝOVAN','12 TL','Almanya',5,5,1,5,1,1);
insert into ilac values('DESFERAL','14 TL','Almanya',5,6,1,1,1,1);
insert into ilac values('DEXA-SÝNE','17 TL','Almanya',5,6,1,2,1,1);
insert into ilac values('Diovan','52 TL','Almanya',5,7,1,3,1,1);
insert into ilac values('DUOTRAV','23 TL','Portekiz',5,7,1,4,1,2);
insert into ilac values('EMADÝNE','12 TL','Ýngiltere',5,8,1,5,1,2);
insert into ilac values('Exelon','11 TL','Küba',5,8,1,1,2,2);
insert into ilac values('EXFORGE','9 TL','Çin',5,9,1,2,2,2);
insert into ilac values('Forge','8 TL','Çin',5,9,1,3,2,2);
insert into ilac values('Asprin','7 TL','Japonya',5,10,1,4,2,2);
insert into ilac values('EXJADE','30 TL','Japonya',5,10,1,5,2,2);

--ilaç bilgilerini listeleyen SQL sorgu kodu
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




