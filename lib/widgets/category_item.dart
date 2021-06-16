import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.title, this.color, this.id});

  void goToMealsScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMeals.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealsScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color,
              color.withOpacity(0.7),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
