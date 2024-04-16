import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_item.dart';

enum FilterType {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  final Map<FilterType, bool> currentFilters;

  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<StatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFree;
  late bool _lactoseFree;
  late bool _vegetarian;
  late bool _vegan;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[FilterType.glutenFree] ?? false;
    _lactoseFree = widget.currentFilters[FilterType.lactoseFree] ?? false;
    _vegetarian = widget.currentFilters[FilterType.vegetarian] ?? false;
    _vegan = widget.currentFilters[FilterType.vegan] ?? false;
  }

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
      body: PopScope(
        // mark this as 'false' to wait return value from popInvoked
        canPop: false,
        onPopInvoked: (didPop) {
          debugPrint('didPop: $didPop');
          if (didPop) {
            return;
          }
          Navigator.of(context).pop({
            FilterType.glutenFree: _glutenFree,
            FilterType.lactoseFree: _lactoseFree,
            FilterType.vegetarian: _vegetarian,
            FilterType.vegan: _vegan,
          });
        },
        child: Column(
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
      ),
    );
  }
}
