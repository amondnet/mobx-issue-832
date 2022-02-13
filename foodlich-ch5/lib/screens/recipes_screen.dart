import 'package:flutter/material.dart';
import 'package:fooderlich/models/simple_recipe.dart';
import '../components/recipes_grid_view.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes:
              (snapshot.data as List<SimpleRecipe>));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
