class Sponsors {
  final String name;
  final String imageUrl;
  final String link;

  Sponsors({
    required this.name,
    required this.imageUrl,
    required this.link,
  });

  static final sponsorList = [
    Sponsors(
      name: "c&cfoods",
      imageUrl: "assets/images/tec_logo.png",
      link: "https://tecatwork.com/",
    ),
  ];
}
