import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationRepositories {
  Future<Point?> getMyLocation() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      print("Location permission granted.");
    } else if (status.isDenied) {
      print("Location permission denied.");
    } else if (status.isPermanentlyDenied) {
      print("Location permission permanently denied.");
      // Bu yerda foydalanuvchini ruxsatlarni sozlash oynasiga yo'naltirish mumkin.
      openAppSettings();
    }
    // print(await Permission.location.request());

    // if (!await Geolocator.isLocationServiceEnabled()) {
    //   print("ha");
    // } else {
    //   print("yoq");
    // }
    // await Geolocator.checkPermission();
    // final location = await Geolocator.getCurrentPosition();
    // print("bu locationku $location");
  }
}
