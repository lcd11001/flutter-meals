import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';

import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Column(
        children: [
          FilterItem(
            type: FilterType.glutenFree,
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals.",
          ),
          FilterItem(
            type: FilterType.lactoseFree,
            title: "Lactose-free",
            subtitle: "Only include lactose-free meals.",
          ),
          FilterItem(
            type: FilterType.vegan,
            title: "Vegan",
            subtitle: "Only include vegan meals.",
          ),
          FilterItem(
            type: FilterType.vegetarian,
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals.",
          ),
        ],
      ),
    );
  }
}
