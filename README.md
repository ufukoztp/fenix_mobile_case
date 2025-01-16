# Flutter Projesi

Bu proje, Flutter kullanarak geliştirilmiş bir mobil uygulamadır. Clean mimari kullanılarak yapılandırılmıştır.

## İçindekiler

- [Başlarken](#başlarken)
- [Kurulum](#kurulum)
- [Proje Yapısı](#proje-yapısı)
- [Kullanılan Teknolojiler](#kullanılan-teknolojiler)

## Başlarken
Bu proje, Flutter SDK kullanılarak oluşturulmuştur. Uygulamanın yerel ortamınızda çalıştırılması için aşağıdaki adımları izleyin.

## Kurulum

# Repoyu klonlayın
git clone https://github.com/ufukoztp/fenix_mobile_case.git

# Proje dizinine gidin
cd fenix_mobile_case

# Gerekli paketleri yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run

## Proje Yapısı
```
lib/
├── core/
│   ├── base/                 # Base yapılar
│   ├── extensions/           # Extensionslar'ın yönetimi
│   ├── logger/               # Uygulama logger class'ları
│   ├── network/              # Http İstekleri Yönetimi
├── common/
│   ├── constants/            # Uygulama Constantları
│   ├── init/                 # Dependency Injection Yönetimi
│   ├── utils/                # Genel yardımcı fonksiyonlar
│   └── widgets/              # Atomic Widget'lar
│
├── features/
│   ├── data/
│   │   └──── models/         # Response modeller
│   │   └──── repositories/   # Repository'ler
│   │   └──── services/       # Http Istekleri
│   │
│   ├── domain/
│   │   └──── entities/       # Entity modeller
│   │   └──── repositories/   # Soyut Repository'ler
│   │   └──── services/       # Soyut Http Istekleri
│   │
│   ├── presentation/
│       └──── widgets/        # Ekranlara özel widgetlar
│       └──── cubit/          # Bloc ve Cubit'ler
│       └──── mixinler/       # Ekranlara özel mixinler
│       └──── view/           # Ekranlar
│
└── main.dart  # Uygulama giriş noktası
```

# Kullanılan Teknolojiler
```
  State Management: flutter_bloc
  Model Generation: freezed
  HTTP Client: dio
  Dependency Injection: get_it
  Asset Management: flutter_gen
  Responsive UI: flutter_screenutil
  Network Image: extended_image
  GridView Gösterimi: flutter_staggered_grid_view
  Architecture: Clean Architecture, Atomic Widget
```


# fenix_mobile_case
