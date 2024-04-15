import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (ctx) {
          return MealsScreen(
            title: category.title,
            meals: _filteredMeals(category),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const kPadding = 20.0;

    return GridView(
      padding: const EdgeInsets.all(kPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: kPadding,
        mainAxisSpacing: kPadding,
      ),
      children: _buildGridItems(context),
    );
  }

  List<CategoryGridItem> _buildGridItems(BuildContext context) {
    return availableCategories.map((category) {
      return CategoryGridItem(
          category: category,
          onSelectedCategory: (c) => _selectCategory(context, c));
    }).toList();
  }

  _filteredMeals(Category category) {
    return dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
  }
}
