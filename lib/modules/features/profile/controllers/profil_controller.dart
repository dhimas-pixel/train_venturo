import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:train_venturo/modules/features/profile/repository/profil_service.dart';
import 'package:train_venturo/modules/models/profil_model/user_detail_response_model.dart';

import '../../../models/hive/user_hive_model.dart';

class ProfilController extends GetxController {
  ProfilService profilService = ProfilService();
  static ProfilController get to => Get.find();

  UserDetailResModel? userDetail;
  Data? userDetailDataTemp;

  CroppedFile? croppedFile;
  XFile? pickedFile;

  XFile? pickedFileKTP;
  CroppedFile? croppedFileKTP;

  var box = Hive.box<User>('user');
  var languageBox = Hive.box("selected_language");
  String? selectedLanguage;
  User? userData;

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidDeviceInfo;
  IosDeviceInfo? iosDeviceInfo;

  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: '',
  );

  RxBool isLoading = false.obs;

  Future<void> initPlatformState() async {
    try {
      if (Platform.isAndroid) {
        androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      } else if (Platform.isIOS) {
        iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    packageInfo = info;
    update();
  }

  setUserData() async {
    isLoading = true.obs;
    update();

    UserDetailResModel? getUserDetail = await profilService.getUserDetail();
    userData = box.values.first;

    if (getUserDetail != null) {
      userDetail = getUserDetail;
      userDetailDataTemp = getUserDetail.data!;
      updateUserBox(userDetailDataTemp!);
    }

    isLoading = false.obs;
    update();
  }

  updateProfile() async {
    isLoading = true.obs;
    update();

    File file = File(croppedFile!.path);

    final bytes = file.readAsBytesSync();
    String base64Image = base64Encode(bytes);

    UserDetailResModel? getUserDetail =
        await profilService.updateImg(base64Image);

    if (getUserDetail != null) {
      userDetail = getUserDetail;
      userDetailDataTemp = getUserDetail.data!;

      pickedFile = null;
      croppedFile = null;
    }

    isLoading = false.obs;
    update();
  }

  Future<void> cropImage() async {
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 50,
      );
      if (croppedFile != null) {
        this.croppedFile = croppedFile;
        update();
      }
    }
  }

  Future<void> uploadImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 60,
      maxHeight: 1920,
      maxWidth: 1080,
    );
    if (pickedFile != null) {
      this.pickedFile = pickedFile;
      await cropImage();
    }
  }

  updateKTP() async {
    isLoading = true.obs;
    update();

    File file = File(croppedFileKTP!.path);
    final bytes = file.readAsBytesSync();
    String base64Image = base64Encode(bytes);

    UserDetailResModel? getUserDetail =
        await profilService.updateKTP(base64Image);

    if (getUserDetail != null) {
      userDetail = getUserDetail;
      userDetailDataTemp = getUserDetail.data!;
      updateUserBox(userDetailDataTemp!);
      pickedFileKTP = null;
      croppedFileKTP = null;
    }

    isLoading = false.obs;
    update();
  }

  Future<void> cropImageKTP() async {
    if (pickedFileKTP != null) {
      final croppedFileKTP = await ImageCropper().cropImage(
        sourcePath: pickedFileKTP!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 50,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
      );
      if (croppedFileKTP != null) {
        this.croppedFileKTP = croppedFileKTP;
        update();
      }
    }
  }

  Future<void> uploadImageKTP(ImageSource imageSource) async {
    final pickedFileKTP = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 60,
      maxHeight: 1920,
      maxWidth: 1080,
    );
    if (pickedFileKTP != null) {
      this.pickedFileKTP = pickedFileKTP;
      await cropImageKTP();
    }
  }

  updateData(String key, String newValue) async {
    isLoading = true.obs;
    update();

    UserDetailResModel? getUserDetail =
        await profilService.updateUserDetail(key, newValue);

    if (getUserDetail != null) {
      userDetail = getUserDetail;
      userDetailDataTemp = getUserDetail.data!;
      updateUserBox(userDetailDataTemp!);
    }
    isLoading = false.obs;
    update();
  }

  setSelectedLanguage() {
    selectedLanguage = languageBox.get("country_id");
    if (selectedLanguage == null) {
      languageBox.put("country_id", Get.deviceLocale?.languageCode ?? "en");
    }
  }

  updateLanguage(String countryId) {
    languageBox.put("country_id", countryId);
    selectedLanguage = countryId;
    Get.updateLocale(Locale(countryId));
    update();
  }

  updateUserBox(Data newUserData) async {
    User user = box.values.first;

    user.nama = newUserData.nama;
    user.nama = newUserData.nama;
    user.foto = newUserData.foto;
    user.pin = newUserData.pin;

    box.put(box.keys.first, user);
  }

  @override
  void onInit() {
    setUserData();
    initPackageInfo();
    initPlatformState();
    setSelectedLanguage();
    super.onInit();
  }
}
