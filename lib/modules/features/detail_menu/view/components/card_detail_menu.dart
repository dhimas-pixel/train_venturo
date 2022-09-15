import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/themes/color.dart';
import '../../../../../constant/common/media_query.dart';
import '../../../../../shared/customs/primary_text_style.dart';

class CardDetailMenu extends StatelessWidget {
  final String svgUrl, name, content;
  const CardDetailMenu({
    Key? key,
    required this.svgUrl,
    required this.name,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSized(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset(svgUrl),
              ),
              PrimaryTextStyle(
                size: 16,
                content: name,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          Row(
            children: [
              PrimaryTextStyle(
                size: 16,
                content: content,
                color: kGreyColor,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
