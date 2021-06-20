import 'package:flutter/material.dart';


import '/screens/Filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.purple,
            width: double.infinity,
            alignment: Alignment.center,
            height: 100,
            child: Text(
              'Lets Start Cooking',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          BuildListTile(
            'Meals',
            Icons.category,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          SizedBox(
            height: 15,
          ),
          BuildListTile('Filter', Icons.settings,
             () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
