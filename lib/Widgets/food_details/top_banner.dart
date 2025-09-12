import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Widgets/custom_back_button.dart'
    show CustomBackButton;
import 'package:food_delivery/Widgets/favorite_button.dart' show FavoriteButton;

class TopBanner extends StatelessWidget {
  final int foodIndex;
  const TopBanner({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      height: size.height * 0.06,
                      width: size.width * 0.12,
                    ),
                    FavoriteButton(
                      foodIndex: foodIndex,
                      height: size.height * 0.06,
                      width: size.width * 0.12,
                    ),
                  ],
                ),
              ),
              Image.network(
                Food[foodIndex].imageURL,
                fit: BoxFit.contain,
                height: size.height * 0.35,
                width: size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
