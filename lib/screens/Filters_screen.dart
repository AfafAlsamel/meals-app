import 'package:flutter/material.dart';
import '/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegetarian = widget.filters['vegiterian'];
    _vegan = widget.filters['vegan'];

    super.initState();
  }

  Widget _buildSwitch(
      String title, String subtitle, bool value, Function handler) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: handler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedfilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegetarian,
                'vegiterian': _vegan,
              };
              widget.setFilters(selectedfilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Filters',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitch(
                  'Gluten Free',
                  'Only include Gluten free food',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegan',
                  'Only include Vegan food',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegetarian',
                  'Only include Vegetarian food',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Lactose Free',
                  'Only include Lactose Free food',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
