# TTA - Test Task Application (Приложение для тестового задания)

Мобильное приложение для тестового задания.

## Установка SDK
1. Использовать [Flutter 3.35.5](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.35.5-stable.zip)
2. Указать путь к SDK в системной переменной среды ОС `<Путь>\3.35.5\bin`

## Начало работы
Получить зависимости
```dart
flutter pub get
```
Использовать [intl_utils](https://pub.dev/packages/intl_utils) для генерации локализации.
```dart
flutter pub run intl_utils:generate
```
Использовать [build_runner](https://pub.dev/packages/build_runner) для геренации моделей.
```dart
flutter pub run build_runner build
```
Собрать `.apk`
```dart
flutter build apk
```
Получить `.apk`
```dart
<Корневая папка проекта>\build\app\outputs\flutter-apk\app-release.apk
```
Собрать .ipa
```dart
flutter build ipa
```

## Вход в приложение
На момент написания приложения войти в него можно было по логину (username) и паролю (password) одного из пользователей, получаемых по запросу https://fakestoreapi.com/users, например:

```json
{
  "username": "johnd",
  "password": "m38rmF$"
}
```