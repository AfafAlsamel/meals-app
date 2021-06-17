import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = '/meals-details';

  Widget BuildTitleSection(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget BuildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectMeal.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            BuildTitleSection(context, 'Ingredients'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${selectMeal.ingredients[index]}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  );
                },
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            BuildTitleSection(context, 'Steps'),
             BuildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) =>
                   ListTile(leading: CircleAvatar(child: Text('# ${index + 1}'),
                  ),
                  title: Text( selectMeal.steps[index]),
                  ),
                
                itemCount: selectMeal.steps.length,
          
                  ),
        ),
           ] ),
      ),);
  }
}
