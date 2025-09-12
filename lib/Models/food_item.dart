class FoodItem {
  final String id;
  final String imageURL;
  final String name;
  final double price;
  final String category_id;
  final bool IsFavorite;

  const FoodItem({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.price,
    required this.category_id,
    this.IsFavorite = false,
  });

  FoodItem copyWith({
    String? id,
    String? imageURL,
    String? name,
    double? price,
    String? category_id,
    bool? IsFavorite,
  }) {
    return FoodItem(
      id: id ?? this.id,
      imageURL: imageURL ?? this.imageURL,
      name: name ?? this.name,
      price: price ?? this.price,
      category_id: category_id ?? this.category_id,
      IsFavorite: IsFavorite ?? this.IsFavorite,
    );
  }
}

// ignore: non_constant_identifier_names
List<FoodItem> Food = [
  FoodItem(
    id: 'burger 1',
    imageURL:
        "https://freepngimg.com/save/147673-burger-non-veg-king-free-download-png-hq/1200x800",
    name: "Beef Burger",
    price: 5.99,
    category_id: '1',
  ),
  FoodItem(
    id: 'burger 2',
    imageURL:
        "https://freepngimg.com/save/10723-burger-free-png-image/1100x878",
    name: "Chicken Burger",
    price: 7.99,
    category_id: '1',
  ),
  FoodItem(
    id: 'burger 3',

    imageURL:
        "https://freepngimg.com/save/77400-king-whopper-hamburger-burgers-food-cheeseburger-fast/1501x1501",
    name: "Cheese Burger",
    price: 4.99,
    category_id: '1',
  ),
  FoodItem(
    id: 'pizza 1',
    imageURL: "https://freepngimg.com/thumb/pizza/35-pizza-png-image.png",
    name: "Chicken Pizza",
    price: 12.99,
    category_id: '2',
  ),
  FoodItem(
    id: 'pasta 1',
    imageURL:
        "https://freepngimg.com/save/139396-food-plate-top-noodle-view/640x640",
    name: "Pasta",
    price: 17.99,
    category_id: '3',
  ),
  FoodItem(
    id: 'nuggets 1',
    imageURL:
        "https://freepngimg.com/save/173559-photos-fries-finger-free-png-hq/874x608",
    name: "Nuggets",
    price: 14.99,
    category_id: '4',
  ),
];
