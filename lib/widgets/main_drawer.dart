import 'package:flutter/material.dart';
import 'package:meals/widgets/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String value) onDrawerItemTap;

  const MainDrawer({
    super.key,
    required this.onDrawerItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: colorScheme.background,
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primaryContainer,
                colorScheme.primaryContainer.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 18),
              Text(
                'Cooking up!',
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: 'Meals',
          onDrawerItemTap: onDrawerItemTap,
          leadingIcon: Icons.restaurant,
        ),
        DrawerItem(
          title: 'Filters',
          onDrawerItemTap: onDrawerItemTap,
          leadingIcon: Icons.settings,
        ),
      ]),
    );
  }
}
