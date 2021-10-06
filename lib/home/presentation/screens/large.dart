import 'package:cbakes/core/dormain/food_item.dart';
import 'package:cbakes/core/presentation/widgets/helper.dart';
import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:cbakes/home/presentation/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class LargeHomePage extends StatelessWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final widthFactor = size / 7;
    final height = MediaQuery.of(context).size.height;
    final heightFactor = (height / 8) - 20;
    final headerSize = size * 0.04;

    final List<FoodItem> foodItems = FoodItem.items;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppMarquee(),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      width: widthFactor * 1,
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
                            child: HamBurger.large(heightFactor),
                          ),
                        ],
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
                                      height: heightFactor,
                                      text: "BAKERY",
                                    ),
                                    SizedBox(
                                      width: widthFactor / 2,
                                    ),
                                    DroppingButton(
                                      height: heightFactor,
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
                                        ButtonMain.activeLight(
                                          text: "explore bakery",
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
                        itemCount: foodItems.length > 7 ? 7 : foodItems.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: (widthFactor / 2) - 30,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return SmallItem(
                            foodItem: foodItems[index],
                          );
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
