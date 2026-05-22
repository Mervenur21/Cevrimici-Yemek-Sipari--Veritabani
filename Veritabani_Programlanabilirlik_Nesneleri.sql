-- ========================================================
-- 4. GÜN: PROGRAMLANABİLİRLİK (VIEW & TRIGGER NESNELERİ)
-- ========================================================

-- 1. AŞAMA: GÖRÜNÜMLER (VIEW TASARIMI)

-- VIEW 1: Aktif Restoran Menüleri Görünümü
-- PDF İsteri: Sistemde aktif olan (Soft delete edilmemiş) restoranları ve ürünlerini listeler.
GO
CREATE VIEW vw_AktifMenuler AS
SELECT 
    R.RestoranAdi,
    R.RestoranPuani,
    U.UrunAdi,
    U.Fiyat
FROM Urunler U
INNER JOIN Restoranlar R ON U.RestoranID = R.RestoranID
WHERE U.IsActive = 1 AND R.IsActive = 1;
GO

-- VIEW 2: Askıda Yemek Havuz Durumu Görünümü
-- PDF İsteri: Havuzda bekleyen ve henüz ihtiyaç sahipleri tarafından tüketilmemiş bağışları listeler.
GO
CREATE VIEW vw_AskidaYemekDurumu AS
SELECT 
    A.BagisID,
    U.UrunAdi,
    A.Adet,
    A.BagisTarihi,
    CASE WHEN A.IsAnonymous = 1 THEN 'Anonim Bağışçı' ELSE K.AdSoyad END AS Bagisci
FROM AskidaYemekHavuzu A
INNER JOIN Urunler U ON A.UrunID = U.UrunID
LEFT JOIN Kullanicilar K ON A.BagisciKullaniciID = K.KullaniciID
WHERE A.IsUsed = 0;
GO


-- 2. AŞAMA: TETİKLEYİCİLER (TRIGGER TASARIMI)

-- TRIGGER 1: Sipariş Teslim Edildiğinde Restoran Cirosunu Otomatik Güncelleyen Tetikleyici
GO
CREATE TRIGGER trg_SiparisTeslimCiroGuncelle
ON Siparisler
AFTER UPDATE
AS
BEGIN
    -- Eğer sipariş durumu 'Teslim Edildi' olarak güncellendiyse restoran cirosunu artır
    IF UPDATE(SiparisDurumu)
    BEGIN
        UPDATE Restoranlar
        SET ToplamCiro = ToplamCiro + inserted.ToplamTutar
        FROM Restoranlar R
        INNER JOIN inserted ON R.RestoranID = inserted.RestoranID
        WHERE inserted.SiparisDurumu = 'Teslim Edildi';
    END
END;
GO

-- TRIGGER 2: Askıdan Yemek Alındığında Havuz Durumunu Güncelleyen Tetikleyici
GO
CREATE TRIGGER trg_AskidanYemekKullanildi
ON Siparisler
AFTER INSERT
AS
BEGIN
    -- Eğer sisteme düşen yeni siparişte IsAskidanAlindi bayrağı aktifse havuzdaki stoğu düşer
    IF EXISTS (SELECT 1 FROM inserted WHERE IsAskidanAlindi = 1)
    BEGIN
        UPDATE TOP (1) AskidaYemekHavuzu
        SET IsUsed = 1
        FROM AskidaYemekHavuzu A
        INNER JOIN SiparisDetaylari SD ON A.UrunID = SD.UrunID
        INNER JOIN inserted I ON SD.SiparisID = I.SiparisID
        WHERE A.IsUsed = 0;
    END
END;
GO
