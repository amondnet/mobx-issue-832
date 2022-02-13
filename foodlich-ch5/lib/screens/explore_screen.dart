import 'package:flutter/material.dart';
import 'package:fooderlich/components/friend_post_list_view.dart';
import 'package:fooderlich/models/explore_data.dart';
import 'package:fooderlich/models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(scrollDirection: Axis.vertical, children: [
              TodayRecipeListView(
                  recipes: (snapshot.data as ExploreData).todayRecipes),
              const SizedBox(height: 16),
              FriendPostListView(
                  friendPosts: (snapshot.data as ExploreData).friendPosts),
            ]);
          } else {
            // 10
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
