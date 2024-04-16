import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String? subtitle;
  final Function(bool isChecked) onChanged;

  const FilterItem({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SwitchListTile(
      value: isChecked,
      onChanged: onChanged,
      title: Text(
        title,
        style: textTheme.titleLarge!.copyWith(
          color: colorScheme.onBackground,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
            )
          : null,
      activeColor: colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 32,
        right: 16,
      ),
    );
  }
}
