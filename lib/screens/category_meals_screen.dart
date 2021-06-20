import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoriesMeals extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> filteredMealsList;

  CategoriesMeals(this.filteredMealsList);

  

  @override
  _CategoriesMealsState createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  String categoryTitle;
  List<Meal> mealsCategories;
var didItemsLoad = false;

  @override
  void didChangeDependencies() {
    if (!didItemsLoad) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      mealsCategories = widget.filteredMealsList.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      didItemsLoad = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      mealsCategories.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
