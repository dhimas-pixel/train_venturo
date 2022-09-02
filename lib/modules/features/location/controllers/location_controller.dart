import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

// import '../../../../config/routes/name_routes.dart';

class LocationController extends GetxController with StateMixin {
  List<Placemark> _placemarks = [];
  List<Placemark> get placemarks => _placemarks;

  Future<void> getlocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    change(null, status: RxStatus.loading());
    final Position result = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _placemarks = await placemarkFromCoordinates(
      result.latitude,
      result.longitude,
    );
    change(null, status: RxStatus.success());
    // Get.offAllNamed(AppRoutes.homeView);
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
