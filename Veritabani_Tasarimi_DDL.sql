

-- 1. Kullanıcılar (Müşteriler) Tablosu
CREATE TABLE Kullanicilar (
    KullaniciID INT IDENTITY(1,1) PRIMARY KEY, 
    AdSoyad VARCHAR(100) NOT NULL, 
    Email VARCHAR(100) NOT NULL UNIQUE, 
    Telefon VARCHAR(15) NOT NULL UNIQUE, 
    IsVerified BIT DEFAULT 0, 
    IsActive BIT DEFAULT 1 
);

-- 2. Restoranlar Tablosu
CREATE TABLE Restoranlar (
    RestoranID INT IDENTITY(1,1) PRIMARY KEY, [cite: 13]
    RestoranAdi VARCHAR(100) NOT NULL, [cite: 16]
    Adres VARCHAR(255) NOT NULL, [cite: 16]
    RestoranPuani DECIMAL(2,1) DEFAULT 5.0,
    ToplamCiro DECIMAL(10,2) DEFAULT 0.0,
    IsActive BIT DEFAULT 1, [cite: 20]
  
    CONSTRAINT CHK_RestoranPuani CHECK (RestoranPuani BETWEEN 1.0 AND 5.0) [cite: 14, 15]
);

-- 3. Ürünler (Menü) Tablosu
CREATE TABLE Urunler (
    UrunID INT IDENTITY(1,1) PRIMARY KEY, [cite: 13]
    RestoranID INT NOT NULL, 
    UrunAdi VARCHAR(100) NOT NULL, [cite: 16]
    Aciklama VARCHAR(255),
    Fiyat DECIMAL(10,2) NOT NULL, [cite: 16]
    IsActive BIT DEFAULT 1, 
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID), 
    
    CONSTRAINT CHK_UrunFiyat CHECK (Fiyat > 0) [cite: 14]
);

-- 4. Kuryeler Tablosu
CREATE TABLE Kuryeler (
    KuryeID INT IDENTITY(1,1) PRIMARY KEY, [cite: 13]
    AdSoyad VARCHAR(100) NOT NULL, [cite: 16]
    Telefon VARCHAR(15) NOT NULL UNIQUE, [cite: 16]
    IsActive BIT DEFAULT 1 [cite: 20]
);

-- 5. Siparişler (Ana Bilgi) Tablosu
CREATE TABLE Siparisler (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY, [cite: 13]
    KullaniciID INT NOT NULL, 
    RestoranID INT NOT NULL, 
    KuryeID INT, 
    SiparisTarihi DATETIME DEFAULT GETDATE(),
    SiparisDurumu VARCHAR(50) DEFAULT 'Hazırlanıyor', 
    ToplamTutar DECIMAL(10,2) NOT NULL, [cite: 16]
    IsAskidanAlindi BIT DEFAULT 0, 
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID), [cite: 13]
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID), [cite: 13]
    FOREIGN KEY (KuryeID) REFERENCES Kuryeler(KuryeID) [cite: 13]
);

-- 6. Sipariş Detayları (Arayüz/İlişki) Tablosu (M:N İlişki Çözümü)
CREATE TABLE SiparisDetaylari (
    SiparisDetayID INT IDENTITY(1,1) PRIMARY KEY, [cite: 13]
    SiparisID INT NOT NULL, [cite: 16]
    UrunID INT NOT NULL, [cite: 16]
    Adet INT NOT NULL DEFAULT 1,
    BirimFiyat DECIMAL(10,2) NOT NULL, [cite: 16]
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID), [cite: 13]
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID) [cite: 13]
);

-- 7. ÖZEL MODÜL: Askıda Yemek Havuzu Tablosu
CREATE TABLE AskidaYemekHavuzu (
    BagisID INT IDENTITY(1,1) PRIMARY KEY, 
    BagisciKullaniciID INT, 
    UrunID INT NOT NULL,
    Adet INT NOT NULL DEFAULT 1, 
    BagisTarihi DATETIME DEFAULT GETDATE(),
    IsAnonymous BIT DEFAULT 0, 
    IsUsed BIT DEFAULT 0, 
    FOREIGN KEY (BagisciKullaniciID) REFERENCES Kullanicilar(KullaniciID), [cite: 13]
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID) [cite: 13]
);


CREATE INDEX IX_Kullanici_Email ON Kullanicilar(Email); [cite: 32]


CREATE INDEX IX_Siparis_Durum ON Siparisler(SiparisDurumu); [cite: 32]
