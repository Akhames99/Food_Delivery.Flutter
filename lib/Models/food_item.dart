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
  })
  
  {
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
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Flow%2F25e3388d-240e-4785-9e58-0f354406c008.png&w=1200&q=75",
    name: "Cheese Burger",
    price: 20,
  ),
  FoodItem(
    imageURL:
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Flow%2F69d9ee62-646b-429b-bde3-80e25bb96ce5.png&w=1200&q=75",
    name: "Pizza Chicken",
    price: 11.66,
  ),
  FoodItem(
    imageURL:
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Flow%2F1de9be61-c4be-4537-90ec-f4910219f908.png&w=1200&q=75",
    name: "Chicken Burger",
    price: 35,
  ),
  FoodItem(
    imageURL:
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Flow%2F9d685efc-37be-4af2-a48e-0d5989f95142.png&w=1200&q=75",
    name: "Meat Burger",
    price: 19,
  ),
  FoodItem(
    imageURL:
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Flow%2Ffa60bc9a-7d7b-4734-b772-2a0463b883cf.png&w=1200&q=75",
    name: "Rich Burger",
    price: 25.6,
  ),
  FoodItem(
    imageURL:
        "https://pngmax.com/_next/image?url=https%3A%2F%2Fpng-max.s3.ap-south-1.amazonaws.com%2Foriginal%2Fd964c0f1-a4c5-49a5-9b9c-8ad5ad300666.png&w=256&q=75",
    name: "Peperoni Pizza",
    price: 14.99,
  ),
];
