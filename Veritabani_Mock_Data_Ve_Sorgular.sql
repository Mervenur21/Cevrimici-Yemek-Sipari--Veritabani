-- ========================================================
-- 3. GÜN: VERİ MANİPÜLASYONU (DML - MOCK DATA) & GELİŞMİŞ SORGULAR (DQL)
-- ========================================================

-- 1. AŞAMA: SAHTE VERİLERİN YÜKLENMESİ (INSERT INTO)

-- 20 Tane Sahte Müşteri (Sonuncu kullanıcı onaylanmış ihtiyaç sahibidir)
INSERT INTO Kullanicilar (AdSoyad, Email, Telefon, IsVerified) VALUES
('Ahmet Yılmaz', 'ahmet@gmail.com', '05551112233', 0),
('Mehmet Kaya', 'mehmet@gmail.com', '05552223344', 0),
('Ayşe Demir', 'ayse@gmail.com', '05553334455', 0),
('Fatma Çelik', 'fatma@gmail.com', '05554445566', 0),
('Can Yıldız', 'can@gmail.com', '05555556677', 0),
('Merve Öztürk', 'merve@gmail.com', '05556667788', 0),
('Ali Şahin', 'ali@gmail.com', '05557778899', 0),
('Zeynep Aydın', 'zeynep@gmail.com', '05558889900', 0),
('Mustafa Arslan', 'mustafa@gmail.com', '05559990011', 0),
('Emine Koç', 'emine@gmail.com', '05550001122', 0),
('Ömer Bulut', 'omer@gmail.com', '05321112233', 0),
('Aslı Güneş', 'asli@gmail.com', '05322223344', 0),
('Burak Deniz', 'burak@gmail.com', '05323334455', 0),
('Gamze Aksoy', 'gamze@gmail.com', '05324445566', 0),
('Hakan Yurt', 'hakan@gmail.com', '05325556677', 0),
('Selin Avcı', 'selin@gmail.com', '05326667788', 0),
('Gökhan Tekin', 'gokhan@gmail.com', '05327778899', 0),
('Hilal Çetin', 'hilal@gmail.com', '05328889900', 0),
('Murat Yaman', 'murat@gmail.com', '05329990011', 0),
('İhtiyaç Sahibi Kullanıcı', 'ihrac@gmail.com', '05320001122', 1);

-- 5 Tane Restoran
INSERT INTO Restoranlar (RestoranAdi, Adres, RestoranPuani) VALUES
('Lezzet Kebap Salonu', 'Van Merkez No 5', 4.7),
('Dostlar Pide & Pizza', 'İpekyolu Caddesi No 12', 4.2),
('Burger Sarayı', 'Kampüs Alanı A Blok', 4.5),
('Ev Yemekleri Dünyası', 'Edremit Sahil Yolu', 4.8),
('Yeşil Salata & Makarna', 'Maraş Caddesi No 89', 3.9);

-- 50 Farklı Ürün (Her restorana 10'ar tane ürün ekleniyor)
INSERT INTO Urunler (RestoranID, UrunAdi, Aciklama, Fiyat) VALUES
(1, 'Adana Kebap', 'Zırh kıyması, közlenmiş biber ile', 220.00),
(1, 'Urfa Kebap', 'Acısız orijinal kebap', 220.00),
(1, 'Tavuk Şiş', 'Özel soslu tavuk göğsü', 180.00),
(1, 'Beyti Kebap', 'Lavaş içinde, soslu ve yoğurtlu', 260.00),
(1, 'Lahmacun', 'Çıtır Antep lahmacunu', 60.00),
(1, 'Mercimek Çorbası', 'Tereyağlı süzme çorba', 70.00),
(1, 'Gavurdağı Salatası', 'Cevizli ve nar ekşili', 90.00),
(1, 'Künefe', 'Hatay usulü bol peynirli', 120.00),
(1, 'Ayran', 'Yayık ayranı 300ml', 25.00),
(1, 'Kutu Kola', 'Soğuk içecek 330ml', 40.00),

(2, 'Kıymalı Pide', 'Bol malzemeli Karadeniz pidesi', 150.00),
(2, 'Kuşbaşılı Pide', 'Özel marine etli', 180.00),
(2, 'Kaşarlı Pide', 'Eriyen hakiki kaşar peyniri', 140.00),
(2, 'Karışık Pizza', 'Sucuk, sosis, mısır, zeytin, mantar', 200.00),
(2, 'Margarita Pizza', 'Özel domates sosu ve fesleğen', 160.00),
(2, 'Vejetaryen Pizza', 'Mevsim sebzeleri ile', 175.00),
(2, 'Çorba', 'Günün sıcak çorbası', 65.00),
(2, 'Sütlaç', 'Fırınlanmış anne sütlacı', 80.00),
(2, 'Şalgam Suyu', 'Acılı/Acısız 330ml', 25.00),
(2, 'Fanta', 'Soğuk içecek 330ml', 40.00),

(3, 'Klasik Burger', '150gr köfte, marul, turşu, sos', 180.00),
(3, 'Cheeseburger', 'Cheddar peynirli burger', 195.00),
(3, 'Tavuk Burger', 'Çıtır tavuk fileto, özel sos', 160.00),
(3, 'Barbekü Burger', 'Köz soğan ve barbekü sos', 210.00),
(3, 'Double Burger', '300gr çift köfteli dev burger', 280.00),
(3, 'Patates Kızartması', 'Baharatlı tırtıklı patates', 70.00),
(3, 'Soğan Halkası', '8 adet çıtır halka', 55.00),
(3, 'Tavuk Popcorn', 'Kova içinde çıtır tavuk topları', 110.00),
(3, 'Meyveli Soda', 'Limonlu/Çilekli', 20.00),
(3, 'Sprite', 'Soğuk içecek 330ml', 40.00),

(4, 'Kuru Fasulye', 'Erzincan dermason fasulyesi', 110.00),
(4, 'Pirinç Pilavı', 'Tereyağlı baldo pirinç', 60.00),
(4, 'İzmir Köfte', 'Fırında patatesli soslu köfte', 140.00),
(4, 'Karnıyarık', 'Köz patlıcan içinde kıymalı harç', 135.00),
(4, 'Tavuk Sote', 'Mantar ve biber eşliğinde', 130.00),
(4, 'Cacık', 'Zeytinyağlı ve nane serpiştirilmiş', 45.00),
(4, 'Yaprak Sarma', 'Zeytinyağlı ev usulü', 85.00),
(4, 'Kadayıf Dolması', 'Erzurum usulü cevizli', 100.00),
(4, 'Ev Yapımı Limonata', 'Nane yapraklı taze sıkım', 45.00),
(4, 'Su', 'Doğal kaynak suyu 500ml', 15.00),

(5, 'Sezar Salatası', 'Izgara tavuk dilimleri ve kruton ile', 165.00),
(5, 'Ton Balıklı Salata', 'Akdeniz yeşillikleri ve mısır', 170.00),
(5, 'Fettuccine Alfredo', 'Tavuklu, mantarlı, krema soslu', 190.00),
(5, 'Spaghetti Bolognese', 'Özel kıymalı domates soslu', 180.00),
(5, 'Penne Arrabbiata', 'Acılı domates soslu italyan makarnası', 160.00),
(5, 'Günün Çorbası', 'Şefin özel tarifi', 70.00),
(5, 'Akdeniz Salatası', 'Beyaz peynir ve siyah zeytinli', 110.00),
(5, 'Tiramisu', 'Orijinal mascarpone peynirli', 115.00),
(5, 'Büyük Ayran', 'Yayık ayranı 500ml', 35.00),
(5, 'İçim Buzlu Çay', 'Şeftali/Limon seçeneğiyle', 40.00);

-- 5 Tane Kurye
INSERT INTO Kuryeler (AdSoyad, Telefon) VALUES
('Hüseyin Can', '05441112233'),
('Caner Bakır', '05442223344'),
('Serkan Alp', '05443334455'),
('Deniz Kurt', '05444445566'),
('Fatih Solak', '05445556677');

-- 100 Sipariş Hareketi (Sistem test edilebilsin diye toplu giriş yapısı)
INSERT INTO Siparisler (KullaniciID, RestoranID, KuryeID, SiparisDurumu, ToplamTutar, IsAskidanAlindi)
SELECT TOP 100 
    (ABS(CHECKSUM(NEWID())) % 19) + 1, 
    (ABS(CHECKSUM(NEWID())) % 5) + 1,   
    (ABS(CHECKSUM(NEWID())) % 5) + 1,   
    'Teslim Edildi', 
    250.00, 
    0 
FROM sys.all_columns;

-- Siparişlerin detay satırlarını bağlama (120 adet detay kaydı)
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
SELECT TOP 120 
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 100 + 1, 
    (ABS(CHECKSUM(NEWID())) % 50) + 1, 
    (ABS(CHECKSUM(NEWID())) % 3) + 1,  
    100.00
FROM sys.all_columns;

-- Askıda Yemek Havuzu İçin Birkaç Başlangıç Bağışı
INSERT INTO AskidaYemekHavuzu (BagisciKullaniciID, UrunID, Adet, IsAnonymous, IsUsed) VALUES
(1, 1, 2, 0, 0), 
(3, 5, 5, 1, 0), 
(5, 11, 3, 1, 1); 


-- ========================================================
-- 2. AŞAMA: İLERİ DÜZEY ANALİTİK SORGULAR (DQL)
-- ========================================================

-- S_ISTER_1: JOIN Kullanımı (Detaylı Sipariş Fişi Sorgusu)
SELECT 
    S.SiparisID,
    K.AdSoyad AS MusteriAdi,
    R.RestoranAdi,
    S.SiparisTarihi,
    S.ToplamTutar,
    Kur.AdSoyad AS KuryeAdi,
    S.SiparisDurumu
FROM Siparisler S
INNER JOIN Kullanicilar K ON S.KullaniciID = K.KullaniciID
INNER JOIN Restoranlar R ON S.RestoranID = R.RestoranID
LEFT JOIN Kuryeler Kur ON S.KuryeID = Kur.KuryeID;

-- S_ISTER_2: Agregasyon ve Gruplama (GROUP BY & HAVING Analitik Sorgu)
SELECT 
    R.RestoranAdi,
    COUNT(S.SiparisID) AS ToplamSiparisSayisi,
    SUM(S.ToplamTutar) AS ToplamCiro,
    AVG(S.ToplamTutar) AS OrtalamaSepetTutari
FROM Siparisler S
INNER JOIN Restoranlar R ON S.RestoranID = R.RestoranID
GROUP BY R.RestoranAdi
HAVING COUNT(S.SiparisID) > 10;

-- S_ISTER_3: Alt Sorgu (Subquery - EXISTS / IN Yapısı)
SELECT KullaniciID, AdSoyad, Email 
FROM Kullanicilar K
WHERE EXISTS (
    SELECT 1 FROM Siparisler S WHERE S.KullaniciID = K.KullaniciID
) 
AND K.KullaniciID NOT IN (
    SELECT DISTINCT BagisciKullaniciID FROM AskidaYemekHavuzu WHERE BagisciKullaniciID IS NOT NULL
);

-- S_ISTER_4: Soft Delete Mantığı Doğrulaması
UPDATE Urunler SET IsActive = 0 WHERE UrunID = 5; 
SELECT * FROM Urunler WHERE IsActive = 1;
