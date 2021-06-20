import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '/screens/Filters_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meals_details_screen.dart';
import 'screens/tabbar_screen.dart';
import '/dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegiterian': false,
  };
  List<Meal> _filteredMealsList = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;

      _filteredMealsList.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
   void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepPurpleAccent[300],
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       body1: TextStyle(color: Colors.black87),
        //       body2: TextStyle(color: Colors.black54),
        //       title: TextStyle(
        //         fontFamily: 'RobotoCondensed',
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabBarScreen(_favoriteMeals),
        CategoriesMeals.routeName: (ctx) => CategoriesMeals(_filteredMealsList),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters,_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
