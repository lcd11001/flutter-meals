import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/widgets/filter_item.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  void _setGlutenFree(bool isChecked) {
    setState(() {
      _glutenFree = isChecked;
    });
  }

  void _setLactoseFree(bool isChecked) {
    setState(() {
      _lactoseFree = isChecked;
    });
  }

  void _setVegetarian(bool isChecked) {
    setState(() {
      _vegetarian = isChecked;
    });
  }

  void _setVegan(bool isChecked) {
    setState(() {
      _vegan = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(
        onDrawerItemTap: _setScreen,
      ),
      body: Column(
        children: [
          FilterItem(
            isChecked: _glutenFree,
            onChanged: _setGlutenFree,
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals.",
          ),
          FilterItem(
            isChecked: _lactoseFree,
            onChanged: _setLactoseFree,
            title: "Lactose-free",
            subtitle: "Only include lactose-free meals.",
          ),
          FilterItem(
            isChecked: _vegan,
            onChanged: _setVegan,
            title: "Vegan",
            subtitle: "Only include vegan meals.",
          ),
          FilterItem(
            isChecked: _vegetarian,
            onChanged: _setVegetarian,
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals.",
          ),
        ],
      ),
    );
  }

  void _setScreen(String value) {
    Navigator.of(context).pop();

    if (value == 'Meals') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const TabsScreen(),
        ),
      );
    }
  }
}
