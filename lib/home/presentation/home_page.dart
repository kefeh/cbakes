import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: const Color.fromRGBO(30, 31, 34, 1),
              child: Marquee(
                text:
                    "                                    CBAKES BAKERY                                     CBAKES RESTAURANT                                    CBAKES DELIVERIES",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row()
          ],
        ),
      ),
    );
  }
}
