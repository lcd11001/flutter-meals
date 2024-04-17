import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/animation_slide_up.dart';

import 'package:meals/widgets/main_drawer.dart';

import 'package:meals/providers/meal_provider.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  String _title = 'Categories';

  List<Meal> _getFavoriteMeals() {
    return ref.watch(favoriteMealsProvider);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      _title = _getTitle();
    });
  }

  String _getTitle() {
    switch (_selectedPageIndex) {
      case 1:
        return 'Your Favorites';

      default:
        return 'Select Category';
    }
  }

  Widget _getActivePage() {
    switch (_selectedPageIndex) {
      case 1:
        return AnimationSlideUp.withDuration(
          300,
          child: MealsScreen(
            meals: _getFavoriteMeals(),
          ),
        );

      default:
        return AnimationSlideUp.withDuration(
          300,
          child: CategoriesScreen(
            meals: _getFilteredMeals(),
            categories: ref.watch(categoriesProvider),
          ),
        );
    }
  }

  List<Meal> _getFilteredMeals() {
    return ref.watch(filterMealsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: MainDrawer(
        onDrawerItemTap: _setScreen,
      ),
      body: _getActivePage(),
      bottomNavigationBar: _buildTabBar(),
    );
  }

  Widget _buildTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedPageIndex,
      onTap: _selectPage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }

  void _setScreen(String value) {
    Navigator.of(context).pop();

    if (value == 'Filters') {
      // Navigator.of(context).pushReplacement(
      Navigator.of(context).push<Map<FilterType, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }
}
