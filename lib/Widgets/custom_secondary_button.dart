import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final IconData iconData;
  const SecondaryButton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(iconData, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
