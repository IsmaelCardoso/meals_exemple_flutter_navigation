import 'package:flutter/material.dart';

import 'screens/settings_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

import 'utils/app_routes_util.dart';

import 'models/settings_model.dart';
import 'models/meal_model.dart';

import 'data/dummy_data.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  color: Colors.white,
                ),
              ),
        ),
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        fontFamily: 'Releway',
        canvasColor: Color.fromRGBO(211, 211, 211, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (context) =>
            SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },
      // onGenerateInitialRoutes: (settings) {
      //   if (settings.name == '/something') {
      //     return null;
      //   } else if (settings.name == '/another-thing') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (_) => CategoriesScreen(),
      //     );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) => CategoriesScreen(),
      //   );
      // },
    );
  }
}
