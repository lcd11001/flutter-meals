import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFree,
            onChanged: (isChecked) {
              setState(() {
                _glutenFree = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 32,
              right: 16,
            ),
          ),
        ],
      ),
    );
  }
}
