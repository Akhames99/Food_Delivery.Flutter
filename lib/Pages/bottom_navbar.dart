import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/favorite_page.dart';
import 'package:food_delivery/Pages/home_page.dart';
import 'package:food_delivery/Pages/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 0;
  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = [HomePage(), FavoritesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('food_delivery')),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Center(child: Text('You Are In The Drawer Now')),
      ),
      body: bodyOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
