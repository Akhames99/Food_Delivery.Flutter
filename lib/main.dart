import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/bottom_navbar.dart';
import 'package:food_delivery/Pages/food_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSerif',
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Delivery_App.Flutter',
      routes: {
        '/': (context) => const BottomNavBarPage(),
        FoodDetails.routeName: (context) => const FoodDetails(),
      },
    );
  }
}
