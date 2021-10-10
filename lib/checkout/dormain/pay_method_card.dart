class PayMethodCardItem {
  final String name;
  final String imageUrl;

  PayMethodCardItem({
    required this.name,
    required this.imageUrl,
  });

  static final payCardItems = [
    PayMethodCardItem(
      imageUrl: "assets/images/hand.png",
      name: "PAY PHYSICALLY",
    ),
    PayMethodCardItem(
      imageUrl: "assets/images/momo.png",
      name: "MTN MOMO",
    ),
    PayMethodCardItem(
      imageUrl: "assets/images/orange.png",
      name: "ORANGE MOMO",
    ),
  ];
}
