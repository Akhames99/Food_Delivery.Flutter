import 'package:flutter/material.dart';
import 'package:food_delivery/Models/category_item.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Pages/food_details.dart';
import 'package:food_delivery/Utilities/app_assets.dart';
import 'package:food_delivery/Widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryChosenId;
  bool enableCategoryItem = false;
  late List<FoodItem> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = Food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                appAssets.bannerImage,
                height: landscape ? size.height * 0.8 : size.height * 0.26,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              height: size.height * 0.07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (categoryChosenId == Categories[index].id ||
                            !enableCategoryItem) {
                          enableCategoryItem = !enableCategoryItem;
                        }
                        if (enableCategoryItem) {
                          categoryChosenId = Categories[index].id;
                          filteredFood = Food.where(
                            (item) => item.category_id == categoryChosenId,
                          ).toList();
                        } else {
                          categoryChosenId = null;
                          filteredFood = Food;
                        }
                      });
                    },
                    child: Align(
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          color: categoryChosenId == Categories[index].id
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Categories[index].title,
                              style: TextStyle(
                                color: categoryChosenId == Categories[index].id
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(width: 16),
                            Image.asset(Categories[index].imgPath, scale: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: landscape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  final targetedFoodItem = Food.firstWhere(
                    (item) => item.id == filteredFood[index].id,
                  );
                  final targatedIndex = Food.indexOf(targetedFoodItem);

                  Navigator.of(context)
                      .pushNamed(
                        FoodDetails.routeName,
                        arguments: targatedIndex,
                      )
                      .then((onValue) {
                        setState(() {});
                        filteredFood = Food;
                        categoryChosenId = null;
                      });
                },
                child: FoodGridItem(
                  foodIndex: index,
                  filteredFood: filteredFood,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
