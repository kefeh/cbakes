class Sponsors {
  final String name;
  final String imageUrl;

  Sponsors({
    required this.name,
    required this.imageUrl,
  });

  static final sponsorList = [
    Sponsors(name: "Njaka", imageUrl: "assets/images/njaka-logo.png"),
    Sponsors(name: "c&cfoods", imageUrl: "assets/images/logo.png"),
  ];
}
