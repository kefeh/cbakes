class FoodItem {
  final String name;
  final String decription;
  final double price;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.decription,
    required this.price,
    required this.imageUrl,
  });

  static final items = [
    FoodItem(
      name: "Doughnuts",
      decription:
          "Tasty and yummy, baked doughnuts. Each order contains 60 packets, and delivery is within 24hrs",
      price: 5000,
      imageUrl: "assets/images/doughnuts.jpg",
    ),
    FoodItem(
      name: "Custom Birthday cake",
      decription:
          "Customise your cake, and make your birthdays have a unique touch",
      price: 15000,
      imageUrl: "assets/images/cake_1.jpg",
    ),
    FoodItem(
      name: "Custom Birthday cake vanilla",
      decription:
          "And garlic, spiced with freshly pounded black peppercorns roasted garlic aioli on a brioche bun",
      price: 1500,
      imageUrl: "assets/images/cake_2.jpg",
    ),
    FoodItem(
      name: "Fufu and Njama Njama",
      decription:
          "Juicy 1-lb Kolmar Farms cheeseburger with roasted garlic aioli on a brioche bun",
      price: 2000,
      imageUrl: "assets/images/card.png",
    ),
    FoodItem(
      name: "SandWich Bread",
      decription:
          "And garlic, spiced with freshly pounded black peppercorns roasted garlic aioli on a brioche bun",
      price: 1500,
      imageUrl: "assets/images/sandwich.jpg",
    ),
    FoodItem(
      name: "Brown chocolate",
      decription:
          "Juicy 1-lb Kolmar Farms cheeseburger with roasted garlic aioli on a brioche bun",
      price: 1500,
      imageUrl: "assets/images/chocolate.jpg",
    ),
    FoodItem(
      name: "Crispy Cake",
      decription:
          "And garlic, spiced with freshly pounded black peppercorns roasted garlic aioli on a brioche bun",
      price: 1500,
      imageUrl: "assets/images/cake.jpg",
    ),
    FoodItem(
      name: "Fufu and Njama Njama",
      decription:
          "Juicy 1-lb Kolmar Farms cheeseburger with roasted garlic aioli on a brioche bun",
      price: 2000,
      imageUrl: "assets/images/card.png",
    ),
  ];
}
