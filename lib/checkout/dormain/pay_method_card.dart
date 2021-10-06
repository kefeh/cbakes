import 'package:flutter/widgets.dart';

class PayMethodCardItem {
  final String name;
  final String imageUrl;
  final GlobalKey key;

  PayMethodCardItem(
      {required this.name, required this.imageUrl, required this.key});

  static final payCardItems = [
    PayMethodCardItem(
      key: GlobalKey(),
      imageUrl: "assets/images/hand.png",
      name: "PAY PHYSICALLY",
    ),
    PayMethodCardItem(
      key: GlobalKey(),
      imageUrl: "assets/images/momo.png",
      name: "MTN MOMO",
    ),
    PayMethodCardItem(
      key: GlobalKey(),
      imageUrl: "assets/images/orange.png",
      name: "ORANGE MOMO",
    ),
  ];
}
