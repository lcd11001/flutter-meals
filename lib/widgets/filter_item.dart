import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/filters_provider.dart';

class FilterItem extends ConsumerWidget {
  final FilterType type;
  final String title;
  final String? subtitle;

  const FilterItem({
    super.key,
    required this.type,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final currentValue = ref.watch(filtersProvider)[type] ?? false;

    return SwitchListTile(
      value: currentValue,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(type, isChecked);
      },
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
