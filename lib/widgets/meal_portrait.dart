import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealPortrait extends StatelessWidget {
  const MealPortrait({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Hero(
      tag: meal.id,
      child: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: CachedNetworkImageProvider(
          meal.imageUrl,
          errorListener: (err) {
            debugPrint("Error loading image: $err");
          },
        ),
        imageErrorBuilder: (context, error, stackTrace) => Container(
          height: 200,
          decoration: BoxDecoration(
            color: colorScheme.errorContainer,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error),
                const SizedBox(width: 8),
                Text(
                  "Error loading image",
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        imageSemanticLabel: "screen shot ${meal.title}",
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
      ),
    );
  }
}
