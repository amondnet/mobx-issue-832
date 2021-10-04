import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {

  static const routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("meal: $mealId"),
      ),
      body: Text('Meal - $mealId'),
    );
  }
}
