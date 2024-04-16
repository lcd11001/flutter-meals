import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_item.dart';

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
}
