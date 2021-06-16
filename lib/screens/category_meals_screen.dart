import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMeals extends StatelessWidget {
  static const routeName = '/categories-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final mealsCategories = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: mealsCategories[index].id,
              title: mealsCategories[index].title,
              imageUrl: mealsCategories[index].imageUrl,
              complexity: mealsCategories[index].complexity,
              affordability: mealsCategories[index].affordability,
              duration: mealsCategories[index].duration,
            );
          },
          itemCount: mealsCategories.length,
          ),
    );
  }
}
