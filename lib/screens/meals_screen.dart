import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({super.key, required this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty ? _buildEmptyList() : _buildMealList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
              style: textTheme.headlineLarge!.copyWith(
                color: colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Try selecting a different category.',
              style: textTheme.headlineMedium!.copyWith(
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Text(
      meals[index].title,
      style: textTheme.bodyMedium!.copyWith(
        color: colorScheme.onBackground,
      ),
    );
  }
}
