import 'package:food_delivery/Utilities/app_assets.dart';

class CategoryItem {
  final String id;
  final String title;
  final String imgPath;

  CategoryItem({required this.id, required this.title, required this.imgPath});
}

final List<CategoryItem> Categories = [
  CategoryItem(id: '1', title: 'Burger', imgPath: appAssets.burgerIcon),
  CategoryItem(id: '2', title: 'Pizza', imgPath: appAssets.pizzaIcon),
  CategoryItem(id: '3', title: 'Pasta', imgPath: appAssets.pastaIcon),
  CategoryItem(id: '4', title: 'Nuggets', imgPath: appAssets.nuggetsIcon),
];
