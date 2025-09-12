import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/custom_secondary_button.dart';

class CustomBackButton extends StatelessWidget {
  final double height;
  final double width;
  const CustomBackButton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      height: height,
      width: width,
      onTap: Navigator.of(context).pop,
      iconData: Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
    );
  }
}
