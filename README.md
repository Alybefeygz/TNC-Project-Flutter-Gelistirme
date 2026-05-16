# Mini Katalog Uygulaması

Flutter ile hazırlanmış, eğitim amaçlı basit bir mini katalog uygulamasıdır.
Uygulamada ürünler lokal JSON dosyasından okunur, ana sayfada kart yapısıyla
listelenir, arama/filtreleme yapılabilir ve ürün detay sayfasında basit sepet
state simülasyonu gösterilir.

## Canlı Demo

Uygulama Vercel üzerinde canlı olarak yayınlanmaktadır:

[https://tnc-project-flutter-gelistirme.vercel.app](https://tnc-project-flutter-gelistirme.vercel.app)

## Özellikler

- Ana sayfa ve ürün listeleme ekranı
- GridView tabanlı ürün kartları
- Ürün detay sayfası
- Navigator ile sayfa geçişi
- Route Arguments ile seçilen ürünü detay sayfasına taşıma
- Lokal JSON veri simülasyonu
- Asset görsel yönetimi
- Ürün adı ve kategoriye göre arama/filtreleme
- Sepete ekleme state simülasyonu
- Sade, mobil uyumlu Flutter UI tasarımı

## Kullanılan Teknolojiler

- Flutter 3.41.9
- Dart 3.11.5
- Material Design
- Lokal JSON
- Image.asset
- Vercel

Ekstra paket kullanılmamıştır. Proje Flutter'ın varsayılan Material yapısı ile
geliştirilmiştir.

## Proje Klasör Yapısı

```text
lib/
  main.dart
  app.dart
  models/
    product.dart
  data/
    product_repository.dart
  pages/
    home_page.dart
    product_detail_page.dart
  widgets/
    product_card.dart
  theme/
    app_theme.dart

assets/
  data/
    products.json
  images/

screenshots/
```

## Kurulum

Projeyi bilgisayarına aldıktan sonra proje klasörüne gir:

```bash
cd mini_katalog_uygulamasi
```

Bağımlılıkları yükle:

```bash
flutter pub get
```

Kod analizini çalıştır:

```bash
flutter analyze
```

Testleri çalıştır:

```bash
flutter test
```

Uygulamayı Chrome üzerinde çalıştır:

```bash
flutter run -d chrome
```

Chrome debug bağlantısı sorun çıkarırsa web-server ile çalıştır:

```bash
flutter run -d web-server --web-port 8080
```

Sonra tarayıcıda aç:

```text
http://localhost:8080
```

## Ekran Görüntüleri

Ana sayfa:

![Ana Sayfa](screenshots/home.png)

Ürün detay sayfası:

![Ürün Detay](screenshots/detail.png)

Sepete ürün eklenmiş hali:

![Sepet State](screenshots/cart.png)

## Veri Kaynağı

Ürün verileri lokal olarak tutulur:

```text
assets/data/products.json
```

Her ürün için temel alanlar:

- id
- name
- description
- price
- image
- category


