import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget registrationBackground({
  required BuildContext context,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        SvgPicture.asset(
          "assets/image/background_login_top.svg",
          color: Color.fromRGBO(26, 188, 0, 0.43),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SvgPicture.asset(
                "assets/image/background_login_bottom.svg",
                color: Color.fromRGBO(26, 188, 0, 0.43),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
