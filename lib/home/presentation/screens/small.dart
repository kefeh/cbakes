import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:cbakes/home/presentation/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class SmallHomePage extends StatelessWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final widthFactor = size / 7;
    final height = MediaQuery.of(context).size.height;
    final heightFactor = (height / 8) - 30;
    final headerSize = size * 0.1;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: AppMarquee(),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    SizedBox(
                      width: widthFactor * 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    DroppingButtonSmall(
                                      text: "BAKERY",
                                    ),
                                    SizedBox(
                                      width: widthFactor / 2,
                                    ),
                                    DroppingButtonSmall(
                                      text: "RESTAURANT",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: size / 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  ButtonMain(
                                    text: "explore bakery",
                                    textSize: 13,
                                    backgroundColor:
                                        Theme.of(context).buttonColor,
                                    textColor: Theme.of(context).accentColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: widthFactor,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: HamBurger.small(20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: widthFactor * 6,
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
                        child: ListView.separated(
                          itemCount: 7,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: (widthFactor / 3),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int _) {
                            return SmallItemSmall();
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
      ),
    );
  }
}

class DroppingButtonSmall extends StatelessWidget {
  final String text;
  const DroppingButtonSmall({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(246, 67, 67, 0.2),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment(0, 5),
            child: ButtonSmall(text: text),
          ),
        ),
      ],
    );
  }
}

class ButtonSmall extends StatelessWidget {
  const ButtonSmall({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 1.0,
          )),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
