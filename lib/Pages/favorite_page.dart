import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Pages/food_details.dart';
import 'package:food_delivery/Utilities/app_assets.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood = Food.where(
      (foodItem) => foodItem.IsFavorite == true,
    ).toList();

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            SizedBox(height: landscape ? size.height * 0.1 : size.height * 0.2),
            Image.asset(appAssets.emptyState, height: size.height * 0.25),
            const SizedBox(height: 20),
            Text(
              'You Don\'t Have Any Favorites Yet!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            int targetedIndex = Food.indexOf(favoriteFood[index]);
            Navigator.of(context)
                .pushNamed(FoodDetails.routeName, arguments: targetedIndex)
                .then((onValue) => setState(() {}));
          },
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(
                    favoriteFood[index].imageURL,
                    height: landscape ? size.height * 0.2 : size.height * 0.09,
                    width: size.width * 0.3,
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favoriteFood[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$ ${favoriteFood[index].price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final targetedItem = favoriteFood[index];
                      int targetedIndex = Food.indexOf(targetedItem);
                      setState(() {
                        Food[targetedIndex] = Food[targetedIndex].copyWith(
                          IsFavorite: false,
                        );
                        favoriteFood.remove(targetedItem);
                      });
                    },
                    icon: Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor,
                    iconSize: landscape
                        ? size.height * 0.08
                        : size.height * 0.035,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
