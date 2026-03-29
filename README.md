# Crypto Exchange Mobile App (Flutter)

Ứng dụng mobile mô phỏng/triển khai các chức năng cơ bản của một crypto exchange: xem giá thị trường, theo dõi coin, xem chi tiết, (tuỳ dự án) đăng nhập và quản lý danh mục.

> Repo: `longcikeyyy/Crypto-Exchange-Mobile-App`

## Features
- Market list (danh sách coin/token)
- Coin detail (biểu đồ/giá/biến động) *(tuỳ implement)*
- Search & filter *(tuỳ implement)*
- Watchlist/Favorites *(tuỳ implement)*
- Portfolio *(tuỳ implement)*
- Authentication *(tuỳ implement)*
- Multi-platform: Android / iOS / Web / Desktop (Flutter)

## Tech Stack
- **Flutter / Dart**
- (Optional) **Firebase**: Auth / Firestore / Analytics / Crashlytics *(nếu có cấu hình)*
- REST API client: `dio`/`http` *(tuỳ trong `pubspec.yaml`)*
- State management: `bloc`/`provider`/`riverpod`/`getx` *(tuỳ dự án)*
- Code quality: `analysis_options.yaml`

## Project Structure
```text
.
├── lib/                # Flutter source code
├── assets/             # Images, icons, etc.
├── android/            # Android native config
├── ios/                # iOS native config
├── web/ linux/ macos/ windows/
├── test/               # Unit/widget tests
├── pubspec.yaml        # Dependencies & assets
└── analysis_options.yaml
```

## Getting Started

### Prerequisites
- Flutter SDK (stable)
- Android Studio / Xcode (tuỳ nền tảng)
- Một IDE: VS Code / Android Studio

Kiểm tra môi trường:
```bash
flutter doctor
```

### Install dependencies
```bash
flutter pub get
```

### Run
```bash
flutter run
```

Chạy theo device cụ thể:
```bash
flutter devices
flutter run -d <device_id>
```

## Environment / Configuration
Nếu app dùng API key / base URL, bạn nên tạo file env theo mẫu:

1) Tạo file: `.env` (không commit)
2) Ví dụ:
```env
API_BASE_URL=https://api.example.com
API_KEY=your_key_here
```

> TODO: Nếu repo đang dùng package `flutter_dotenv` hoặc config khác, mình sẽ chỉnh README theo đúng thực tế.

## Build Release

### Android
```bash
flutter build apk --release
# hoặc
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Contributing
PRs are welcome. Vui lòng tạo branch theo feature/fix và mô tả rõ thay đổi.

## License
Chưa khai báo license. Nếu bạn muốn open-source, nên thêm `LICENSE` (MIT/Apache-2.0).
