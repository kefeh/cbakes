import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class AppMarquee extends StatelessWidget {
  const AppMarquee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(30, 31, 34, 1),
      child: Marquee(
        text:
            "                                    C&C BAKERY                                     C&C RESTAURANT                                    C&C DELIVERIES",
        style: GoogleFonts.rubik(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
