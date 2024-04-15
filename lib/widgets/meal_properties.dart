import 'package:flutter/material.dart';

class MealProperties extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealProperties({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
