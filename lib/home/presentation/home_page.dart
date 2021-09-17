import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final headerSize = size * 0.04;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromRGBO(30, 31, 34, 1),
                child: Marquee(
                    text:
                        "                                    CBAKES BAKERY                                     CBAKES RESTAURANT                                    CBAKES DELIVERIES",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset("assets/images/logo.png"),
                            ),
                            Row(
                              children: [
                                DroppingButton(
                                  height: height,
                                  text: "BAKERY",
                                ),
                                SizedBox(
                                  width: headerSize,
                                ),
                                DroppingButton(
                                  height: height,
                                  text: "RESTAURANT",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: headerSize / 2,
                            )
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: size / 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "The best ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: headerSize),
                                    ),
                                    Text(
                                      "food service",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: headerSize),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "for ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(fontSize: headerSize),
                                        children: [
                                          TextSpan(
                                            text: "Everybody",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  color: const Color.fromRGBO(
                                                      246, 67, 67, 1),
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: headerSize,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const ButtonMain(
                                  text: "explore bakery",
                                  backgroundColor:
                                      Color.fromRGBO(254, 236, 236, 1),
                                  textColor:
                                      const Color.fromRGBO(246, 67, 67, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(246, 67, 67, 1),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DroppingButton extends StatelessWidget {
  const DroppingButton({
    Key? key,
    required this.height,
    required this.text,
  }) : super(key: key);

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: (height / 8) - 20,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(246, 67, 67, 0.2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
            ),
            ButtonMain(
                text: text,
                backgroundColor: const Color.fromRGBO(246, 67, 67, 1)),
          ],
        ),
      ),
    );
  }
}

class ButtonMain extends StatelessWidget {
  const ButtonMain({
    Key? key,
    required this.text,
    required this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    print("textColor is:");
    print(textColor);
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: textColor ?? Colors.white),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
