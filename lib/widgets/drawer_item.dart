import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? leadingIcon;
  final String title;
  final void Function(String value) onDrawerItemTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.onDrawerItemTap,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: leadingIcon != null
          ? Icon(
              leadingIcon,
              size: 24,
              color: colorScheme.onBackground,
            )
          : null,
      title: Text(
        title,
        style: textTheme.titleLarge!.copyWith(
          color: colorScheme.onBackground,
        ),
      ),
      onTap: () => onDrawerItemTap(title),
    );
  }
}
