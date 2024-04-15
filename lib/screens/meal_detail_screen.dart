import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  final void Function(String id) onToggleFavorite;
  final bool Function(String id) isFavorite;

  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite(meal.id) ? Icons.favorite : Icons.favorite_border,
              color: isFavorite(meal.id)
                  ? colorScheme.secondary
                  : colorScheme.onBackground,
            ),
            onPressed: () {
              onToggleFavorite(meal.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
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
