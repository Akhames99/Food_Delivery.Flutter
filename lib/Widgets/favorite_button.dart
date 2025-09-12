import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Widgets/custom_secondary_button.dart';

class FavoriteButton extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;
  const FavoriteButton({
    super.key,
    required this.foodIndex,
    required this.height,
    required this.width,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      height: widget.height,
      width: widget.width,
      onTap: () => setState(() {
        Food[widget.foodIndex] = Food[widget.foodIndex].copyWith(
          IsFavorite: !Food[widget.foodIndex].IsFavorite,
        );
      }),
      iconData: Food[widget.foodIndex].IsFavorite
          ? Icons.favorite
          : Icons.favorite_border,
    );
  }
}
