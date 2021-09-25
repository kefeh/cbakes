import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HamBurger extends StatelessWidget {
  final double padding;
  final double height;
  final double lWidth;
  final double sWidth;

  const HamBurger({
    Key? key,
    required this.padding,
    required this.height,
    required this.lWidth,
    required this.sWidth,
  }) : super(key: key);

  factory HamBurger.large(double padding) {
    return HamBurger(
      padding: padding,
      height: 4,
      lWidth: 30,
      sWidth: 20,
    );
  }

  factory HamBurger.small(double padding) {
    return HamBurger(
      padding: padding + 40,
      height: 3,
      lWidth: 20,
      sWidth: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.only(top: padding - 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: height,
              width: lWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: sWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: lWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: height,
            ),
            Container(
              height: height,
              width: sWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
