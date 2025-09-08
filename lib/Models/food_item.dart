class FoodItem {
  final String imageURL;
  final String name;
  final double price;
  // ignore: non_constant_identifier_names
  final bool IsFavorite;

  FoodItem({
    required this.imageURL,
    required this.name,
    required this.price,
    // ignore: non_constant_identifier_names
    this.IsFavorite = false,
  });

  FoodItem copyWith({
    String? imageURL,
    String? name,
    double? price,
    bool? IsFavorite,
  }) {
    return FoodItem(
      imageURL: imageURL ?? this.imageURL,
      name: name ?? this.name,
      price: price ?? this.price,
      IsFavorite: IsFavorite ?? this.IsFavorite,
    );
  }
}

// ignore: non_constant_identifier_names
List<FoodItem> Food = [
  FoodItem(
    imageURL:
        "https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png",
    name: "Beef Burger",
    price: 20,
  ),
  FoodItem(
    imageURL: "https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png",
    name: "Chicken Burger",
    price: 11.66,
  ),
  FoodItem(
    imageURL: "https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png",
    name: "Cheese Burger",
    price: 35,
  ),
  FoodItem(
    imageURL:
        "https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png",
    name: "Chicken Pizza",
    price: 19,
  ),
  FoodItem(
    imageURL:
        "https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png",
    name: "Pasta",
    price: 25.6,
  ),
  FoodItem(
    imageURL:
        "https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png",
    name: "Pasta Two",
    price: 14.99,
  ),
];
