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
  }) : super(key: key);

  final String headingText;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(
              left: 40,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 90.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemHeading(
                          text: headingText,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemPriceText(
                              text: "${price.toString()}frs",
                              color: Colors.white60,
                            ),
                            Text(
                              "${quantity}x",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CbIcons(icon: Icons.add),
                        CbIcons(icon: MdiIcons.minus),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          CircularImage(
            size: 110,
          ),
        ],
      ),
    );
  }
}
