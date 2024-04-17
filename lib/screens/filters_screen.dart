import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/filters_provider.dart';

import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  late bool _glutenFree;
  late bool _lactoseFree;
  late bool _vegetarian;
  late bool _vegan;

  @override
  void initState() {
    super.initState();
    final currentFilters = ref.read(filtersProvider);

    _glutenFree = currentFilters[FilterType.glutenFree] ?? false;
    _lactoseFree = currentFilters[FilterType.lactoseFree] ?? false;
    _vegetarian = currentFilters[FilterType.vegetarian] ?? false;
    _vegan = currentFilters[FilterType.vegan] ?? false;
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
        // mark this as 'false' to wait return value from popInvoked if we don't use provider
        // mark this as 'true' to close this immediately as we use provider
        canPop: true,
        onPopInvoked: (didPop) {
          // debugPrint('didPop: $didPop');
          // if (didPop) {
          //   return;
          // }
          ref.read(filtersProvider.notifier).setFilters({
            FilterType.glutenFree: _glutenFree,
            FilterType.lactoseFree: _lactoseFree,
            FilterType.vegetarian: _vegetarian,
            FilterType.vegan: _vegan,
          });
          // Navigator.of(context).pop();
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
