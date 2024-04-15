import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(String id) onToggleFavorite;
  final bool Function(String id) isFavorite;

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (ctx) {
          return MealDetailScreen(
            meal: meal,
            onToggleFavorite: onToggleFavorite,
            isFavorite: isFavorite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty ? _buildEmptyList() : _buildMealList();

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }

  Widget _buildEmptyList() {
    return Builder(builder: (context) {
      final textTheme = Theme.of(context).textTheme;
      final colorScheme = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found, please add some!',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Try selecting a different category.',
              style: textTheme.titleMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMealList() {
    return ListView.builder(
      itemBuilder: _buildMealItem,
      itemCount: meals.length,
    );
  }

  Widget _buildMealItem(BuildContext context, int index) {
    return MealItem(
      meal: meals[index],
      onSelectedMeal: (meal) => _selectMeal(context, meal),
    );
  }
}
