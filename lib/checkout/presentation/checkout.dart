import 'package:cbakes/core/presentation/widgets/marquee.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      final double width = constraint.maxWidth;
      final double mainPadding = width / 40;
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: AppMarquee(),
              ),
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: mainPadding,
                                left: mainPadding,
                                right: mainPadding,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).accentColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/images/bread.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: mainPadding,
                              ),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: mainPadding,
                                  runSpacing: mainPadding,
                                  children: [
                                    Container(
                                      color: Colors.brown,
                                      width: 250,
                                      height: 300,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional
                                                .bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Container(
                                                height: 215,
                                                width: 250,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 75,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: 12,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size: 12,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size: 12,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size: 12,
                                                            ),
                                                            Icon(
                                                              Icons.star_half,
                                                              size: 12,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 90,
                                                        child: Text(
                                                            "Every step taken is clearly and thoroughly explained, plus downloadable code for every section of this course."),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                        child: Text(
                                                          "1500frs",
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Theme.of(context)
                                                        .buttonColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 130,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/card.png"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            child: ButtonMain(
                                              text: "add to cart",
                                              backgroundColor:
                                                  Theme.of(context).accentColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.brown,
                                      width: 300,
                                      height: 300,
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
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
