import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
        leading: Icon(
          leadIcon,
          color: Theme.of(context).primaryColor,
          size: landscape ? size.height * 0.07 : size.height * 0.03,
        ),
        title: Text(title),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
          size: landscape ? size.height * 0.07 : size.height * 0.03,
        ),
        onTap: () => debugPrint('$title is Tapped'),
      );
    }

    Widget PersonPhoto(height, width) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/images/Me.jpg')),
        ),
      );
    }

    final personname = Text(
      'khabib nurmagomedov',
      style: Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!landscape) ...[
              PersonPhoto(size.height * 0.25, size.width * 10),
              SizedBox(height: 8.0),
              personname,
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NameNumberFunction(name: 'Orders', number: 60),
                  NameNumberFunction(name: 'Vouchers', number: 10),
                ],
              ),
              SizedBox(height: 16.0),
            ],
            if (landscape) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      PersonPhoto(size.height * 0.5, size.width * 0.35),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Khabib', style: TextStyle(fontSize: 30)),
                      Text('nurmagomedov'),
                    ],
                  ),
                  Column(
                    children: [
                      NameNumberFunction(name: 'Orders', number: 60),
                      Divider(),
                      NameNumberFunction(name: 'Vouchers', number: 10),
                    ],
                  ),
                ],
              ),
            ],
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
