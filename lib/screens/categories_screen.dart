import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const kPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(kPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: kPadding,
          mainAxisSpacing: kPadding,
        ),
        children: _buildGridItems(),
      ),
    );
  }

  List<CategoryGridItem> _buildGridItems() {
    return availableCategories.map((category) {
      return CategoryGridItem(category: category);
    }).toList();
  }
}
