import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filtered_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'package:meal_app/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filtered){
    setState(() {
      _filters = filtered;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] as bool && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] as bool && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] as bool && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] as bool && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1)
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx)=> MealDetailsScreen(),
        FilteredScreen.routeName: (ctx)=> FilteredScreen(_filters ,_setFilters)
      },
    );
  }
}

