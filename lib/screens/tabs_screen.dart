import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';

import 'package:meals/widgets/main_drawer.dart';

import 'package:meals/providers/meal_provider.dart';
import 'package:meals/providers/favorites_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  String _title = 'Categories';

  // do not use 'final' here, because we will update the values
  final Map<FilterType, bool> _selectedFilters = {
    FilterType.glutenFree: false,
    FilterType.lactoseFree: false,
    FilterType.vegetarian: false,
    FilterType.vegan: false,
  };

  List<Meal> _getFavoriteMeals() {
    final meals = ref.watch(mealsProvider);
    final favoriteMealIds = ref.watch(favoritesProvider);

    return meals.where((meal) {
      return favoriteMealIds.contains(meal.id);
    }).toList();
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
        return MealsScreen(
          meals: _getFavoriteMeals(),
        );

      default:
        return CategoriesScreen(
          meals: _getFilteredMeals(),
          categories: ref.watch(categoriesProvider),
        );
    }
  }

  List<Meal> _getFilteredMeals() {
    final meals = ref.watch(mealsProvider);

    return meals.where((meal) {
      if (_selectedFilters[FilterType.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters[FilterType.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectedFilters[FilterType.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectedFilters[FilterType.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
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
          icon: Icon(Icons.star),
          label: 'Favorites',
        ),
      ],
    );
  }

  void _setScreen(String value) async {
    Navigator.of(context).pop();

    if (value == 'Filters') {
      // Navigator.of(context).pushReplacement(
      final result = await Navigator.of(context).push<Map<FilterType, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      // debugPrint('Filters result: $result');
      setState(() {
        if (result != null) {
          _selectedFilters.addAll(result);
        }
      });
      debugPrint('Selected filters: $_selectedFilters');
    }
  }
}
