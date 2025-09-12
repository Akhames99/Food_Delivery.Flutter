import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Widgets/favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredFood;

  const FoodGridItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  Widget build(BuildContext context) {
    final targatedIndex = Food.indexOf(filteredFood[foodIndex]);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    filteredFood[foodIndex].imageURL,
                    height: constraints.maxHeight * 0.55,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FavoriteButton(
                      foodIndex: targatedIndex,
                      height: constraints.maxHeight * 0.2,
                      width: constraints.maxWidth * 0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.025),
              Text(
                filteredFood[foodIndex].name,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: constraints.maxHeight * 0.04),
              Text(
                '\$ ${filteredFood[foodIndex].price}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: constraints.maxHeight * 0.11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
