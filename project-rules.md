Flutter Günlük Eğitim – Proje Çıktısı Raporu
1. Projenin Amacı ve Genel Tanımı
Bu eğitim kapsamında öğrenciler, Flutter kullanarak temel seviyede bir mobil
uygulama geliştirme sürecini baştan sona öğreneceklerdir.
Hafta sonunda her öğrenci, “Mini Katalog Uygulaması” adında basit fakat
profesyonel bir uygulama taslağı geliştirmiş olacaktır.
Bu proje; widget yapısı, sayfa geçişleri, temel UI tasarımı, veri modeli oluşturma ve
proje klasörleme mantığını öğretmeyi hedefler.

2. Kullanılacak Araçlar ve Geliştirme Ortamı
Eğitim boyunca aşağıdaki araçlar zorunlu olarak kullanılacaktır:
Geliştirme Araçları
• Flutter SDK
• Dart SDK
• Visual Studio Code
• Android Studio (Emulator için)
• Android Emulator veya Fiziksel Android Cihaz
Flutter Paketleri
• material.dart (Varsayılan)
• Ekstra paket kullanımı yapılmayacaktır (temel eğitim kapsamı).

3. Eğitim Haftası İçeriği ve Öğrenme Hedefleri
Gün 1: Flutter’a Giriş
- Flutter nedir, hangi uygulamalar yapılır
- Flutter mimarisi, Dart neden seçildi
- Gerekli araçlar (SDK, VS Code, Android Studio)
- Proje oluşturma ve proje yapısının tanıtımı

- Stateless ve Stateful widget mantığı
- İlk “Hello World” uygulaması
Gün 2: Dart Temelleri ve Temel Widget'lar
- Dart syntax, değişkenler, veri tipleri, fonksiyonlar
- Collection yapıları (List, Set, Map)
- Null Safety
- Text, Container, Row, Column widget'ları
- Padding, Margin, Expanded, Align kullanımı
- Kart yapısı (Card, ListTile) ve butonlar
Gün 3: Sayfa Mantığı ve Navigasyon
- Widget ağacı ve context
- Navigator.push / pop
- Route kavramı, MaterialPageRoute, Named Routes
- Sayfalar arası veri taşıma (Route Arguments)
Gün 4: Listeleme ve JSON Yapısı (Simülasyon)
- JSON mantığı ve model sınıfı oluşturma
- fromJson/toJson temel mantığı
- ListView.builder ile liste oluşturma
- Görsel ekleme, Image.asset kullanımı
- Basit arama ve filtreleme mantığı
Gün 5: Mini Katalog Uygulaması Geliştirme
- Ekran tasarım planı
- Ürün liste ekranı oluşturma
- GridView ile ürün kartları
- Ürün detayı sayfası
- Sepet butonu ile basit state güncelleme (simülasyon)

- Projenin final halinin hazırlanması

4. Proje Aşamaları ve Günlük İlerleme Planı
Aşama 1 – Kurulum ve Temel Yapı (Gün 1):
- Flutter SDK kurulumu
- Yeni proje oluşturma
- Widget mantığını kavrama
Aşama 2 – Dart ve UI Temelleri (Gün 2):
- Temel widget'larla basit ekran tasarımı
- Görsel, ikon, kart, liste elemanları
Aşama 3 – Sayfalar ve Navigasyon (Gün 3):
- Yeni sayfa oluşturma
- Sayfalar arası geçişler ve argument taşıma
Aşama 4 – Veri Yapıları ve Listeleme (Gün 4):
- Ürün listesi için model sınıfı
- JSON simülasyonundan veri okuma
- Dinamik liste oluşturma
Aşama 5 – Mini Katalog Uygulaması (Gün 5):
- Ana sayfa, ürün listesi ve detay ekranı
- Sepet sistemi simülasyonu
- Basit UI teması oluşturma ve proje finali

5. Kullanılan Veri Kaynakları ve Eğitim Amaçlı Açıklama
Bu proje kapsamında kullanılan aşağıdaki kaynaklar eğitim ve demo amaçlıdır:
• Banner görseli: https://wantapi.com/assets/banner.png
• Ürün verileri: https://wantapi.com/products.php

Bu adresler gerçek bir e-ticaret altyapısını temsil etmez. API kullanımı, veri modelleme
ve listeleme mantığını öğretmek amacıyla kullanılmıştır.
Alternatif Test API Önerileri (Opsiyonel)
• Fake Store API: https://fakestoreapi.com/products
• DummyJSON: https://dummyjson.com/products

6. Örnek Uygulama Ekran Görüntüleri

7. Proje Çıktıları
Bu eğitim sonunda öğrenciler aşağıdaki çıktılara sahip olacaktır:
- Çalışan bir “Mini Katalog Uygulaması”
- Ana sayfa – ürün listesi – ürün detayı ekran yapısı
- Sayfa geçişleri (Navigator)
- Route Arguments kullanımı
- GridView ile kart tabanlı tasarım
- Basit state güncelleme örneği

- Proje klasör yapısını doğru kullanabilme
- Asset yönetimi (görseller, JSON)

8. Beklenen Sonuçlar ve Öğrenci Kazanımları
Flutter haftalık eğitiminin sonunda öğrenciler:
- Flutter’ın temel mimarisini anlayacak
- Widget ağacı ve UI mantığını kavrayacak
- Sayfalar arasında geçiş yapabilecek
- Küçük çaplı projeler geliştirmek için yeterli bilgiye sahip olacak
- Temel bir katalog uygulamasını baştan sona yazabilecek
- Mobil geliştirmenin temel yapı taşlarına hâkim olacaktır.

9. Proje Teslim Şekli ve Değerlendirme Kriterleri
Eğitim sonunda her öğrenciden proje teslimi aşağıdaki şekilde istenecektir:
• Projenin GitHub üzerinde paylaşılmış bir repository URL’i
◦ Repository public olmalıdır.
◦ Proje çalışır durumda olmalı ve README.md dosyası içermelidir.
◦ README içinde:
▪ Proje adı
▪ Kısa açıklama
▪ Kullanılan Flutter sürümü
▪ Çalıştırma adımları yer almalıdır.
• Uygulamaya ait ekran görüntüleri (screenshots)
Not: GitHub URL’i olmayan veya ekran görüntüleri eksik olan projeler teslim edilmiş
sayılmayacaktır.