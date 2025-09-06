import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteFood = Food.where(
      (foodItem) => foodItem.IsFavorite == true,
    ).toList();

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset('assets/images/Empty.png', height: 300),
            Text(
              'You Don\'t Have Any Favorites Yet!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
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
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  favoriteFood[index].imageURL,
                  height: MediaQuery.of(context).size.height * 0.09,
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
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
