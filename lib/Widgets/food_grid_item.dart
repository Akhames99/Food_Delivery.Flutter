import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
  @override
  Widget build(BuildContext context) {
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
                    Food[widget.foodIndex].imageURL,
                    height: constraints.maxHeight * 0.55,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => setState(() {
                        Food[widget.foodIndex] = Food[widget.foodIndex]
                            .copyWith(IsFavorite: true);
                      }),
                      child: Container(
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[100],
                        ),
                        child: Icon(
                          Food[widget.foodIndex].IsFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.025),
              Text(
                Food[widget.foodIndex].name,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: constraints.maxHeight * 0.04),
              Text(
                '\$ ${Food[widget.foodIndex].price}',
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
