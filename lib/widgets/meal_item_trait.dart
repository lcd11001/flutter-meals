import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          color: colorScheme.onInverseSurface,
          size: 17,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onInverseSurface,
          ),
        ),
      ],
    );
  }
}
