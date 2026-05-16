-- ========================================================
-- 2. GÜN: VERİ TANIMLAMA (DDL), KISITLAMALAR VE İNDEKSLER
-- ========================================================

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
    RestoranID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranAdi VARCHAR(100) NOT NULL,
    Adres VARCHAR(255) NOT NULL,
    RestoranPuani DECIMAL(2,1) DEFAULT 5.0,
    ToplamCiro DECIMAL(10,2) DEFAULT 0.0,
    IsActive BIT DEFAULT 1,
    CONSTRAINT CHK_RestoranPuani CHECK (RestoranPuani BETWEEN 1.0 AND 5.0)
);

-- 3. Ürünler (Menü) Tablosu
CREATE TABLE Urunler (
    UrunID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT NOT NULL,
    UrunAdi VARCHAR(100) NOT NULL,
    Aciklama VARCHAR(255),
    Fiyat DECIMAL(10,2) NOT NULL,
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    CONSTRAINT CHK_UrunFiyat CHECK (Fiyat > 0)
);

-- 4. Kuryeler Tablosu
CREATE TABLE Kuryeler (
    KuryeID INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad VARCHAR(100) NOT NULL,
    Telefon VARCHAR(15) NOT NULL UNIQUE,
    IsActive BIT DEFAULT 1
);

-- 5. Siparişler (Ana Bilgi) Tablosu
CREATE TABLE Siparisler (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    KullaniciID INT NOT NULL,
    RestoranID INT NOT NULL,
    KuryeID INT,
    SiparisTarihi DATETIME DEFAULT GETDATE(),
    SiparisDurumu VARCHAR(50) DEFAULT 'Hazırlanıyor',
    ToplamTutar DECIMAL(10,2) NOT NULL,
    IsAskidanAlindi BIT DEFAULT 0,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID),
    FOREIGN KEY (KuryeID) REFERENCES Kuryeler(KuryeID)
);

-- 6. Sipariş Detayları Tablosu
CREATE TABLE SiparisDetaylari (
    SiparisDetayID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT NOT NULL,
    UrunID INT NOT NULL,
    Adet INT NOT NULL DEFAULT 1,
    BirimFiyat DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);

-- 7. ÖZEL MODÜL: Askıda Yemek Havuzu Tablosu
CREATE TABLE AskidaYemekHavuzu (
    BagisID INT IDENTITY(1,1) PRIMARY KEY,
    BagisciKullaniciID INT NULL,
    UrunID INT NOT NULL,
    Adet INT NOT NULL DEFAULT 1,
    BagisTarihi DATETIME DEFAULT GETDATE(),
    IsAnonymous BIT DEFAULT 0,
    IsUsed BIT DEFAULT 0,
    FOREIGN KEY (BagisciKullaniciID) REFERENCES Kullanicilar(KullaniciID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);

-- ========================================================
-- PERFORMANS İÇİN İNDEKSLER (INDEXING)
-- ========================================================
CREATE INDEX IX_Kullanici_Email ON Kullanicilar(Email);
CREATE INDEX IX_Siparis_Durum ON Siparisler(SiparisDurumu);
