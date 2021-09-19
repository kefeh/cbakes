import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final widthFactor = size / 7;
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
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      width: widthFactor * 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(246, 67, 67, 1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.01, 0),
                    child: SizedBox(
                      width: widthFactor * 6,
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, right: 16.0, bottom: 16.0),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: size / 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "The best ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: headerSize),
                                            ),
                                            Text(
                                              "food service",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: headerSize),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: "for ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                        fontSize: headerSize),
                                                children: [
                                                  TextSpan(
                                                    text: "Everybody",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1!
                                                        .copyWith(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              246, 67, 67, 1),
                                                          fontStyle:
                                                              FontStyle.italic,
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
                                          textColor: const Color.fromRGBO(
                                              246, 67, 67, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: size / height,
                                    child: Image.asset(
                                      "assets/images/bread.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthFactor / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                        left: 8.0,
                      ),
                      child: Text(
                        "Stock Overview",
                        style: TextStyle(
                          color: Color.fromRGBO(51, 70, 91, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                        itemCount: 7,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: (widthFactor / 2) - 30,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int _) {
                          return SmallItem();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallItem extends StatelessWidget {
  const SmallItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      border: Border.all(
                        color: const Color.fromRGBO(246, 67, 67, 1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/card.png",
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 140,
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: ButtonMain(
                        text: "fufu and eru",
                        backgroundColor: const Color.fromRGBO(246, 67, 67, 1),
                        textSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
    this.textSize,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    print("textColor is:");
    print(textColor);
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: textColor ?? Colors.white,
              fontSize: textSize ?? 20,
            ),
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
