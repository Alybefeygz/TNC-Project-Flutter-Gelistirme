# Mini Katalog Uygulamasi - Gelistirme Plani

Bu dosya, Mini Katalog Uygulamasi projesinin adim adim hangi sirayla
gelistirilecegini ve her asamada hangi Git komutlarinin kullanilacagini aciklar.

Amac:
- Flutter ile basit ama duzenli bir katalog uygulamasi gelistirmek
- Her gelistirme asamasini ayri branch uzerinde yapmak
- Her asama sonunda branch'i push etmek
- Merge sonrasi main branch'e gecip en guncel kodu cekmek

## Genel Git Akisi

Her asamada ayni temel akis uygulanacaktir:

```bash
git checkout main
git pull origin main
git checkout -b feature/asama-adi
```

Gelistirme tamamlandiktan sonra:

```bash
git status
git add .
git commit -m "Asama aciklamasi"
git push -u origin feature/asama-adi
```

GitHub uzerinden Pull Request acilir ve main branch'e merge edilir.

Merge isleminden sonra:

```bash
git checkout main
git pull origin main
```

Sonraki asamaya gecmeden once main branch guncel olmalidir.

## Asama 0 - Repo Hazirligi

Amac:
- Projenin GitHub reposuna bagli oldugundan emin olmak
- Main branch'in hazir ve guncel olmasi
- Ilk calisma duzenini kontrol etmek

Kontrol edilecekler:
- Proje Git reposu mu?
- Remote origin tanimli mi?
- Main branch var mi?
- README.md mevcut mu?
- project-plans.md mevcut mu?

Terminal komutlari:

```bash
git status
git branch
git remote -v
```

Eger remote yoksa:

```bash
git remote add origin REPO_URL_BURAYA
git branch -M main
git push -u origin main
```

## Asama 1 - Proje Klasor Yapisini Hazirlama

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/01-project-structure
```

Yapilacaklar:
- Flutter baslangic counter yapisi kaldirilacak
- Proje daha duzenli klasorlere ayrilacak
- Kodlar tek `main.dart` icinde kalmayacak
- Temel klasor yapisi hazirlanacak

Planlanan klasor yapisi:

```text
lib/
  main.dart
  models/
  data/
  pages/
  widgets/
  theme/

assets/
  images/
  data/

screenshots/
```

Amac:
- Model dosyalari `models` altinda tutulacak
- Sayfalar `pages` altinda tutulacak
- Tekrar kullanilabilir parcalar `widgets` altinda tutulacak
- JSON ve gorseller `assets` altinda tutulacak

Asama sonunda:

```bash
git status
git add .
git commit -m "Proje klasor yapisi hazirlandi"
git push -u origin feature/01-project-structure
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 2 - Uygulama Temasi ve Ana Yapi

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/02-app-theme-and-shell
```

Yapilacaklar:
- Uygulama adi "Mini Katalog" yapilacak
- `MaterialApp` duzenlenecek
- Basit ve sade bir tema olusturulacak
- Ana ekran baglantisi kurulacak
- Varsayilan Flutter demo basligi kaldirilacak

Kurallar:
- Ekstra paket kullanilmayacak
- Sadece Flutter'in kendi `material.dart` yapisi kullanilacak
- Tema sade, okunabilir ve mobil uyumlu olacak

Asama sonunda:

```bash
git status
git add .
git commit -m "Uygulama temasi ve ana yapi olusturuldu"
git push -u origin feature/02-app-theme-and-shell
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 3 - Urun Modeli Olusturma

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/03-product-model
```

Yapilacaklar:
- Urunler icin model sinifi olusturulacak
- Model icinde temel urun alanlari olacak

Planlanan alanlar:
- `id`
- `name`
- `description`
- `price`
- `image`
- `category`

Modelde bulunmasi gerekenler:
- JSON'dan urun olusturma mantigi
- Urunu JSON formatina cevirme mantigi

Amac:
- JSON simulasyonu icin veri modeli olusturmak
- Urun listeleme ve detay ekraninda ayni modeli kullanmak

Asama sonunda:

```bash
git status
git add .
git commit -m "Urun modeli olusturuldu"
git push -u origin feature/03-product-model
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 4 - JSON Simulasyonu ve Asset Yonetimi

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/04-assets-and-json-data
```

Yapilacaklar:
- `assets/data/products.json` dosyasi hazirlanacak
- Urun verileri JSON formatinda tutulacak
- Banner ve urun gorselleri icin asset klasoru hazirlanacak
- `pubspec.yaml` icine asset yollari eklenecek

Kullanilacak yapi:

```text
assets/
  data/
    products.json
  images/
    banner.png
    product_1.png
    product_2.png
```

Amac:
- API kullanmadan JSON simulasyonu yapmak
- Egitim gereksinimindeki asset yonetimini karsilamak
- `Image.asset` kullanimina uygun yapi kurmak

Asama sonunda:

```bash
git status
git add .
git commit -m "JSON verileri ve asset yapisi eklendi"
git push -u origin feature/04-assets-and-json-data
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 5 - Ana Sayfa ve Urun Listeleme

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/05-home-product-list
```

Yapilacaklar:
- Ana sayfa olusturulacak
- Banner alani eklenecek
- Urunler GridView ile listelenecek
- Urun kartlari olusturulacak
- Her kartta urun gorseli, adi ve fiyati gosterilecek

Kullanilacak Flutter yapilari:
- `Scaffold`
- `AppBar`
- `Column`
- `GridView.builder`
- `Card`
- `Image.asset`
- `Text`

Amac:
- Kullanici uygulamayi actiginda katalog ekranini gormeli
- Urunler kart tabanli tasarimla listelenmeli

Asama sonunda:

```bash
git status
git add .
git commit -m "Ana sayfa ve urun listesi olusturuldu"
git push -u origin feature/05-home-product-list
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 6 - Urun Detay Sayfasi ve Navigasyon

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/06-product-detail-navigation
```

Yapilacaklar:
- Urun detay sayfasi olusturulacak
- Urun kartina tiklaninca detay sayfasina gidilecek
- Secilen urun bilgisi detay sayfasina tasinacak
- Navigator yapisi kullanilacak

Kullanilacak yapilar:
- `Navigator.push`
- `MaterialPageRoute`
- Route Arguments mantigi
- `Navigator.pop`

Detay sayfasinda gosterilecekler:
- Urun gorseli
- Urun adi
- Urun kategorisi
- Urun aciklamasi
- Urun fiyati
- Sepete ekle butonu

Amac:
- Sayfalar arasi gecis mantigini gostermek
- Urun bilgisini bir sayfadan digerine tasimak

Asama sonunda:

```bash
git status
git add .
git commit -m "Urun detay sayfasi ve navigasyon eklendi"
git push -u origin feature/06-product-detail-navigation
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 7 - Sepete Ekleme State Simulasyonu

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/07-cart-state-simulation
```

Yapilacaklar:
- Basit sepet sayaci eklenecek
- Urun detayinda "Sepete Ekle" butonu olacak
- Butona basildiginda state guncellenecek
- Kullaniciya gorsel geri bildirim verilecek

Kullanilacak yapilar:
- `StatefulWidget`
- `setState`
- Buton
- Sayac gostergesi

Amac:
- Gercek sepet sistemi degil, egitim amacli state guncellemesi gostermek
- Kullanici etkilesimi eklemek

Asama sonunda:

```bash
git status
git add .
git commit -m "Sepete ekleme state simulasyonu eklendi"
git push -u origin feature/07-cart-state-simulation
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 8 - Arama ve Filtreleme

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/08-search-and-filter
```

Yapilacaklar:
- Ana sayfaya arama alani eklenecek
- Urun adi veya kategoriye gore filtreleme yapilacak
- Arama sonucu bossa kullaniciya bilgi gosterilecek

Kullanilacak yapilar:
- `TextField`
- `onChanged`
- `setState`
- Liste filtreleme

Amac:
- Basit arama mantigini gostermek
- Liste verisinin kullanici girisine gore degismesini saglamak

Asama sonunda:

```bash
git status
git add .
git commit -m "Urun arama ve filtreleme eklendi"
git push -u origin feature/08-search-and-filter
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 9 - Test ve Kod Kontrolu

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/09-tests-and-analysis
```

Yapilacaklar:
- Varsayilan counter testi kaldirilacak
- Mini katalog uygulamasina uygun basit testler yazilacak
- Uygulama analiz edilecek
- Hatalar duzeltilmeden final asamasina gecilmeyecek

Calistirilacak komutlar:

```bash
flutter analyze
flutter test
```

Amac:
- Proje calisir durumda mi kontrol etmek
- Temel widget testiyle ana ekranin acildigini dogrulamak
- Kod kalitesini kontrol etmek

Asama sonunda:

```bash
git status
git add .
git commit -m "Testler ve analiz kontrolleri guncellendi"
git push -u origin feature/09-tests-and-analysis
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 10 - README Guncellemesi

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/10-readme-update
```

Yapilacaklar:
- Varsayilan Flutter README icerigi kaldirilacak
- Projeye ozel README hazirlanacak

README icinde bulunacaklar:
- Proje adi
- Kisa aciklama
- Kullanilan Flutter surumu
- Kullanilan teknolojiler
- Kurulum adimlari
- Calistirma komutlari
- Proje klasor yapisi
- Ekran goruntuleri alani

README'de bulunmasi gereken ornek komutlar:

```bash
flutter pub get
flutter run
```

Amac:
- Teslim kriterlerini karsilamak
- Projeyi inceleyen kisinin nasil calistiracagini bilmesini saglamak

Asama sonunda:

```bash
git status
git add .
git commit -m "README proje bilgileriyle guncellendi"
git push -u origin feature/10-readme-update
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 11 - Screenshot Hazirligi

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/11-screenshots
```

Yapilacaklar:
- Uygulama calistirilacak
- Ana sayfa ekran goruntusu alinacak
- Urun detay sayfasi ekran goruntusu alinacak
- Gorseller `screenshots/` klasorune eklenecek
- README icine screenshot baglantilari eklenecek

Planlanan dosyalar:

```text
screenshots/
  home.png
  detail.png
```

Amac:
- Teslim kriterindeki ekran goruntusu sartini karsilamak

Asama sonunda:

```bash
git status
git add .
git commit -m "Uygulama ekran goruntuleri eklendi"
git push -u origin feature/11-screenshots
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

## Asama 12 - Final Kontrol ve Teslim

Branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/12-final-check
```

Yapilacaklar:
- Proje son kez kontrol edilecek
- Gereksiz yorumlar temizlenecek
- Uygulama calisiyor mu kontrol edilecek
- README eksiksiz mi kontrol edilecek
- Screenshot dosyalari var mi kontrol edilecek
- GitHub reposu public mi kontrol edilecek

Kontrol komutlari:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Git kontrolu:

```bash
git status
git log --oneline
```

Asama sonunda:

```bash
git status
git add .
git commit -m "Final teslim kontrolleri tamamlandi"
git push -u origin feature/12-final-check
```

Merge sonrasi:

```bash
git checkout main
git pull origin main
```

Final push:

```bash
git push origin main
```

## Teslim Oncesi Kontrol Listesi

- [ ] Proje GitHub uzerinde public repo olarak duruyor
- [ ] README.md guncel
- [ ] README icinde proje adi var
- [ ] README icinde kisa aciklama var
- [ ] README icinde Flutter surumu var
- [ ] README icinde calistirma adimlari var
- [ ] Ana sayfa var
- [ ] Urun listesi var
- [ ] GridView kullanildi
- [ ] Urun detay sayfasi var
- [ ] Navigator ile gecis var
- [ ] Route Arguments mantigi kullanildi
- [ ] Urun modeli var
- [ ] JSON simulasyonu var
- [ ] Asset gorselleri tanimli
- [ ] Sepete ekleme state simulasyonu var
- [ ] Arama / filtreleme var
- [ ] Screenshot dosyalari var
- [ ] `flutter analyze` hatasiz
- [ ] `flutter test` basarili
- [ ] Main branch guncel
- [ ] Son kod GitHub'a push edildi

## Branch Siralamasi

Gelistirme su sirayla ilerleyecek:

```text
feature/01-project-structure
feature/02-app-theme-and-shell
feature/03-product-model
feature/04-assets-and-json-data
feature/05-home-product-list
feature/06-product-detail-navigation
feature/07-cart-state-simulation
feature/08-search-and-filter
feature/09-tests-and-analysis
feature/10-readme-update
feature/11-screenshots
feature/12-final-check
```

Her branch tamamlandiktan sonra:
1. Commit alinir
2. Branch GitHub'a push edilir
3. Pull Request acilir
4. Main branch'e merge edilir
5. Local main branch'e gecilir
6. Guncel main cekilir
7. Sonraki asamaya gecilir
