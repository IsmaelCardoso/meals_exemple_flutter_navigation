import 'package:flutter/material.dart';

import '../widgets/meal_item_widget.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
