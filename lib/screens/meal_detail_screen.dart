import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/meal_portrait.dart';

class MealDetailScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  void _showInfoMessage(
      BuildContext context, String message, IconData iconData) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.primaryContainer,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: colorScheme.onPrimaryContainer,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final notifier = ref.watch(favoritesProvider.notifier);

    final isFavorite = notifier.isFavorite(meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          Semantics(
            label: 'Favorite',
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? colorScheme.secondary
                    : colorScheme.onBackground,
              ),
              onPressed: () {
                final wasAdded = notifier.toggleFavorite(meal.id);

                _showInfoMessage(
                  context,
                  wasAdded ? 'Added to favorites' : 'Removed from favorites',
                  wasAdded ? Icons.favorite : Icons.delete,
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealPortrait(meal: meal),
            const SizedBox(height: 20),
            _buildDetail(context, 'Ingredients', meal.ingredients),
            const SizedBox(height: 20),
            _buildDetail(context, 'Steps', meal.steps),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(
      BuildContext context, String title, List<String> details) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.primary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 10),
        for (final detail in details)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 6.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Icon(
                    Icons.arrow_right,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    detail,
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
