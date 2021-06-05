import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes_util.dart';

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
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = meal.isGlutenFree && settings.isGlutenFree;
        final filterLactose = meal.isLactoseFree && settings.isLactoseFree;
        final filterVegan = meal.isVegan && settings.isVegan;
        final filterVegetarian = meal.isVegetarian && meal.isVegetarian;

        return filterGluten && filterLactose && filterVegan && filterVegetarian;
      }).toList();
    });
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
        AppRoutes.HOME: (context) => TabScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals),
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
