import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:train_venturo/constant/common/media_query.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/modules/features/profile/controllers/profil_controller.dart';
import 'package:train_venturo/shared/customs/appbar_primary.dart';
import 'package:train_venturo/shared/customs/primary_button.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../main.dart';
import '../../../../../shared/widgets/loading_component.dart';
import '../../../login/controllers/login_controller.dart';

class ProfileView extends GetView<ProfilController> {
  ProfileView({Key? key}) : super(key: key);

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
      init: ProfilController(),
      builder: (value) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBarPrimary(
                name: 'profil'.tr,
                back: () {},
                showBack: false,
              ),
              body: Stack(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "${AssetsUrl.imgUrl}bg_pattern.png",
                                    scale: 1.2,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildProfilePicture(context, value),
                                      InkWell(
                                        onTap: () {
                                          value.uploadImageKTP(
                                              ImageSource.camera);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                    "${AssetsUrl.imgUrl}identity_icon_blue.png"),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                child: PrimaryTextStyle(
                                                  size: 16,
                                                  content: 'verif_id'.tr,
                                                  fontWeight: FontWeight.w400,
                                                  color: kSecondaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 16),
                                        child: PrimaryTextStyle(
                                          size: 20,
                                          content: 'acc_info'.tr,
                                          fontWeight: FontWeight.w600,
                                          color: kSecondaryColor,
                                        ),
                                      ),
                                      _buildAccountInfo(context, value),
                                      // _buildRatingInfo(),
                                      Container(
                                        margin: const EdgeInsets.only(top: 16),
                                        child: PrimaryTextStyle(
                                          size: 20,
                                          content: 'other_info'.tr,
                                          fontWeight: FontWeight.w600,
                                          color: kSecondaryColor,
                                        ),
                                      ),
                                      _builtOtherInfo(context, value),
                                      _buildLogoutButton(context, value)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  value.croppedFileKTP != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 320,
                                  height: 180,
                                  child: Image.file(
                                    File(
                                      value.croppedFileKTP!.path,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    PrimaryButton(
                                      text: "cancel".tr,
                                      press: () {
                                        value.croppedFileKTP = null;
                                        value.pickedFileKTP = null;
                                        value.update();
                                      },
                                      color: kRedColor,
                                      width: widthSized(context) / 2.7,
                                      fontSize: 16,
                                      textColor: kWhiteColor,
                                    ),
                                    PrimaryButton(
                                      text: "upload".tr,
                                      press: () {
                                        value.updateKTP();
                                      },
                                      color: kSecondaryColor,
                                      width: widthSized(context) / 2.7,
                                      fontSize: 16,
                                      textColor: kWhiteColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            value.isLoading.isTrue ? const LoadingComponent() : Container(),
          ],
        );
      },
    );
  }

  Widget _buildProfilePicture(
      BuildContext context, ProfilController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(80),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: controller.userDetail?.data?.foto != null
                            ? controller.croppedFile != null
                                ? Image.file(
                                    File(
                                      controller.croppedFile!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    controller.userDetail?.data?.foto ?? "",
                                    fit: BoxFit.cover,
                                  )
                            : controller.croppedFile != null
                                ? Image.file(
                                    File(
                                      controller.croppedFile!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "${AssetsUrl.imgUrl}circle_profile_icon.png",
                                  ),
                      ),
                      InkWell(
                        onTap: () {
                          showBottomSheet(
                            elevation: 24,
                            context: context,
                            builder: (context) {
                              return _showBottomSheetImagePicker(context);
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    color: kSecondaryColor,
                                    child: PrimaryTextStyle(
                                      size: 14,
                                      content: "edit".tr,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            controller.croppedFile != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          controller.updateProfile();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: PrimaryTextStyle(
                            size: 14,
                            content: "save".tr,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Container _buildAccountInfo(BuildContext context, ProfilController value) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: const Color.fromRGBO(246, 246, 246, 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.grey.withAlpha(70),
          )
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showBottomSheet(
                elevation: 24,
                context: context,
                builder: (context) {
                  return _showBottomSheetUpdateProfile(
                    context,
                    'nama',
                    "name".tr,
                    value.userDetail?.data?.nama ?? "",
                    value,
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "name".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    PrimaryTextStyle(
                      size: 16,
                      content: value.userDetail?.data?.nama ?? "",
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          InkWell(
            onTap: () {
              showBottomSheet(
                elevation: 24,
                context: context,
                builder: (context) {
                  return _showBottomSheetUpdateProfile(
                      context,
                      'tgl_lahir',
                      "date_of_birth".tr,
                      value.userDetail?.data?.tglLahir ?? "",
                      value,
                      datePicker: true);
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "date_of_birth".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    PrimaryTextStyle(
                      size: 16,
                      content: value.userDetail?.data?.tglLahir ?? "",
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          InkWell(
            onTap: () {
              showBottomSheet(
                elevation: 24,
                context: context,
                builder: (context) {
                  return _showBottomSheetUpdateProfile(
                    context,
                    'telepon',
                    "phone_number".tr,
                    value.userDetail?.data?.telepon ?? "",
                    value,
                    keyboardType: TextInputType.phone,
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "phone_number".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    PrimaryTextStyle(
                      size: 16,
                      content: value.userDetail?.data?.telepon ?? "",
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          InkWell(
            onTap: () {
              value.userData!.isGoogle == 1
                  ? Get.snackbar(
                      "cant_edit_email_title".tr, "cant_edit_email_message".tr)
                  : showBottomSheet(
                      elevation: 24,
                      context: context,
                      builder: (context) {
                        return _showBottomSheetUpdateProfile(context, 'email',
                            'Email', value.userDetail?.data?.email ?? "", value,
                            keyboardType: TextInputType.emailAddress);
                      },
                    );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrimaryTextStyle(
                  size: 16,
                  content: "Email",
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    PrimaryTextStyle(
                      size: 16,
                      content: value.userDetail?.data?.email ?? "",
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          InkWell(
            onTap: () {
              showBottomSheet(
                elevation: 24,
                context: context,
                builder: (context) {
                  return _showBottomSheetUpdateProfile(
                      context, 'pin', 'Pin', "", value,
                      keyboardType: TextInputType.number, maxLength: 6);
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "change_pin".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    const PrimaryTextStyle(
                      size: 16,
                      content: "******",
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            child: InkWell(
              onTap: () {
                showBottomSheet(
                  elevation: 24,
                  context: context,
                  builder: (context) {
                    return _showBottomSheetChangeLanguage(
                      context,
                      controller,
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryTextStyle(
                    size: 16,
                    content: 'change_lang'.tr,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      PrimaryTextStyle(
                        size: 16,
                        content:
                            controller.selectedLanguage?.toUpperCase() ?? "EN",
                        fontWeight: FontWeight.w400,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Wrap _showBottomSheetUpdateProfile(BuildContext context, String key,
      String label, String initialValue, ProfilController controller,
      {TextInputType? keyboardType,
      bool datePicker = false,
      int maxLength = -1}) {
    String savedValue = initialValue;
    TextEditingController textEditingController = TextEditingController()
      ..text = savedValue
      ..selection =
          TextSelection.fromPosition(TextPosition(offset: savedValue.length));

    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Divider(
                  indent: MediaQuery.of(context).size.width * 1 / 5,
                  endIndent: MediaQuery.of(context).size.width * 1 / 5,
                  height: 2,
                  thickness: 3,
                  color: Colors.grey.withAlpha(70),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: PrimaryTextStyle(
                  size: 18,
                  content: "edit".tr + " $label",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: keyboardType ?? TextInputType.text,
                      readOnly: datePicker,
                      controller: textEditingController,
                      onChanged: (value) {
                        savedValue = value;
                        // controller.updateValueData(key, value);
                      },
                      onTap: () {
                        datePicker
                            ? showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970, 1),
                                lastDate: DateTime.now(),
                                builder: (context, picker) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(),
                                    child: picker!,
                                  );
                                }).then((selectedDate) {
                                if (selectedDate != null) {
                                  textEditingController.text =
                                      formatter.format(selectedDate).toString();
                                  savedValue =
                                      formatter.format(selectedDate).toString();
                                  // controller.update();
                                }
                              })
                            : null;
                      },
                      maxLength: maxLength == -1 ? 100 : maxLength,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.grey.withAlpha(100),
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: kSecondaryColor,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          controller.updateData(key, savedValue);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Wrap _showBottomSheetChangeLanguage(
      BuildContext context, ProfilController controller) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Divider(
                  indent: MediaQuery.of(context).size.width * 1 / 5,
                  endIndent: MediaQuery.of(context).size.width * 1 / 5,
                  height: 2,
                  thickness: 3,
                  color: Colors.grey.withAlpha(70),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: PrimaryTextStyle(
                  size: 18,
                  content: "change_lang".tr,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.updateLanguage('id');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: controller.selectedLanguage == 'id'
                                ? kSecondaryColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.grey.withAlpha(70),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 56,
                                height: 38,
                                child: Image.asset(
                                  "${AssetsUrl.imgUrl}indonesia_flag.png",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: PrimaryTextStyle(
                                  size: 14,
                                  content: "Indonesia",
                                  fontWeight: FontWeight.w500,
                                  color: controller.selectedLanguage == 'id'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: const Icon(
                                  Icons.check,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.updateLanguage('en');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: controller.selectedLanguage == 'en'
                                ? kSecondaryColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.grey.withAlpha(70),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 56,
                                height: 38,
                                child: Image.asset(
                                  "${AssetsUrl.imgUrl}uk_flag.png",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: PrimaryTextStyle(
                                  size: 14,
                                  content: "English",
                                  fontWeight: FontWeight.w500,
                                  color: controller.selectedLanguage == 'en'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: const Icon(
                                  Icons.check,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _builtOtherInfo(BuildContext context, ProfilController controller) {
    return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: const Color.fromRGBO(246, 246, 246, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.grey.withAlpha(70),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "device_info".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Text(
                      Platform.isAndroid
                          ? controller.androidDeviceInfo?.model ?? ""
                          : Platform.isIOS
                              ? controller.iosDeviceInfo?.model ?? ""
                              : "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextStyle(
                  size: 16,
                  content: "version".tr,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    PrimaryTextStyle(
                      size: 16,
                      content: controller.packageInfo.version,
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Row _buildLogoutButton(BuildContext context, ProfilController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: PrimaryButton(
            text: "logout".tr,
            press: () {
              Get.find<LoginController>().logOut();
              RestartWidget.restartApp(context);
            },
            color: kSecondaryColor,
            width: widthSized(context) / 2,
            fontSize: 16,
            textColor: kWhiteColor,
          ),
        ),
      ],
    );
  }

  Wrap _showBottomSheetImagePicker(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Divider(
                  indent: widthSized(context) * 1 / 5,
                  endIndent: widthSized(context) * 1 / 5,
                  height: 2,
                  thickness: 3,
                  color: Colors.grey.withAlpha(70),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: PrimaryTextStyle(
                  size: 18,
                  content: "choose_image".tr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.uploadImage(ImageSource.camera);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: kSecondaryColor,
                            // : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.grey.withAlpha(70),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.camera_alt_outlined,
                                size: 36,
                                color: Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: PrimaryTextStyle(
                                  size: 14,
                                  content: "camera".tr,
                                  fontWeight: FontWeight.w500,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.uploadImage(ImageSource.gallery);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: kSecondaryColor,
                            // : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.grey.withAlpha(70),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.image,
                                size: 36,
                                color: Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: PrimaryTextStyle(
                                  size: 14,
                                  content: "gallery".tr,
                                  fontWeight: FontWeight.w500,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
