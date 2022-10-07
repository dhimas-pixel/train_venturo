import 'package:flutter/material.dart';
import 'package:train_venturo/constant/common/media_query.dart';

import '../../../../../../config/themes/color.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onChanged;
  const AppBarHome({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(66);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SizedBox(
          width: widthSized(context),
          height: 50,
          child: Center(
            child: TextField(
              onChanged: onChanged,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Pencairan",
                hintStyle: TextStyle(
                  color: kGreyColor,
                  height: 2.7,
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search_rounded,
                    color: kSecondaryColor,
                    size: 40,
                  ),
                ),
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kSecondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: kWhiteColor,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
