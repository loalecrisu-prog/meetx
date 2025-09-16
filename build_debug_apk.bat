
@echo off
echo === Building Meetx APK Debug ===
flutter clean
flutter pub get
flutter build apk --debug
echo.
echo APK-ul a fost generat aici:
echo build\app\outputs\flutter-apk\app-debug.apk
pause
