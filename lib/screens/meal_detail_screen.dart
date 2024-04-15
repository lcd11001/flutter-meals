import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: NetworkImage(meal.imageUrl),
        fit: BoxFit.cover,
        height: 300,
        width: double.infinity,
      ),
    );
  }
}
