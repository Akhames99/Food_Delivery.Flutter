import 'package:flutter/material.dart';

class FooditemCounter extends StatefulWidget {
  const FooditemCounter({super.key});

  @override
  State<FooditemCounter> createState() => _FooditemCounterState();
}

class _FooditemCounterState extends State<FooditemCounter> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: decrementCounter,
            icon: Icon(
              Icons.minimize_rounded,
              color: counter <= 1 ? Colors.grey[400] : Colors.black,
            ),
          ),
          Text(
            counter.toString(),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: Colors.deepOrange),
          ),
          IconButton(
            onPressed: incrementCounter,
            icon: Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
