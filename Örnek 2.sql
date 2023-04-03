create database SeyahatAcenteleri_DB --Veritabaný oluþturma ilk kod
use SeyahatAcenteleri_DB --Veritabaný kullanma ikinci kod

--Sistemi kullanan yöneticiler için öncelikle admin bilgileri tutulmalýdýr.
CREATE TABLE admin (  --Yönetici
    adminid int IDENTITY(1,1) NOT NULL, --Yönetici id
    adminname varchar(25) NOT NULL, --Yönetici Ýsim
    loginid varchar(25), --Giriþ id
	passwordd varchar(50), --Þifre
	statuss varchar(10), --Durum
    PRIMARY KEY (adminid) --Birincil Anahtar
);
--Müþteri bilgileri tutulmalýdýr.
CREATE TABLE customer ( --Müþteri
    customerid int IDENTITY(1,1) NOT NULL, --Müþteri id
    customername varchar(25) NOT NULL, --Müþteri isim
    dob date NOT NULL, --Müþteri doðum tarihi
	gender varchar(10) NOT NULL, --Müþteri cinsiyet
	addres varchar(500) NOT NULL, --Müþteri adres
	contact varchar(20) NOT NULL, --Müþteri ulaþým
	mobile varchar(20) NOT NULL, --Müþteri telefon
	statee varchar(20) NOT NULL, --Müþteri durum
	country varchar(25) NOT NULL, --Müþteri ülke
	pincode varchar(10) NOT NULL, --Müþteri pin kod
	emailid varchar(20) NOT NULL, --Müþteri mail
	loginid varchar(20) NOT NULL, --Müþteri giris id
	passwordd varchar(50) NOT NULL, --Müþteri þifre
	statuss varchar(10) NOT NULL, --Müþteri durum
    PRIMARY KEY (customerid) --Birincil Anahtar
);
--Seyahat acentelerinin anlaþmalý olduðu þirketlerin bilgisi saklanmalýdýr.
CREATE TABLE company (
    companyid int IDENTITY(1,1) NOT NULL, --Þirket id
    companytype varchar(20) NOT NULL, --Þirket türü
    companyname varchar(25) NOT NULL, --Þirket isim
	companylogo varchar(100) NOT NULL, --Þirket logo
	description text NOT NULL, --Tanýmlama
	statuss varchar(10) NOT NULL, --Durum
    PRIMARY KEY (companyid) --Birincil Anahtar
);
--Otobüs seyahati için otobüs ile ilgili bilgileri saklanmalýdýr.
CREATE TABLE bus ( --otobüs
    busid int IDENTITY(1,1) NOT NULL, --otobüs id
	companyid int NOT NULL foreign key references company(companyid), --þirket id yabancýl anahtar
    bustype varchar(25) NOT NULL, --otobüs türü
	sleeperseats int NOT NULL, --otobüs yataklý koltuk
	seaterseats int NOT NULL, --otobüs koltuk
	statuss varchar(10) NOT NULL, --otobüs durum
    PRIMARY KEY (busid)  --Birincil Anahtar
);
--uçakla seyahat için ise uçak ile ilgili bilgileri saklanmalýdýr.
CREATE TABLE flight ( --ucak
    flightid int IDENTITY(1,1) NOT NULL, --ucak id
	companyid int NOT NULL foreign key references company(companyid), --þirket id yabancýl anahtar
	dlocationid int NOT NULL, --lokasyon d id
	alocationid int NOT NULL,  --lokasyon a id
    duration varchar(25) NOT NULL, --süre
    departtime datetime NOT NULL, --kalkýþ zamaný
	arrivetime datetime NOT NULL, --varýþ zamaný
	economyseats int NOT NULL, --ekonomi koltuklarý
	businessseats int NOT NULL, --iþ koltuklarý
	firstclassseats int NOT NULL, --birinci sýnýf koltuklarý
	premiumeconomyseats int NOT NULL, --premium ekonomi koltuklarý
	econ_tariff  float NOT NULL, --ekonomi tarifesi
	business_tariff  float NOT NULL, --iþ tarifesi
	firstclass_tariff  float NOT NULL, --birinci sýnýf tarifesi
	premium_tariff  float NOT NULL, --premium tarifesi
	description text NOT NULL, --tanýmlama
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (flightid) --Birincil Anahtar
);
--Lokasyon bilgileri bir tabloda tutulmalýdýr.
CREATE TABLE location ( --lokasyon
    locationid int IDENTITY(1,1) NOT NULL, --lokasyon id
	locationn varchar(25) NOT NULL, --lokasyon
	locationtype varchar(25) NOT NULL, --lokasyon türü
	locationtitle varchar(100) NOT NULL, --lokasyon baþlýk
	descriptionn text NOT NULL, --taným
	statuss varchar(10) NOT NULL, --lokasyon durum
    PRIMARY KEY (locationid) --Birincil Anahtar
);
--Müþterilere konaklama hizmeti verilmesi için anlaþmalý otellerin bilgisi tutulmalýdýr.
CREATE TABLE hotel ( --otel
    hotelid int IDENTITY(1,1) NOT NULL, --otel id
    companyid int NOT NULL foreign key references company(companyid), --þirket id
	locationid int NOT NULL foreign key references location(locationid), --location id
    hotelname varchar(25) NOT NULL, --otel isim
	hoteladdress varchar(250) NOT NULL, --otel adres
	pincode varchar(50) NOT NULL, --pin kod
	hoteldescription text NOT NULL, --otel tanýmlama
    PRIMARY KEY (hotelid) --Birincil Anahtar
);
--Müþterilere konaklama hizmeti verilmesi için anlaþmalý otellerin bilgisi tutulmalýdýr.
CREATE TABLE hotelimage ( --otel resim
    hotel_image_id int IDENTITY(1,1) NOT NULL, --otel resim id
    hotelid int NOT NULL foreign key references hotel(hotelid), --otel id
	hotel_image varchar(50) NOT NULL, --otel resim
	hotel_image_description text NOT NULL, --otel resim taným
    PRIMARY KEY (hotel_image_id) --Birincil Anahtar
);
--Oda bilgileri tutulmalýdýr.
CREATE TABLE roomtype ( --oda türü
    roomtypeid int IDENTITY(1,1) NOT NULL, --oda türü id
	hotelid int NOT NULL foreign key references hotel(hotelid), --otel id
	roomtype varchar(50) NOT NULL, --oda türü
	note text NOT NULL, --note
	roomtariff float NOT NULL, --oda türü tarifesi
	statuss varchar(10) NOT NULL, --oda türü durum
    PRIMARY KEY (roomtypeid) --Birincil Anahtar
);
--Oda bilgileri tutulmalýdýr.
CREATE TABLE room ( --oda
    roomid int IDENTITY(1,1) NOT NULL, --oda id
	roomno varchar(30) NOT NULL, --oda numara
	roomtypeid int NOT NULL foreign key references roomtype(roomtypeid), --oda türü id
	statuss varchar(10) NOT NULL, --oda durum
    PRIMARY KEY (roomid) --Birincil Anahtar
);
--Oda bilgileri tutulmalýdýr.
CREATE TABLE service ( --servis
    serviceid int IDENTITY(1,1) NOT NULL, --servis id
	hotelid int NOT NULL foreign key references hotel(hotelid), --hotel id
	servicetype varchar(50) NOT NULL, --servis türü
	servicetitle varchar(100) NOT NULL, --servis baþlýk
	description text NOT NULL, --taným
	image varchar(100) NOT NULL, --resim
	cost float NOT NULL, --ücret
	tariff_type varchar(25) NOT NULL, --tarife tipi
	unit varchar(25) NOT NULL, --birim
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (serviceid) --Birincil Anahtar
);
--Seyahat acentesine ait biniþ lokasyon bilgileri tutulmalýdýr.
CREATE TABLE boardingpoint ( --biniþ lokasyon
    boardingpointid int IDENTITY(1,1) NOT NULL, --biniþ lokasyon id
	busid int NOT NULL foreign key references bus(busid), --otobüs id
	boardingpointno int NOT NULL, --biniþ lokasyon numara
	dlocation varchar(50) NOT NULL, --lokasyon d
	arrivaltime datetime NOT NULL, --varýþ
	departuretime datetime NOT NULL, --kalkýþ
	seatercost float NOT NULL, --koltuk ücreti
	sleepercost float NOT NULL, --yatak ücreti
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (boardingpointid) --Birincil Anahtar
);
--Seyahat acentesinin faturalandýrma bilgileri tutulmalýdýr.
CREATE TABLE billing ( --fatura
    billingid int IDENTITY(1,1) NOT NULL, --fatura id
	customerid int NOT NULL foreign key references customer(customerid), --müþteri id
	billingcost float NOT NULL, --fatura ücret
	tax float NOT NULL, --vergi
	datee date NOT NULL, --tarih
	payment_type varchar(20) NOT NULL, --ödeme türü
	cardno varchar(25) NOT NULL, --kart numara
	status varchar(20) NOT NULL, --durum
    PRIMARY KEY (billingid) --Birincil Anahtar
);
--Rezervasyon bilgileri tutulmalýdýr.
CREATE TABLE booking ( --rezervasyon
    bookingid int IDENTITY(1,1) NOT NULL, --rezervasyon id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id
	bookingtype varchar(20) NOT NULL, --rezervasyon türü
	ticketid int NOT NULL, --bilet id
	seatno varchar(25) NOT NULL, --koltuk numarasý
	passengername varchar(25) NOT NULL, --yolcu adý
	gender varchar(10) NOT NULL, --cinsiyet
	contact varchar(15) NOT NULL, --iletiþim
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (bookingid) --Birincil Anahtar
);
--Ýptal bilgileri tutulmalýdýr.
CREATE TABLE cancellation ( --iptal
    cancellation_id int IDENTITY(1,1) NOT NULL, --iptal id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id
	refundamount float NOT NULL, --Ýade Tutarý
	cancellationdate date NOT NULL, --iptal tarihi
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (cancellation_id) --Birincil Anahtar
);
--Oda Rezervasyon bilgileri tutulmalýdýr.
CREATE TABLE roombooking ( --oda rezervasyon
    room_booking_id int IDENTITY(1,1) NOT NULL, --oda rezervasyon id
	billingid int NOT NULL foreign key references billing(billingid), --fatura id 
	customerid int NOT NULL foreign key references customer(customerid), --müþteri id
	roomid int NOT NULL foreign key references room(roomid), --oda id
	checkindate date NOT NULL, --tarih giriþ
	checkoutdate date NOT NULL, --tarih çýkýþ
	noofadults int NOT NULL, --yetiþkin
	noofchildren int NOT NULL, --çocuk
	statuss varchar(10) NOT NULL, --durum
    PRIMARY KEY (room_booking_id) --Birincil Anahtar
);
--Derecelendirme bilgileri saklanmalýdýr.
CREATE TABLE rating ( --derece
    ratingid int IDENTITY(1,1) NOT NULL, --derece id
	ratingtype varchar(25) NOT NULL, --derece türü
	customerid int NOT NULL foreign key references customer(customerid), --müþteri id
	companyid int NOT NULL foreign key references company(companyid), --þirket id
	rating int NOT NULL, --derece
	commenttitle varchar(100) NOT NULL, --yorum baþlýðý
	comments text NOT NULL, ----yorum
	ratingdate date NOT NULL, --tarih
	statuss varchar(10) NOT NULL,--durum
    PRIMARY KEY (ratingid) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmalýdýr.
CREATE TABLE tourpackage ( --tur paketi
    tour_package_id int IDENTITY(1,1) NOT NULL, --tur paketi id
	companyid int NOT NULL foreign key references company(companyid), --þirket id
	tourpackagetype varchar(25) NOT NULL, ----tur paketi türü
	packagetitle varchar(100) NOT NULL, --tur paketi baþlýk
	videolink varchar(100) NOT NULL, --video linki
	imagelink varchar(100) NOT NULL, --fotoðraf linki
	overview text NOT NULL, --genel bakýþ
	inclusion text NOT NULL, --dahil etme
	no_of_days varchar(50) NOT NULL, --boþ gün
	minprice float NOT NULL, --en düþük ücret
    PRIMARY KEY (tour_package_id) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmalýdýr.
CREATE TABLE itinerary ( --güzergah
    itineraryid int IDENTITY(1,1) NOT NULL, --güzergah id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	day_no int NOT NULL, --gün
	itinerary_title varchar(100) NOT NULL, --güzergah baþlýk
	itinerary_description text NOT NULL, --güzergah taným
	itinerary_image varchar(100) NOT NULL, --güzergah resim
    PRIMARY KEY (itineraryid) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmalýdýr.
CREATE TABLE tourpackageplace ( --tur yeri
    tourpackage_place_id int IDENTITY(1,1) NOT NULL, --tur yeri id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	about_place text NOT NULL, --tur yeri
	place_map text NOT NULL, --tur yeri harita
	contact varchar(25) NOT NULL, --iletiþim
	status varchar(10) NOT NULL, --durum
    PRIMARY KEY (tourpackage_place_id) --Birincil Anahtar
);
--Seyahat Acentesine ait tur paketleri bilgileri tutulmalýdýr.
CREATE TABLE traveloption ( --tur seçenek
    travel_option_id int IDENTITY(1,1) NOT NULL, --tur seçenek id
	tour_package_id int NOT NULL foreign key references tourpackage(tour_package_id), --tur paket id
	travel_source_loc varchar(25) NOT NULL, --tur kaynak lokasyon
	travel_destination_loc varchar(25) NOT NULL, --tur hedef lokasyon
	travel_type varchar(25) NOT NULL, --tur türü
	note text NOT NULL, --not
    PRIMARY KEY (travel_option_id) --Birincil Anahtar
);
--Admin tablosu için veri giriþi.
insert into admin values('Sefa','600','600','admin') --Admin 1
insert into admin values('Erkan','601','601','admin') --Admin 2
insert into admin values('Aslý','602','602','admin') --Admin 3
insert into admin values('Aslan','603','603','admin') --Admin 4
insert into admin values('Mercan','604','604','admin') --Admin 5
insert into admin values('Melek','605','605','admin') --Admin 6
insert into admin values('Þener','606','606','admin') --Admin 7
insert into admin values('Sabri','607','607','admin') --Admin 8
insert into admin values('Ayfer','608','608','admin') --Admin 9
insert into admin values('Helin','609','609','admin') --Admin 10
--Customer tablosu için veri giriþi.
insert into customer values('Serkan','1989-07-23','Erkek','Eskiþehir','Telefon','5415405212','Oduncu','Turkiye','1','serkan@gmail.com','602','þifre','Giriþ') --Müþteri
insert into customer values('Sedat','1977-01-01','Erkek','Yalova','Telefon','5415454785','Limon','Turkiye','2','sedat@gmail.com','604','þifre','Giriþ') --Müþteri
insert into customer values('Serdar','1975-12-10','Erkek','Zonguldak','Telefon','5401236544','Atatürk','Turkiye','3','serdar@gmail.com','606','þifre','Giriþ') --Müþteri
insert into customer values('Sevil','1982-03-11','Kadýn','Nevþehir','Telefon','5435535475','Gazi','Turkiye','4','sevil@gmail.com','608','þifre','Giriþ') --Müþteri
insert into customer values('Sema','1981-04-23','Kadýn','Çanakkale','Telefon','5423462154','Gelibolu','Turkiye','5','sema@gmail.com','610','þifre','Giriþ') --Müþteri
insert into customer values('Mahmut','1996-01-24','Erkek','Hatay','Telefon','5327532145','Dörtyol','Turkiye','6','mahmut@gmail.com','612','þifre','Giriþ') --Müþteri
insert into customer values('Mustafa','1985-06-01','Erkek','Gaziantep','Telefon','5334478647','Þehitkamil','Turkiye','7','mustafa@gmail.com','614','þifre','Giriþ') --Müþteri
insert into customer values('Mehmet','1978-08-29','Erkek','Karaman','Telefon','5411447421','Bahçelievler','Turkiye','8','mehmet@gmail.com','616','þifre','Giriþ') --Müþteri
insert into customer values('Necla','1984-10-05','Kadýn','Adýyaman','Telefon','5445409112','Nemrut','Turkiye','9','necla@gmail.com','618','þifre','Giriþ') --Müþteri
insert into customer values('Medine','1976-05-02','Kadýn','Kahramanmaraþ','Telefon','5313103213','Dondurma','Turkiye','10','medine@gmail.com','620','þifre','Giriþ') --Müþteri
--Company tablosu için veri giriþi.
insert into company values('Acente','Þen Seyehat','Þen','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Kaliru Seyehat','Kaliru','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Kardelen Seyehat','Kardelen','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Esma Seyehat','Esma','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Depar Seyehat','Depar','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Sembol Seyehat','Sembol','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Kelime Seyehat','Kelime','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Þeker Seyehat','Þeker','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Tatlý Seyehat','Tatlý','Seyahat Acentesi','Çalýþýyor') --Acente
insert into company values('Acente','Pak Seyehat','Pak','Seyahat Acentesi','Çalýþýyor') --Acente
--Bus tablosu için veri giriþi.
insert into bus values(1,'Tourismo','15','15','Saðlam') --Otobüs
insert into bus values(2,'Tourismo','15','15','Saðlam') --Otobüs
insert into bus values(3,'Travego','10','20','Saðlam') --Otobüs
insert into bus values(4,'Travego','10','20','Saðlam') --Otobüs
insert into bus values(5,'Setra','13','17','Saðlam') --Otobüs
insert into bus values(6,'Setra','13','17','Saðlam') --Otobüs
insert into bus values(7,'Man','20','10','Saðlam') --Otobüs
insert into bus values(8,'Man','20','10','Saðlam') --Otobüs
insert into bus values(9,'Neoplan','2','28','Saðlam') --Otobüs
insert into bus values(10,'Neoplan','2','28','Saðlam') --Otobüs
--Flight tablosu için veri giriþi.
insert into flight values(1,100,200,'4 gün','2021-02-01','2021-02-05',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,100,201,'1 gün','2021-06-03','2021-06-04',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,102,202,'2 gün','2021-02-03','2021-02-05',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,103,203,'1 gün','2021-10-09','2021-08-10',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,104,204,'3 gün','2021-12-08','2021-01-11',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,105,205,'10 gün','2021-09-12','2021-09-22',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,106,206,'5 gün','2021-12-08','2021-12-13',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,107,207,'2 gün','2021-05-01','2021-05-03',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,108,208,'5 gün','2021-03-24','2021-03-29',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
insert into flight values(1,109,209,'2 gün','2021-03-29','2021-04-01',5,8,13,21,5.3,10.8,20.7,30.5,'Seyehat','Oturmak') --Uçak
--Location tablosu için veri giriþi.
insert into location values('Trabzon','Karadeniz','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Rize','Karadeniz','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Samsun','Karadeniz','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Bolu','Karadeniz','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Ankara','Ýç Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Kayseri','Ýç Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon 
insert into location values('Þanlýurfa','Güneydoðu Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Diyarbakýr','Güneydoðu Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Van','Doðu Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon
insert into location values('Sivas','Doðu Anadolu','Varýþ','Seyehat','Tatil') --Lokasyon
--Hotel tablosu için veri giriþi.
insert into hotel values(1,1,' Hotel','Trabzon','61','Trabzon Meydan') --Otel
insert into hotel values(2,2,'Bellagio Hotel','Rize','53','Rize Merkez') --Otel
insert into hotel values(3,3,'The Plaza Hotel','Samsun','55','Samsun Merkez') --Otel
insert into hotel values(4,3,'Raffles Hotel','Bolu','14','Bolu Meydan') --Otel
insert into hotel values(5,5,'The Ritz Hotel','Ankara','06','Ankara Kýzýlay') --Otel
insert into hotel values(6,6,'Hyatt Hotel','Kayseri','38','Kayseri Pazar Karþýsý') --Otel
insert into hotel values(7,7,'Falls Hotel','Þanlýurfa','63','Belediye Karþýsý') --Otel
insert into hotel values(8,8,'Marina Hotel','Diyarbakýr','21','Sur içi') --Otel
insert into hotel values(9,9,'Hotel Sacher','Van','65','Van Gölü') --Otel
insert into hotel values(10,10,'Kempinski Hotel','Sivas','58','Sivas Camii Yaný') --Otel
--Hotelimage tablosu için veri giriþi.
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
--Roomtype tablosu için veri giriþi.
insert into roomtype values(1,'Tek Kiþilik','Oda1',10.2,'Boþ') --Oda tür
insert into roomtype values(2,'Çift Kiþilik','Oda2',20.2,'Boþ') --Oda tür
insert into roomtype values(3,'Üç Kiþilik','Oda3',30.2,'Boþ') --Oda tür
insert into roomtype values(4,'Çift Kiþilik','Oda4',20.2,'Boþ') --Oda tür
insert into roomtype values(5,'Kral Dairesi','Oda5',100.2,'Boþ') --Oda tür
insert into roomtype values(6,'Suite','Oda6',70.2,'Boþ') --Oda tür
insert into roomtype values(7,'Çift Kiþilik','Oda7',20.2,'Boþ') --Oda tür
insert into roomtype values(8,'Kral Dairesi','Oda8',100.2,'Boþ') --Oda tür
insert into roomtype values(9,'Çift Kiþilik','Oda9',20.2,'Boþ') --Oda tür
insert into roomtype values(10,'Tek Kiþilik','Oda10',10.2,'Boþ') --Oda tür
--Room tablosu için veri giriþi.
insert into room values('1',1,'Boþ') --Oda
insert into room values('2',2,'Boþ') --Oda
insert into room values('3',3,'Boþ') --Oda
insert into room values('4',4,'Boþ') --Oda
insert into room values('5',5,'Boþ') --Oda
insert into room values('6',6,'Boþ') --Oda
insert into room values('7',7,'Boþ') --Oda
insert into room values('8',8,'Boþ') --Oda
insert into room values('9',9,'Boþ') --Oda
insert into room values('10',10,'Boþ') --Oda
--Service tablosu için veri giriþi.
insert into service values(1,'Ýngiliz Servisi','Ýngiliz','Servis','a1',10.2,'Saatlik','1','Hazýr') --Servis
insert into service values(2,'Aile Servisi','Aile','Servis','a1',20.2,'Saatlik','1','Hazýr') --Servis
insert into service values(3,'Self Servisi','Self','Servis','a1',9.2,'Saatlik','1','Hazýr') --Servis
insert into service values(4,'Aile Servisi','Aile','Servis','a1',11.2,'Saatlik','1','Hazýr') --Servis
insert into service values(5,'Amerikan Servisi','Amerikan','Servis','a1',15.2,'Saatlik','1','Hazýr') --Servis
insert into service values(6,'Oda Servisi','Oda','Servis','a1',20.2,'Saatlik','1','Hazýr') --Servis
insert into service values(7,'Self Servisi','Self','Servis','a1',5.2,'Saatlik','1','Hazýr') --Servis
insert into service values(8,'Büfe Servisi','Büfe','Servis','a1',8.2,'Saatlik','1','Hazýr') --Servis
insert into service values(9,'Aile Servisi','Aile','Servis','a1',23.2,'Saatlik','1','Hazýr') --Servis
insert into service values(10,'Oda Servisi','Oda','Servis','a1',12.2,'Saatlik','1','Hazýr') --Servis
--Boardingpoint tablosu için veri giriþi.
insert into boardingpoint values(1,10,'Trabzon','23:23:23','00:23:23',5.5,5.5,'Ulasým') --Biniþ
insert into boardingpoint values(2,9,'Rize','22:22:21','23:22:21',6.2,6.2,'Ulasým') --Biniþ
insert into boardingpoint values(3,8,'Samsun','21:20:19','22:20:19',7.4,7.4,'Ulasým') --Biniþ
insert into boardingpoint values(4,7,'Bolu','11:55:10','12:55:10',15.4,15.4,'Ulasým') --Biniþ
insert into boardingpoint values(5,6,'Ankara','12:20:23','13:20:23',6.5,6.2,'Ulasým') --Biniþ
insert into boardingpoint values(6,5,'Kayseri','10:00:31','11:00:31',7.2,7.4,'Ulasým') --Biniþ
insert into boardingpoint values(7,4,'Þanlýurfa','23:00:00','00:00:00',8.2,8.8,'Ulasým') --Biniþ
insert into boardingpoint values(8,3,'Diyarbakýr','01:01:01','02:01:01',8.2,8.9,'Ulasým') --Biniþ
insert into boardingpoint values(9,2,'Van','16:45:45','17:45:45',1.2,1.2,'Ulasým') --Biniþ 
insert into boardingpoint values(10,1,'Sivas','10:00:32','11:00:32',10.3,10.3,'Ulasým') --Biniþ
--Billing tablosu için veri giriþi.
insert into billing values(1,200.2,20.2,'2021-08-08','Kredi Kartý','4244','Para') --Fatura
insert into billing values(2,110.10,11.10,'2021-08-04','Kredi Kartý','5444','Para Alýndý') --Fatura
insert into billing values(3,20.10,2.10,'2021-08-07','Banka Kartý','5424','Para Alýndý') --Fatura
insert into billing values(4,30.20,3.2,'2021-08-18','Kredi Kartý','5842','Para Alýndý') --Fatura
insert into billing values(5,40.10,4.10,'2021-08-01','Banka Kartý','5423','Para Alýndý') --Fatura
insert into billing values(6,150.20,15.2,'2021-08-18','Kredi Kartý','5432','Para Alýndý') --Fatura
insert into billing values(7,70.10,7.5,'2021-08-12','Banka Kartý','4523','Para Alýndý') --Fatura
insert into billing values(8,60.75,6.6,'2021-08-04','Kredi Kartý','4741','Para Alýndý') --Fatura
insert into billing values(9,78.10,7.8,'2021-08-20','Banka Kartý','4850','Para Alýndý') --Fatura
insert into billing values(10,80.00,8.0,'2021-08-01','Banka Kartý','4214','Para Alýndý') --Fatura
--Booking tablosu için veri giriþi.
insert into booking values(1,'Rezervasyon',1,'1','Serkan','Erkek','05435825865','Yolcu') --Rezervasyon
insert into booking values(2,'Rezervasyon',4,'4','Sedat','Erkek','05424565863','Yolcu') --Rezervasyon
insert into booking values(3,'Rezervasyon',2,'2','Serdar','Erkek','05414565864','Yolcu') --Rezervasyon
insert into booking values(4,'Rezervasyon',3,'3','Sevil','Kadýn','05474565867','Yolcu') --Rezervasyon
insert into booking values(5,'Rezervasyon',10,'10','Sema','Kadýn','05423655823','Yolcu1') --Rezervasyon
insert into booking values(6,'Rezervasyon',15,'15','Mahmut','Erkek','05315555844','Yolcu') --Rezervasyon
insert into booking values(7,'Rezervasyon',5,'5','Mustafa','Erkek','05435825845','Yolcu') --Rezervasyon
insert into booking values(8,'Rezervasyon',7,'7','Mehmet','Erkek','05324565812','Yolcu') --Rezervasyon
insert into booking values(9,'Rezervasyon',9,'9','Necla','Kadýn','05432115856','Yolcu') --Rezervasyon
insert into booking values(10,'Rezervasyon',13,'13','Medine','Kadýn','05435285856','Yolcu') --Rezervasyon
--Cancellation tablosu için veri giriþi.
insert into cancellation values(1,200.2,'2021-08-08','Ýptal') --Ýptal
insert into cancellation values(2,110.10,'2021-08-04','Ýptal') --Ýptal
insert into cancellation values(3,20.10,'2021-08-07','Ýptal') --Ýptal
insert into cancellation values(4,30.20,'2021-08-18','Ýptal') --Ýptal
insert into cancellation values(5,40.10,'2021-08-12','Ýptal') --Ýptal
insert into cancellation values(6,150.20,'2021-08-23','Ýptal') --Ýptal
insert into cancellation values(7,70.10,'2021-08-04','Ýptal') --Ýptal
insert into cancellation values(8,60.75,'2021-08-28','Ýptal') --Ýptal
insert into cancellation values(9,78.10,'2021-08-17','Ýptal') --Ýptal
insert into cancellation values(10,80.00,'2021-08-12','Ýptal') --Ýptal
--Roombooking tablosu için veri giriþi.
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
--Rating tablosu için veri giriþi.
insert into rating values('Derece',1,1,1,'Puanlama','Berbat','2021-09-11','Hizmet')--Derece
insert into rating values('Derece',2,2,7,'Puanlama','Harika','2021-10-05','Hizmet')--Derece
insert into rating values('Derece',3,3,3,'Puanlama','Beðenmedim','2021-06-12','Hizmet')--Derece
insert into rating values('Derece',4,4,2,'Puanlama','Kötü','2021-02-14','Hizmet')--Derece
insert into rating values('Derece',5,5,4,'Puanlama','Geliþebilir','2021-03-21','Hizmet')--Derece
insert into rating values('Derece',6,6,6,'Puanlama','Ýyi','2021-04-25','Hizmet')--Derece
insert into rating values('Derece',7,7,8,'Puanlama','Beðendim','2021-05-05','Hizmet')--Derece
insert into rating values('Derece',8,8,10,'Puanlama','Mükemmel','2021-07-02','Hizmet')--Derece
insert into rating values('Derece',9,9,9,'Puanlama','Süper','2021-07-19','Hizmet')--Derece
insert into rating values('Derece',10,10,5,'Puanlama','Normal','2021-08-14','Hizmet')--Derece
--Tourpackage tablosu için veri giriþi.
insert into tourpackage values(1,'Karadeniz','Seyehat','www.youtube/a.com','a','Tatil','Yemek','1',200.2)--Tur Paket
insert into tourpackage values(2,'Karadeniz','Seyehat','www.youtube/b.com','b','Tatil','Yemek','0',210.1)--Tur Paket
insert into tourpackage values(3,'Karadeniz','Seyehat','www.youtube/c.com','c','Tatil','Yemek','0',230.3)--Tur Paket
insert into tourpackage values(4,'Karadeniz','Seyehat','www.youtube/d.com','d','Tatil','Yemek','2',300.44)--Tur Paket
insert into tourpackage values(5,'Ýç Anadolu','Seyehat','www.youtube/e.com','e','Tatil','Yemek','1',440.5)--Tur Paket
insert into tourpackage values(6,'Ýç Anadolu','Seyehat','www.youtube/f.com','f','Tatil','Yemek','0',450.66)--Tur Paket
insert into tourpackage values(7,'Güneydoðu Anadolu','Seyehat','www.youtube/g.com','g','Tatil','Yemek','1',510.78)--Tur Paket
insert into tourpackage values(8,'Güneydoðu Anadolu','Seyehat','www.youtube/h.com','h','Tatil','Yemek','2',600.50)--Tur Paket
insert into tourpackage values(9,'Doðu Anadolu','Seyehat','www.youtube/s','s.com','Tatil','Yemek','0',270.20)--Tur Paket
insert into tourpackage values(10,'Doðu Anadolu','Seyehat','www.youtube/n','n.com','Tatil','Yemek','0',480.15)--Tur Paket
--Ýtinerary tablosu için veri giriþi.
insert into itinerary values(1,1,'Güzergah','Karadeniz','a')--Güzergah
insert into itinerary values(2,3,'Güzergah','Karadeniz','b')--Güzergah
insert into itinerary values(3,5,'Güzergah','Karadeniz','c')--Güzergah
insert into itinerary values(4,7,'Güzergah','Karadeniz','d')--Güzergah
insert into itinerary values(5,8,'Güzergah','Ýç Anadolu','e')--Güzergah
insert into itinerary values(6,11,'Güzergah','Ýç Anadolu','f')--Güzergah
insert into itinerary values(7,13,'Güzergah','Güneydoðu Anadolu','g')--Güzergah
insert into itinerary values(8,15,'Güzergah','Güneydoðu Anadolu','h')--Güzergah
insert into itinerary values(9,17,'Güzergah','Doðu Anadolu','s')--Güzergah
insert into itinerary values(10,19,'Güzergah','Doðu Anadolu','n')--Güzergah
--Tourpackageplace tablosu için veri giriþi.
insert into tourpackageplace values(1,'Karadeniz','Yayla','543431','Yer')--Konum
insert into tourpackageplace values(2,'Karadeniz','Yayla','542462','Yer')--Konum
insert into tourpackageplace values(3,'Karadeniz','Yayla','531435','Yer')--Konum
insert into tourpackageplace values(4,'Karadeniz','Yayla','542412','Yer')--Konum
insert into tourpackageplace values(5,'Ýç Anadolu','Tarihi Yer','554413','Yer')--Konum
insert into tourpackageplace values(6,'Ýç Anadolu','Tarihi Yer','562444','Yer')--Konum
insert into tourpackageplace values(7,'Güneydoðu Anadolu','Makam','521455','Yer')--Konum
insert into tourpackageplace values(8,'Güneydoðu Anadolu','Makam','531435','Yer')--Konum
insert into tourpackageplace values(9,'Doðu Anadolu','Göl','523448','Yer')--Konum
insert into tourpackageplace values(10,'Doðu Anadolu','Göl','534429','Yer')--Konum
--Traveloption tablosu için veri giriþi.
insert into traveloption values(1,'Havalimaný','Yayla','Ucak','Hoþgeldiniz')--Seçenek
insert into traveloption values(2,'Havalimaný','Yayla','Ucak','Hoþgeldiniz')--Seçenek
insert into traveloption values(3,'Havalimaný','Yayla','Ucak','Hoþgeldiniz')--Seçenek
insert into traveloption values(4,'Havalimaný','Yayla','Ucak','Hoþgeldiniz')--Seçenek
insert into traveloption values(5,'Havalimaný','Tarihi Yer','Ucak','Hoþgeldiniz')--Seçenek
insert into traveloption values(6,'Otogar','Tarihi Yer','Otobüs','Hoþgeldiniz')--Seçenek
insert into traveloption values(7,'Otogar','Makam','Otobüs','Hoþgeldiniz')--Seçenek
insert into traveloption values(8,'Otogar','Makam','Otobüs','Hoþgeldiniz')--Seçenek
insert into traveloption values(9,'Otogar','Göl','Otobüs','Hoþgeldiniz')--Seçenek
insert into traveloption values(10,'Havalimaný','Göl','Ucak','Hoþgeldiniz')--Seçenek


--Her bir müþterinin kaç kez ayný otelde kaç kez kaldýðýný gösteren sql kodu yazýnýz.
select locationid from hotel

--En çok beðeni alan otelin bilgilerini gösteren sql kodu yazýnýz.
SELECT MAX( hotelid )
  FROM hotel
 WHERE hotelid < ( SELECT MAX( hotelid )
                 FROM hotel )

--Her bir otelin oda özelliklerini ve ücretlerini listeleyen kodu yazýnýz.
select hotelid,roomtype,roomtariff from roomtype

--En çok yorum ve beðenisi olan ilk 5 müþterinin bilgilerini ve beðeni ve yorum sayýlarýný listeleyen kodu yazýnýz.
select customerid,rating,comments from rating where rating >5

--Her otel için kullaným ve beðeni bilgilerine göre en çok tercih edilen odalarýný büyükten küçüðe doðru listeleyen sql kodu yazýnýz.
SELECT roomtypeid,roomtype
FROM roomtype
ORDER BY roomtypeid ASC

--Her bir müþterilerin bütün zamanlarda toplam harcama bilgisini hesaplayýp sýralý bir þekilde gösteren sql kodu yazýnýz.
SELECT customerid,billingcost
FROM billing
ORDER BY billingcost DESC

