import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget NameNumberFunction({required String name, required int number}) {
      return Column(
        children: [
          Text(
            number.toString(),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      );
    }

    Widget ListTileCustom({required IconData leadIcon, required String title}) {
      return ListTile(
        leading: Icon(leadIcon, color: Theme.of(context).primaryColor),
        title: Text(title),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () => debugPrint('$title is Tapped'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Me.jpg'),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ahmed Khames',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
              // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NameNumberFunction(name: 'Orders', number: 60),
                NameNumberFunction(name: 'Vouchers', number: 10),
              ],
            ),
            Divider(),
            ListTileCustom(leadIcon: Icons.shopping_cart, title: 'Past Orders'),
            Divider(),
            ListTileCustom(
              leadIcon: Icons.shopping_bag,
              title: 'Available Vouchers',
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
