# iot_home_control

This a project about IoT and manegement of home for our final project's university.

## Dependencies

  ### prod dependencies
  1. cupertino_icons: ^1.0.2
  2. flutter:
    sdk: flutter
  3. flutter_dotenv: ^5.1.0
  4. flutter_riverpod: ^2.4.3
  5. go_router: ^11.1.4
  6. isar: ^3.1.0+1
  7. isar_flutter_libs: ^3.1.0+1
  8. path_provider: ^2.1.1


  ### dev dependencies
  1. build_runner: ^2.4.6
  2. flutter_lints: ^2.0.0
  3. flutter_test:
    sdk: flutter
  4. isar_generator: ^3.1.0+1



## Getting Started on dev environment

1. Clone this repository

```shell
git clone https://github.com/vcrolack/iot-home-control.git
```

2. Check your flutters installations with

```shell
flutter doctor
```

3. If everything it's okay, run the project.

### Observations

If you changes some property of the entities that are saved on Isar (local database), run the following instruction

```shell
flutter pub run build_runner build
```