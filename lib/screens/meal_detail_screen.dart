import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  final bool Function(String id) onToggleFavorite;
  final bool Function(String id) isFavorite;

  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  State<StatefulWidget> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late bool _isFavorite;
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite(widget.meal.id);
  }

  void _setFavorite(bool value) {
    setState(() {
      _isFavorite = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          Semantics(
            label: 'Favorite',
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite
                    ? colorScheme.secondary
                    : colorScheme.onBackground,
              ),
              onPressed: () {
                _setFavorite(widget.onToggleFavorite(widget.meal.id));
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            _buildDetail(context, 'Ingredients', widget.meal.ingredients),
            const SizedBox(height: 20),
            _buildDetail(context, 'Steps', widget.meal.steps),
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
