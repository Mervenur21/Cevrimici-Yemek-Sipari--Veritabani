# Çevrimiçi Yemek Sipariş Platformu ve Askıda Yemek Modülü Veritabanı Tasarımı

Bu proje, VTYS-1 dersi kapsamında geliştirilen, 3. Normal Form (3NF) kurallarına uygun bir ilişkisel veritabanı tasarımıdır.

## 🛠️ 1. Gün: İş Kuralları ve Sistem Mimarisi

### Klasik Modüllerin İş Kuralları:
1. **Müşteriler:** Her müşterinin benzersiz bir ID'si, adı, e-postası ve telefonu bulunur. Bir müşteri birden fazla sipariş verebilir (1:N İlişki).
2. **Restoranlar:** Her restoranın adı, adresi ve puanı (1-5 arası) tutulur. Bir restoranda birden fazla yemek bulunabilir (1:N İlişki).
3. **Ürünler (Menü):** Yemeklerin adı, açıklaması ve fiyatı (fiyat > 0) bulunur. Silinen ürünler sistemden fiziksel olarak silinmez, `IsActive = 0` yapılarak gizlenir (Soft Delete).
4. **Siparişler ve Detayları:** Bir siparişte birden fazla yemek olabilir. Bu yüzden `Siparisler` (ana bilgi) ve `SiparisDetaylari` (yemek adedi ve o anki fiyat) olarak iki tablo halinde kurgulanmıştır (M:N İlişki çözümü).
5. **Kuryeler:** Siparişlerin teslimatını yaparlar. Bir kurye birden fazla siparişe atanabilir.

### 🎁 Özel Modül: "Askıda Yemek" Havuz Mantığı
- **Bağış Süreci:** Hayırsever bir müşteri sipariş verirken sepetine "Askıda Yemek" bağışı ekleyebilir. Sipariş tamamlandığında bu bağış `AskidaYemekHavuzu` tablosuna aktarılır. Bağışçı isterse kimliğini gizleyebilir (`IsAnonymous = 1`).
- **Yararlanma Süreci:** Sistemde ihtiyaç sahibi olarak doğrulanmış kullanıcılar (`IsVerified = 1`), sepete ekledikleri ürünleri bu havuzda bakiye veya ürün varsa 0 TL karşılığında (ücretsiz) alabilirler.
- **Bakiye Düşme Mantığı:** İhtiyaç sahibi siparişi onayladığında, sistem otomatik olarak havuzdaki mevcut stoktan/bakiyeden düşüş yapacaktır (Trigger ile otomatize edilecektir).
