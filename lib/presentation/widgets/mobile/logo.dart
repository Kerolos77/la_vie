import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget logo({required double fontSize}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Text(
        'La Vie',
        style: GoogleFonts.meddon(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SvgPicture.asset(
          "assets/image/lavie.svg",
          color: Color.fromRGBO(26, 188, 0, 0.43),
          width: 29,
          height: 19,
        ),
      ),
    ],
  );
}
