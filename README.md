# snake

# install & Prepare
git clone https://gitlab.com/patrickrgn/snake.git

flutter pub get
flutter run

# generate files (*.g.dart)
flutter packages pub run build_runner build --delete-conflicting-outputs
