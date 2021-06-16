import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meals_details_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (ctx) => CategoriesScreen(),
        CategoriesMeals.routeName: (ctx) => CategoriesMeals(),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(),
      },
      onUnknownRoute:(settings){ return MaterialPageRoute(builder: (ctx)=>CategoriesScreen(),);
      },
      );
    
  }
}
