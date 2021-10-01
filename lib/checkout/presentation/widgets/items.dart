import 'package:auto_route/auto_route.dart';
import 'package:cbakes/checkout/presentation/widgets/helpers.dart';
import 'package:cbakes/home/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 215,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                        child: Ratings(
                          size: 15,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ItemHeading(
                              text: "Fufu and Njama Njama",
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Every step taken is clearly and thoroughly explained, plus downloadable code for every section of this course.",
                                style: GoogleFonts.rubik(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: ItemPriceText(
                          color: Colors.black45,
                          text: "1500frs",
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
            child: CircularImage(
              size: 150,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ButtonMain(
              text: "add to cart",
              backgroundColor: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SideItem extends StatelessWidget {
  const SideItem({
    Key? key,
    required this.headingText,
    required this.price,
    required this.quantity,
    required this.widthFactor,
  }) : super(key: key);

  final String headingText;
  final double price;
  final int quantity;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final mediumSize = widthSize < 1200;

    final double width100 = widthFactor / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: width100 - 10,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: width100,
              ),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    width: width100 * 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemHeading(
                          text: headingText,
                          color: Colors.white,
                          fontSize: mediumSize ? 12 : 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemPriceText(
                                text: "${price.toString()}frs",
                                color: Colors.white60,
                                fontSize: mediumSize ? 12 : 14,
                              ),
                              Text(
                                "${quantity}x",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mediumSize ? 14 : 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  mediumSize
                      ? Align(
                          alignment: Alignment(-2, 2.5),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CbIcons(
                                  icon: Icons.add,
                                  size: mediumSize ? 20 : 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CbIcons(
                                  icon: MdiIcons.minus,
                                  size: mediumSize ? 20 : 30,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CbIcons(
                                  icon: Icons.add,
                                  size: mediumSize ? 25 : 30,
                                ),
                                CbIcons(
                                  icon: MdiIcons.minus,
                                  size: mediumSize ? 25 : 30,
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
          CircularImage(
            size: width100,
          ),
        ],
      ),
    );
  }
}
