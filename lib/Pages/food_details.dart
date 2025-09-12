import 'package:flutter/material.dart';
import 'package:food_delivery/Models/food_item.dart';
import 'package:food_delivery/Widgets/custom_back_button.dart';
import 'package:food_delivery/Widgets/favorite_button.dart';
import 'package:food_delivery/Widgets/food_details/fooditem_counter.dart';
import 'package:food_delivery/Widgets/food_details/property_item.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  static const String routeName = '/food_details';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int foodIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBackButton(
                      height: size.height * 0.06,
                      width: size.width * 0.12,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FavoriteButton(
                        foodIndex: foodIndex,
                        height: size.height * 0.06,
                        width: size.width * 0.12,
                      ),
                    ),
                  ],
                  expandedHeight: size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          Food[foodIndex].imageURL,
                          fit: BoxFit.contain,
                          height: size.height * 0.35,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsetsGeometry.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Food[foodIndex].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Buffalo Burger',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              FooditemCounter(),
                            ],
                          ),
                          const SizedBox(height: 32),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: PropertyItem(
                                    PropertyName: 'Size',
                                    PropertyValue: 'Medium',
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  child: PropertyItem(
                                    PropertyName: 'Cooking',
                                    PropertyValue: '10-20 Minutes',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum LoremIpsum',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Row(
              children: [
                Text(
                  '\$ ${Food[foodIndex].price}',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Container(
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.deepOrange,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {},
                      child: Text('CheckOut'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
