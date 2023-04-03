create database SeyahatAcenteleri_DB --Veritaban� olu�turma ilk kod
use SeyahatAcenteleri_DB --Veritaban� kullanma ikinci kod

--Sistemi kullanan y�neticiler i�in �ncelikle admin bilgileri tutulmal�d�r.
CREATE TABLE admin (  --Y�netici
    adminid int IDENTITY(1,1) NOT NULL, --Y�netici id
    adminname varchar(25) NOT NULL, --Y�netici �sim
    loginid varchar(25), --Giri� id
	passwordd varchar(50), --�ifre
	statuss varchar(10), --Durum
    PRIMARY KEY (adminid) --Birincil Anahtar
);
--M��teri bilgileri tutulmal�d�r.
CREATE TABLE customer ( --M��teri
    customerid int IDENTITY(1,1) NOT NULL, --M��teri id
    customername varchar(25) NOT NULL, --M��teri isim
    dob date NOT NULL, --M��teri do�um tarihi
	gender varchar(10) NOT NULL, --M��teri cinsiyet
	addres varchar(500) NOT NULL, --M��teri adres
	contact varchar(20) NOT NULL, --M��teri ula��m
	mobile varchar(20) NOT NULL, --M��teri telefon
	statee varchar(20) NOT NULL, --M��teri durum
	country varchar(25) NOT NULL, --M��teri �lke
	pincode varchar(10) NOT NULL, --M��teri pin kod
	emailid varchar(20) NOT NULL, --M��teri mail
	loginid varchar(20) NOT NULL, --M��teri giris id
	passwordd varchar(50) NOT NULL, --M��teri �ifre
	statuss varchar(10) NOT NULL, --M��teri durum
    PRIMARY KEY (customerid) --Birincil Anahtar
);
--Seyahat acentelerinin anla�mal� oldu�u �irketlerin bilgisi saklanmal�d�r.
CREATE TABLE company (
    companyid int IDENTITY(1,1) NOT NULL, --�irket id
    companytype varchar(20) NOT NULL, --�irket t�r�
    companyname varchar(25) NOT NULL, --�irket isim
	companylogo varchar(100) NOT NULL, --�irket logo
	description text NOT NULL, --Tan�mlama
	statuss varchar(10) NOT NULL, --Durum
    PRIMARY KEY (companyid) --Birincil Anahtar
);
--Otob�s seyahati i�in otob�s ile ilgili bilgileri saklanmal�d�r.
CREATE TABLE bus ( --otob�s
    busid int IDENTITY(1,1) NOT NULL, --otob�s id
	companyid int NOT NULL foreign key references company(companyid), --�irket id yabanc�l anahtar
    bustype varchar(25) NOT NULL, --otob�s t�r�
	sleeperseats int NOT NULL, --otob�s yatakl� koltuk
	seaterseats int NOT NULL, --otob�s koltuk
	statuss varchar(10) NOT NULL, --otob�s durum
    PRIMARY KEY (busid)  --Birincil Anahtar
);
--u�akla seyahat i�in ise u�ak ile ilgili bilgileri saklanmal�d�r.
CREATE TABLE flight ( --ucak
    flightid int IDENTITY(1,1) NOT NULL, --ucak id
	companyid int NOT NULL foreign key references company(companyid), --�irket id yabanc�l anahtar
	dlocationid int NOT NULL, --lokasyon d id
	alocationid int NOT NULL,  --lokasyon a id
    duration varchar(25) NOT NULL, --s�re
    departtime datetime NOT NULL, --kalk�� zaman�
	arrivetime datetime NOT NULL, --var�� zaman�
	economyseats int NOT NULL, --ekonomi koltuklar�
	businessseats int NOT NULL, --i� koltuklar�
	firstclassseats int NOT NULL, --birinci s�n�f koltuklar�
	premiumeconomyseats int NOT NULL, --premium ekonomi koltuklar�
	econ_tariff  float NOT NULL, --ekonomi tarifesi
	business_tariff  float NOT NULL, --i� tarifesi
	firstclass_tariff  float NOT NULL, --birinci s�n�f tarifesi
	premium_tariff  float NOT NULL, --premium tarifesi
	description text NOT NULL, --tan�mlama
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (flightid) --Birincil Anahtar
);
--Lokasyon bilgileri bir tabloda tutulmal�d�r.
CREATE TABLE location ( --lokasyon
    locationid int IDENTITY(1,1) NOT NULL, --lokasyon id
	locationn varchar(25) NOT NULL, --lokasyon
	locationtype varchar(25) NOT NULL, --lokasyon t�r�
	locationtitle varchar(100) NOT NULL, --lokasyon ba�l�k
	descriptionn text NOT NULL, --tan�m
	statuss varchar(10) NOT NULL, --lokasyon durum
    PRIMARY KEY (locationid) --Birincil Anahtar
);
--M��terilere konaklama hizmeti verilmesi i�in anla�mal� otellerin bilgisi tutulmal�d�r.
CREATE TABLE hotel ( --otel
    hotelid int IDENTITY(1,1) NOT NULL, --otel id
    companyid int NOT NULL foreign key references company(companyid), --�irket id
	locationid int NOT NULL foreign key references location(locationid), --location id
    hotelname varchar(25) NOT NULL, --otel isim
	hoteladdress varchar(250) NOT NULL, --otel adres
	pincode varchar(50) NOT NULL, --pin kod
	hoteldescription text NOT NULL, --otel tan�mlama
    PRIMARY KEY (hotelid) --Birincil Anahtar
);
--M��terilere konaklama hizmeti verilmesi i�in anla�mal� otellerin bilgisi tutulmal�d�r.
CREATE TABLE hotelimage ( --otel resim
    hotel_image_id int IDENTITY(1,1) NOT NULL, --otel resim id
    hotelid int NOT NULL foreign key references hotel(hotelid), --otel id
	hotel_image varchar(50) NOT NULL, --otel resim
	hotel_image_description text NOT NULL, --otel resim tan�m
    PRIMARY KEY (hotel_image_id) --Birincil Anahtar
);
--Oda bilgileri tutulmal�d�r.
CREATE TABLE roomtype ( --oda t�r�
    roomtypeid int IDENTITY(1,1) NOT NULL, --oda t�r� id
	hotelid int NOT NULL foreign key references hotel(hotelid), --otel id
	roomtype varchar(50) NOT NULL, --oda t�r�
	note text NOT NULL, --note
	roomtariff float NOT NULL, --oda t�r� tarifesi
	statuss varchar(10) NOT NULL, --oda t�r� durum
    PRIMARY KEY (roomtypeid) --Birincil Anahtar
);
--Oda bilgileri tutulmal�d�r.
CREATE TABLE room ( --oda
    roomid int IDENTITY(1,1) NOT NULL, --oda id
	roomno varchar(30) NOT NULL, --oda numara
	roomtypeid int NOT NULL foreign key references roomtype(roomtypeid), --oda t�r� id
	statuss varchar(10) NOT NULL, --oda durum
    PRIMARY KEY (roomid) --Birincil Anahtar
);
--Oda bilgileri tutulmal�d�r.
CREATE TABLE service ( --servis
    serviceid int IDENTITY(1,1) NOT NULL, --servis id
	hotelid int NOT NULL foreign key references hotel(hotelid), --hotel id
	servicetype varchar(50) NOT NULL, --servis t�r�
	servicetitle varchar(100) NOT NULL, --servis ba�l�k
	description text NOT NULL, --tan�m
	image varchar(100) NOT NULL, --resim
	cost float NOT NULL, --�cret
	tariff_type varchar(25) NOT NULL, --tarife tipi
	unit varchar(25) NOT NULL, --birim
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (serviceid) --Birincil Anahtar
);
--Seyahat acentesine ait bini� lokasyon bilgileri tutulmal�d�r.
CREATE TABLE boardingpoint ( --bini� lokasyon
    boardingpointid int IDENTITY(1,1) NOT NULL, --bini� lokasyon id
	busid int NOT NULL foreign key references bus(busid), --otob�s id
	boardingpointno int NOT NULL, --bini� lokasyon numara
	dlocation varchar(50) NOT NULL, --lokasyon d
	arrivaltime datetime NOT NULL, --var��
	departuretime datetime NOT NULL, --kalk��
	seatercost float NOT NULL, --koltuk �creti
	sleepercost float NOT NULL, --yatak �creti
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (boardingpointid) --Birincil Anahtar
);
--Seyahat acentesinin faturaland�rma bilgileri tutulmal�d�r.
CREATE TABLE billing ( --fatura
    billingid int IDENTITY(1,1) NOT NULL, --fatura id
	customerid int NOT NULL foreign key references customer(customerid), --m��teri id
	billingcost float NOT NULL, --fatura �cret
	tax float NOT NULL, --vergi
	datee date NOT NULL, --tarih
	payment_type varchar(20) NOT NULL, --�deme t�r�
	cardno varchar(25) NOT NULL, --kart numara
	status varchar(20) NOT NULL, --durum
    PRIMARY KEY (billingid) --Birincil Anahtar
);
--Rezervasyon bilgileri tutulmal�d�r.
CREATE TABLE booking ( --rezervasyon
    bookingid int IDENTITY(1,1) NOT NULL, --rezervasyon id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id
	bookingtype varchar(20) NOT NULL, --rezervasyon t�r�
	ticketid int NOT NULL, --bilet id
	seatno varchar(25) NOT NULL, --koltuk numaras�
	passengername varchar(25) NOT NULL, --yolcu ad�
	gender varchar(10) NOT NULL, --cinsiyet
	contact varchar(15) NOT NULL, --ileti�im
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (bookingid) --Birincil Anahtar
);
--�ptal bilgileri tutulmal�d�r.
CREATE TABLE cancellation ( --iptal
    cancellation_id int IDENTITY(1,1) NOT NULL, --iptal id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id
	refundamount float NOT NULL, --�ade Tutar�
	cancellationdate date NOT NULL, --iptal tarihi
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (cancellation_id) --Birincil Anahtar
);
--Oda Rezervasyon bilgileri tutulmal�d�r.
CREATE TABLE roombooking ( --oda rezervasyon
    room_booking_id int IDENTITY(1,1) NOT NULL, --oda rezervasyon id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id 
	customerid int NOT NULL foreign key references customer(customerid), --m��teri id
	roomid int NOT NULL foreign key references room(roomid), --oda id
	checkindate date NOT NULL, --tarih giri�
	checkoutdate date NOT NULL, --tarih ��k��
	noofadults int NOT NULL, --yeti�kin
	noofchildren int NOT NULL, --�ocuk
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (room_booking_id) --Birincil Anahtar
);
--Derecelendirme bilgileri saklanmal�d�r.
CREATE TABLE rating ( --derece
    ratingid int IDENTITY(1,1) NOT NULL, --derece id
	ratingtype varchar(25) NOT NULL, --derece t�r�
	customerid int NOT NULL foreign key references customer(customerid), --m��teri id
	companyid int NOT NULL foreign key references company(companyid), --�irket id
	rating int NOT NULL, --derece
	commenttitle varchar(100) NOT NULL, --yorum ba�l���
	comments text NOT NULL, ----yorum
	ratingdate date NOT NULL, --tarih
	statuss varchar(10) NOT NULL,--durum
    PRIMARY KEY (ratingid) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmal�d�r.
CREATE TABLE tourpackage ( --tur paketi
    tour_package_id int IDENTITY(1,1) NOT NULL, --tur paketi id
	companyid int NOT NULL foreign key references company(companyid), --�irket id
	tourpackagetype varchar(25) NOT NULL, ----tur paketi t�r�
	packagetitle varchar(100) NOT NULL, --tur paketi ba�l�k
	videolink varchar(100) NOT NULL, --video linki
	imagelink varchar(100) NOT NULL, --foto�raf linki
	overview text NOT NULL, --genel bak��
	inclusion text NOT NULL, --dahil etme
	no_of_days varchar(50) NOT NULL, --bo� g�n
	minprice float NOT NULL, --en d���k �cret
    PRIMARY KEY (tour_package_id) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmal�d�r.
CREATE TABLE itinerary ( --g�zergah
    itineraryid int IDENTITY(1,1) NOT NULL, --g�zergah id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	day_no int NOT NULL, --g�n
	itinerary_title varchar(100) NOT NULL, --g�zergah ba�l�k
	itinerary_description text NOT NULL, --g�zergah tan�m
	itinerary_image varchar(100) NOT NULL, --g�zergah resim
    PRIMARY KEY (itineraryid) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmal�d�r.
CREATE TABLE tourpackageplace ( --tur yeri
    tourpackage_place_id int IDENTITY(1,1) NOT NULL, --tur yeri id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	about_place text NOT NULL, --tur yeri
	place_map text NOT NULL, --tur yeri harita
	contact varchar(25) NOT NULL, --ileti�im
	status varchar(10) NOT NULL, --durum
    PRIMARY KEY (tourpackage_place_id) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmal�d�r.
CREATE TABLE traveloption ( --tur se�enek
    travel_option_id int IDENTITY(1,1) NOT NULL, --tur se�enek id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	travel_source_loc varchar(25) NOT NULL, --tur kaynak lokasyon
	travel_destination_loc varchar(25) NOT NULL, --tur hedef lokasyon
	travel_type varchar(25) NOT NULL, --tur t�r�
	note text NOT NULL, --not
    PRIMARY KEY (travel_option_id) --Birincil Anahtar
);
--Admin tablosu i�in veri giri�i.
insert into admin values('Sefa','600','600','admin') --Admin 1
insert into admin values('Erkan','601','601','admin') --Admin 2
insert into admin values('Asl�','602','602','admin') --Admin 3
insert into admin values('Aslan','603','603','admin') --Admin 4
insert into admin values('Mercan','604','604','admin') --Admin 5
insert into admin values('Melek','605','605','admin') --Admin 6
insert into admin values('�ener','606','606','admin') --Admin 7
insert into admin values('Sabri','607','607','admin') --Admin 8
insert into admin values('Ayfer','608','608','admin') --Admin 9
insert into admin values('Helin','609','609','admin') --Admin 10
--Customer tablosu i�in veri giri�i.
insert into customer values('Serkan','1989-07-23','Erkek','Eski�ehir','Telefon','5415405212','Oduncu','Turkiye','1','serkan@gmail.com','602','�ifre','Giri�') --M��teri
insert into customer values('Sedat','1977-01-01','Erkek','Yalova','Telefon','5415454785','Limon','Turkiye','2','sedat@gmail.com','604','�ifre','Giri�') --M��teri
insert into customer values('Serdar','1975-12-10','Erkek','Zonguldak','Telefon','5401236544','Atat�rk','Turkiye','3','serdar@gmail.com','606','�ifre','Giri�') --M��teri
insert into customer values('Sevil','1982-03-11','Kad�n','Nev�ehir','Telefon','5435535475','Gazi','Turkiye','4','sevil@gmail.com','608','�ifre','Giri�') --M��teri
insert into customer values('Sema','1981-04-23','Kad�n','�anakkale','Telefon','5423462154','Gelibolu','Turkiye','5','sema@gmail.com','610','�ifre','Giri�') --M��teri
insert into customer values('Mahmut','1996-01-24','Erkek','Hatay','Telefon','5327532145','D�rtyol','Turkiye','6','mahmut@gmail.com','612','�ifre','Giri�') --M��teri
insert into customer values('Mustafa','1985-06-01','Erkek','Gaziantep','Telefon','5334478647','�ehitkamil','Turkiye','7','mustafa@gmail.com','614','�ifre','Giri�') --M��teri
insert into customer values('Mehmet','1978-08-29','Erkek','Karaman','Telefon','5411447421','Bah�elievler','Turkiye','8','mehmet@gmail.com','616','�ifre','Giri�') --M��teri
insert into customer values('Necla','1984-10-05','Kad�n','Ad�yaman','Telefon','5445409112','Nemrut','Turkiye','9','necla@gmail.com','618','�ifre','Giri�') --M��teri
insert into customer values('Medine','1976-05-02','Kad�n','Kahramanmara�','Telefon','5313103213','Dondurma','Turkiye','10','medine@gmail.com','620','�ifre','Giri�') --M��teri
--Company tablosu i�in veri giri�i.
insert into company values('Acente','�en Seyehat','�en','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Kaliru Seyehat','Kaliru','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Kardelen Seyehat','Kardelen','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Esma Seyehat','Esma','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Depar Seyehat','Depar','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Sembol Seyehat','Sembol','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Kelime Seyehat','Kelime','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','�eker Seyehat','�eker','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Tatl� Seyehat','Tatl�','Seyahat Acentesi','�al���yor') --Acente
insert into company values('Acente','Pak Seyehat','Pak','Seyahat Acentesi','�al���yor') --Acente
--Bus tablosu i�in veri giri�i.
insert into bus values(1,'Tourismo','15','15','Sa�lam') --Otob�s
insert into bus values(2,'Tourismo','15','15','Sa�lam') --Otob�s
insert into bus values(3,'Travego','10','20','Sa�lam') --Otob�s
insert into bus values(4,'Travego','10','20','Sa�lam') --Otob�s
insert into bus values(5,'Setra','13','17','Sa�lam') --Otob�s
insert into bus values(6,'Setra','13','17','Sa�lam') --Otob�s
insert into bus values(7,'Man','20','10','Sa�lam') --Otob�s
insert into bus values(8,'Man','20','10','Sa�lam') --Otob�s
insert into bus values(9,'Neoplan','2','28','Sa�lam') --Otob�s
insert into bus values(10,'Neoplan','2','28','Sa�lam') --Otob�s
--Flight tablosu i�in veri giri�i.
insert into flight values(1,100,200,'4 g�n','2021-02-01','2021-02-05',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,100,201,'1 g�n','2021-06-03','2021-06-04',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,102,202,'2 g�n','2021-02-03','2021-02-05',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,103,203,'1 g�n','2021-10-09','2021-08-10',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,104,204,'3 g�n','2021-12-08','2021-01-11',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,105,205,'10 g�n','2021-09-12','2021-09-22',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,106,206,'5 g�n','2021-12-08','2021-12-13',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,107,207,'2 g�n','2021-05-01','2021-05-03',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,108,208,'5 g�n','2021-03-24','2021-03-29',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
insert into flight values(1,109,209,'2 g�n','2021-03-29','2021-04-01',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --U�ak
--Location tablosu i�in veri giri�i.
insert into location values('Trabzon','Karadeniz','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Rize','Karadeniz','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Samsun','Karadeniz','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Bolu','Karadeniz','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Ankara','�� Anadolu','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Kayseri','�� Anadolu','Var��','Seyehat','Tatil') --Lokasyon 
insert into location values('�anl�urfa','G�neydo�u Anadolu','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Diyarbak�r','G�neydo�u Anadolu','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Van','Do�u Anadolu','Var��','Seyehat','Tatil') --Lokasyon
insert into location values('Sivas','Do�u Anadolu','Var��','Seyehat','Tatil') --Lokasyon
--Hotel tablosu i�in veri giri�i.
insert into hotel values(1,1,' Hotel','Trabzon','61','Trabzon Meydan') --Otel
insert into hotel values(2,2,'Bellagio Hotel','Rize','53','Rize Merkez') --Otel
insert into hotel values(3,3,'The Plaza Hotel','Samsun','55','Samsun Merkez') --Otel
insert into hotel values(4,3,'Raffles Hotel','Bolu','14','Bolu Meydan') --Otel
insert into hotel values(5,5,'The Ritz Hotel','Ankara','06','Ankara K�z�lay') --Otel
insert into hotel values(6,6,'Hyatt Hotel','Kayseri','38','Kayseri Pazar Kar��s�') --Otel
insert into hotel values(7,7,'Falls Hotel','�anl�urfa','63','Belediye Kar��s�') --Otel
insert into hotel values(8,8,'Marina Hotel','Diyarbak�r','21','Sur i�i') --Otel
insert into hotel values(9,9,'Hotel Sacher','Van','65','Van G�l�') --Otel
insert into hotel values(10,10,'Kempinski Hotel','Sivas','58','Sivas Camii Yan�') --Otel
--Hotelimage tablosu i�in veri giri�i.
insert into hotelimage values(1,'Burj','Resim') --Otel Resim
insert into hotelimage values(2,'Bellagio','Resim') --Otel Resim
insert into hotelimage values(3,'The Plaza','Resim') --Otel Resim
insert into hotelimage values(4,'Raffles','Resim') --Otel Resim
insert into hotelimage values(5,'The Ritz','Resim') --Otel Resim
insert into hotelimage values(6,'Hyatt','Resim') --Otel Resim
insert into hotelimage values(7,'Falls','Resim') --Otel Resim
insert into hotelimage values(8,'Marina','Resim') --Otel Resim
insert into hotelimage values(9,'Hotel','Resim') --Otel Resim
insert into hotelimage values(10,'Kempinski','Resim') --Otel Resim
--Roomtype tablosu i�in veri giri�i.
insert into roomtype values(1,'Tek Ki�ilik','Oda1',10.2,'Bo�') --Oda t�r
insert into roomtype values(2,'�ift Ki�ilik','Oda2',20.2,'Bo�') --Oda t�r
insert into roomtype values(3,'�� Ki�ilik','Oda3',30.2,'Bo�') --Oda t�r
insert into roomtype values(4,'�ift Ki�ilik','Oda4',20.2,'Bo�') --Oda t�r
insert into roomtype values(5,'Kral Dairesi','Oda5',100.2,'Bo�') --Oda t�r
insert into roomtype values(6,'Suite','Oda6',70.2,'Bo�') --Oda t�r
insert into roomtype values(7,'�ift Ki�ilik','Oda7',20.2,'Bo�') --Oda t�r
insert into roomtype values(8,'Kral Dairesi','Oda8',100.2,'Bo�') --Oda t�r
insert into roomtype values(9,'�ift Ki�ilik','Oda9',20.2,'Bo�') --Oda t�r
insert into roomtype values(10,'Tek Ki�ilik','Oda10',10.2,'Bo�') --Oda t�r
--Room tablosu i�in veri giri�i.
insert into room values('1',1,'Bo�') --Oda
insert into room values('2',2,'Bo�') --Oda
insert into room values('3',3,'Bo�') --Oda
insert into room values('4',4,'Bo�') --Oda
insert into room values('5',5,'Bo�') --Oda
insert into room values('6',6,'Bo�') --Oda
insert into room values('7',7,'Bo�') --Oda
insert into room values('8',8,'Bo�') --Oda
insert into room values('9',9,'Bo�') --Oda
insert into room values('10',10,'Bo�') --Oda
--Service tablosu i�in veri giri�i.
insert into service values(1,'�ngiliz Servisi','�ngiliz','Servis','a1',10.2,'Saatlik','1','Haz�r') --Servis
insert into service values(2,'Aile Servisi','Aile','Servis','a1',20.2,'Saatlik','1','Haz�r') --Servis
insert into service values(3,'Self Servisi','Self','Servis','a1',9.2,'Saatlik','1','Haz�r') --Servis
insert into service values(4,'Aile Servisi','Aile','Servis','a1',11.2,'Saatlik','1','Haz�r') --Servis
insert into service values(5,'Amerikan Servisi','Amerikan','Servis','a1',15.2,'Saatlik','1','Haz�r') --Servis
insert into service values(6,'Oda Servisi','Oda','Servis','a1',20.2,'Saatlik','1','Haz�r') --Servis
insert into service values(7,'Self Servisi','Self','Servis','a1',5.2,'Saatlik','1','Haz�r') --Servis
insert into service values(8,'B�fe Servisi','B�fe','Servis','a1',8.2,'Saatlik','1','Haz�r') --Servis
insert into service values(9,'Aile Servisi','Aile','Servis','a1',23.2,'Saatlik','1','Haz�r') --Servis
insert into service values(10,'Oda Servisi','Oda','Servis','a1',12.2,'Saatlik','1','Haz�r') --Servis
--Boardingpoint tablosu i�in veri giri�i.
insert into boardingpoint values(1,10,'Trabzon','23:23:23','00:23:23',5.5,5.5,'Ulas�m') --Bini�
insert into boardingpoint values(2,9,'Rize','22:22:21','23:22:21',6.2,6.2,'Ulas�m') --Bini�
insert into boardingpoint values(3,8,'Samsun','21:20:19','22:20:19',7.4,7.4,'Ulas�m') --Bini�
insert into boardingpoint values(4,7,'Bolu','11:55:10','12:55:10',15.4,15.4,'Ulas�m') --Bini�
insert into boardingpoint values(5,6,'Ankara','12:20:23','13:20:23',6.5,6.2,'Ulas�m') --Bini�
insert into boardingpoint values(6,5,'Kayseri','10:00:31','11:00:31',7.2,7.4,'Ulas�m') --Bini�
insert into boardingpoint values(7,4,'�anl�urfa','23:00:00','00:00:00',8.2,8.8,'Ulas�m') --Bini�
insert into boardingpoint values(8,3,'Diyarbak�r','01:01:01','02:01:01',8.2,8.9,'Ulas�m') --Bini�
insert into boardingpoint values(9,2,'Van','16:45:45','17:45:45',1.2,1.2,'Ulas�m') --Bini� 
insert into boardingpoint values(10,1,'Sivas','10:00:32','11:00:32',10.3,10.3,'Ulas�m') --Bini�
--Billing tablosu i�in veri giri�i.
insert into billing values(1,200.2,20.2,'2021-08-08','Kredi Kart�','4244','Para') --Fatura
insert into billing values(2,110.10,11.10,'2021-08-04','Kredi Kart�','5444','Para Al�nd�') --Fatura
insert into billing values(3,20.10,2.10,'2021-08-07','Banka Kart�','5424','Para Al�nd�') --Fatura
insert into billing values(4,30.20,3.2,'2021-08-18','Kredi Kart�','5842','Para Al�nd�') --Fatura
insert into billing values(5,40.10,4.10,'2021-08-01','Banka Kart�','5423','Para Al�nd�') --Fatura
insert into billing values(6,150.20,15.2,'2021-08-18','Kredi Kart�','5432','Para Al�nd�') --Fatura
insert into billing values(7,70.10,7.5,'2021-08-12','Banka Kart�','4523','Para Al�nd�') --Fatura
insert into billing values(8,60.75,6.6,'2021-08-04','Kredi Kart�','4741','Para Al�nd�') --Fatura
insert into billing values(9,78.10,7.8,'2021-08-20','Banka Kart�','4850','Para Al�nd�') --Fatura
insert into billing values(10,80.00,8.0,'2021-08-01','Banka Kart�','4214','Para Al�nd�') --Fatura
--Booking tablosu i�in veri giri�i.
insert into booking values(1,'Rezervasyon',1,'1','Serkan','Erkek','05435825865','Yolcu') --Rezervasyon
insert into booking values(2,'Rezervasyon',4,'4','Sedat','Erkek','05424565863','Yolcu') --Rezervasyon
insert into booking values(3,'Rezervasyon',2,'2','Serdar','Erkek','05414565864','Yolcu') --Rezervasyon
insert into booking values(4,'Rezervasyon',3,'3','Sevil','Kad�n','05474565867','Yolcu') --Rezervasyon
insert into booking values(5,'Rezervasyon',10,'10','Sema','Kad�n','05423655823','Yolcu1') --Rezervasyon
insert into booking values(6,'Rezervasyon',15,'15','Mahmut','Erkek','05315555844','Yolcu') --Rezervasyon
insert into booking values(7,'Rezervasyon',5,'5','Mustafa','Erkek','05435825845','Yolcu') --Rezervasyon
insert into booking values(8,'Rezervasyon',7,'7','Mehmet','Erkek','05324565812','Yolcu') --Rezervasyon
insert into booking values(9,'Rezervasyon',9,'9','Necla','Kad�n','05432115856','Yolcu') --Rezervasyon
insert into booking values(10,'Rezervasyon',13,'13','Medine','Kad�n','05435285856','Yolcu') --Rezervasyon
--Cancellation tablosu i�in veri giri�i.
insert into cancellation values(1,200.2,'2021-08-08','�ptal') --�ptal
insert into cancellation values(2,110.10,'2021-08-04','�ptal') --�ptal
insert into cancellation values(3,20.10,'2021-08-07','�ptal') --�ptal
insert into cancellation values(4,30.20,'2021-08-18','�ptal') --�ptal
insert into cancellation values(5,40.10,'2021-08-12','�ptal') --�ptal
insert into cancellation values(6,150.20,'2021-08-23','�ptal') --�ptal
insert into cancellation values(7,70.10,'2021-08-04','�ptal') --�ptal
insert into cancellation values(8,60.75,'2021-08-28','�ptal') --�ptal
insert into cancellation values(9,78.10,'2021-08-17','�ptal') --�ptal
insert into cancellation values(10,80.00,'2021-08-12','�ptal') --�ptal
--Roombooking tablosu i�in veri giri�i.
insert into roombooking values(1,1,1,'2021-09-08','2021-09-11',2,1,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(2,2,2,'2021-10-04','2021-10-05',2,0,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(3,3,3,'2021-06-07','2021-06-12',2,1,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(4,4,4,'2021-02-10','2021-02-14',2,3,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(5,5,5,'2021-03-18','2021-03-21',2,4,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(6,6,6,'2021-04-23','2021-04-25',2,4,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(7,7,7,'2021-05-04','2021-05-05',2,2,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(8,8,8,'2021-06-28','2021-07-02',2,3,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(9,9,9,'2021-07-17','2021-07-19',2,1,'Tutuldu')--Oda rezervasyon 
insert into roombooking values(10,10,10,'2021-08-12','2021-08-14',2,0,'Tutuldu')--Oda rezervasyon 
--Rating tablosu i�in veri giri�i.
insert into rating values('Derece',1,1,1,'Puanlama','Berbat','2021-09-11','Hizmet')--Derece
insert into rating values('Derece',2,2,7,'Puanlama','Harika','2021-10-05','Hizmet')--Derece
insert into rating values('Derece',3,3,3,'Puanlama','Be�enmedim','2021-06-12','Hizmet')--Derece
insert into rating values('Derece',4,4,2,'Puanlama','K�t�','2021-02-14','Hizmet')--Derece
insert into rating values('Derece',5,5,4,'Puanlama','Geli�ebilir','2021-03-21','Hizmet')--Derece
insert into rating values('Derece',6,6,6,'Puanlama','�yi','2021-04-25','Hizmet')--Derece
insert into rating values('Derece',7,7,8,'Puanlama','Be�endim','2021-05-05','Hizmet')--Derece
insert into rating values('Derece',8,8,10,'Puanlama','M�kemmel','2021-07-02','Hizmet')--Derece
insert into rating values('Derece',9,9,9,'Puanlama','S�per','2021-07-19','Hizmet')--Derece
insert into rating values('Derece',10,10,5,'Puanlama','Normal','2021-08-14','Hizmet')--Derece
--Tourpackage tablosu i�in veri giri�i.
insert into tourpackage values(1,'Karadeniz','Seyehat','www.youtube/a.com','a','Tatil','Yemek','1',200.2)--Tur Paket
insert into tourpackage values(2,'Karadeniz','Seyehat','www.youtube/b.com','b','Tatil','Yemek','0',210.1)--Tur Paket
insert into tourpackage values(3,'Karadeniz','Seyehat','www.youtube/c.com','c','Tatil','Yemek','0',230.3)--Tur Paket
insert into tourpackage values(4,'Karadeniz','Seyehat','www.youtube/d.com','d','Tatil','Yemek','2',300.44)--Tur Paket
insert into tourpackage values(5,'�� Anadolu','Seyehat','www.youtube/e.com','e','Tatil','Yemek','1',440.5)--Tur Paket
insert into tourpackage values(6,'�� Anadolu','Seyehat','www.youtube/f.com','f','Tatil','Yemek','0',450.66)--Tur Paket
insert into tourpackage values(7,'G�neydo�u Anadolu','Seyehat','www.youtube/g.com','g','Tatil','Yemek','1',510.78)--Tur Paket
insert into tourpackage values(8,'G�neydo�u Anadolu','Seyehat','www.youtube/h.com','h','Tatil','Yemek','2',600.50)--Tur Paket
insert into tourpackage values(9,'Do�u Anadolu','Seyehat','www.youtube/s','s.com','Tatil','Yemek','0',270.20)--Tur Paket
insert into tourpackage values(10,'Do�u Anadolu','Seyehat','www.youtube/n','n.com','Tatil','Yemek','0',480.15)--Tur Paket
--�tinerary tablosu i�in veri giri�i.
insert into itinerary values(1,1,'G�zergah','Karadeniz','a')--G�zergah
insert into itinerary values(2,3,'G�zergah','Karadeniz','b')--G�zergah
insert into itinerary values(3,5,'G�zergah','Karadeniz','c')--G�zergah
insert into itinerary values(4,7,'G�zergah','Karadeniz','d')--G�zergah
insert into itinerary values(5,8,'G�zergah','�� Anadolu','e')--G�zergah
insert into itinerary values(6,11,'G�zergah','�� Anadolu','f')--G�zergah
insert into itinerary values(7,13,'G�zergah','G�neydo�u Anadolu','g')--G�zergah
insert into itinerary values(8,15,'G�zergah','G�neydo�u Anadolu','h')--G�zergah
insert into itinerary values(9,17,'G�zergah','Do�u Anadolu','s')--G�zergah
insert into itinerary values(10,19,'G�zergah','Do�u Anadolu','n')--G�zergah
--Tourpackageplace tablosu i�in veri giri�i.
insert into tourpackageplace values(1,'Karadeniz','Yayla','543431','Yer')--Konum
insert into tourpackageplace values(2,'Karadeniz','Yayla','542462','Yer')--Konum
insert into tourpackageplace values(3,'Karadeniz','Yayla','531435','Yer')--Konum
insert into tourpackageplace values(4,'Karadeniz','Yayla','542412','Yer')--Konum
insert into tourpackageplace values(5,'�� Anadolu','Tarihi Yer','554413','Yer')--Konum
insert into tourpackageplace values(6,'�� Anadolu','Tarihi Yer','562444','Yer')--Konum
insert into tourpackageplace values(7,'G�neydo�u Anadolu','Makam','521455','Yer')--Konum
insert into tourpackageplace values(8,'G�neydo�u Anadolu','Makam','531435','Yer')--Konum
insert into tourpackageplace values(9,'Do�u Anadolu','G�l','523448','Yer')--Konum
insert into tourpackageplace values(10,'Do�u Anadolu','G�l','534429','Yer')--Konum
--Traveloption tablosu i�in veri giri�i.
insert into traveloption values(1,'Havaliman�','Yayla','Ucak','Ho�geldiniz')--Se�enek
insert into traveloption values(2,'Havaliman�','Yayla','Ucak','Ho�geldiniz')--Se�enek
insert into traveloption values(3,'Havaliman�','Yayla','Ucak','Ho�geldiniz')--Se�enek
insert into traveloption values(4,'Havaliman�','Yayla','Ucak','Ho�geldiniz')--Se�enek
insert into traveloption values(5,'Havaliman�','Tarihi Yer','Ucak','Ho�geldiniz')--Se�enek
insert into traveloption values(6,'Otogar','Tarihi Yer','Otob�s','Ho�geldiniz')--Se�enek
insert into traveloption values(7,'Otogar','Makam','Otob�s','Ho�geldiniz')--Se�enek
insert into traveloption values(8,'Otogar','Makam','Otob�s','Ho�geldiniz')--Se�enek
insert into traveloption values(9,'Otogar','G�l','Otob�s','Ho�geldiniz')--Se�enek
insert into traveloption values(10,'Havaliman�','G�l','Ucak','Ho�geldiniz')--Se�enek


--Her bir m��terinin ka� kez ayn� otelde ka� kez kald���n� g�steren sql kodu yaz�n�z.
select locationid from hotel

--En �ok be�eni alan otelin bilgilerini g�steren sql kodu yaz�n�z.
SELECT MAX( hotelid )
  FROM hotel
 WHERE hotelid < ( SELECT MAX( hotelid )
                 FROM hotel )

--Her bir otelin oda �zelliklerini ve �cretlerini listeleyen kodu yaz�n�z.
select hotelid,roomtype,roomtariff from roomtype

--En �ok yorum ve be�enisi olan ilk 5 m��terinin bilgilerini ve be�eni ve yorum say�lar�n� listeleyen kodu yaz�n�z.
select customerid,rating,comments from rating where rating >5

--Her otel i�in kullan�m ve be�eni bilgilerine g�re en �ok tercih edilen odalar�n� b�y�kten k����e do�ru listeleyen sql kodu yaz�n�z.
SELECT roomtypeid,roomtype
FROM roomtype
ORDER BY roomtypeid ASC

--Her bir m��terilerin b�t�n zamanlarda toplam harcama bilgisini hesaplay�p s�ral� bir �ekilde g�steren sql kodu yaz�n�z.
SELECT customerid,billingcost
FROM billing
ORDER BY billingcost DESC

