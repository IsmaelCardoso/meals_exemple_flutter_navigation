import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../widgets/meal_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No food was selected as a favorite.'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(meal: favoriteMeals[index]);
          });
    }
  }
}
