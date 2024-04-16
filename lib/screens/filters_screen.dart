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

  void _setGlutenFree(bool isChecked) {
    setState(() {
      _glutenFree = isChecked;
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
