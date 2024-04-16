import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

import 'package:meals/models/meal.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';

import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> meals;
  final List<Category> categories;

  const TabsScreen({
    super.key,
    required this.meals,
    required this.categories,
  });

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String _title = 'Categories';
  final List<String> _favoriteMealIds = [];

  // do not use 'final' here, because we will update the values
  final Map<FilterType, bool> _selectedFilters = {
    FilterType.glutenFree: false,
    FilterType.lactoseFree: false,
    FilterType.vegetarian: false,
    FilterType.vegan: false,
  };

  void _showInfoMessage(String message, IconData iconData) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.primaryContainer,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: colorScheme.onPrimaryContainer,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMealIds.indexOf(mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMealIds.removeAt(existingIndex);
      });

      _showInfoMessage(
        "Meal has been removed from your favorites!",
        Icons.delete,
      );
    } else {
      setState(() {
        _favoriteMealIds.add(mealId);
      });

      _showInfoMessage(
        "Meal has been added to your favorites!",
        Icons.favorite,
      );
    }

    //return _isFavorite(mealId);
    // optimize the code by returning the result directly
    return existingIndex < 0;
  }

  bool _isFavorite(String mealId) {
    return _favoriteMealIds.contains(mealId);
  }

  List<Meal> _getFavoriteMeals(List<Meal> meals) {
    return meals.where((meal) {
      return _favoriteMealIds.contains(meal.id);
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
          meals: _getFavoriteMeals(widget.meals),
          onToggleFavorite: _toggleFavorite,
          isFavorite: _isFavorite,
        );

      default:
        return CategoriesScreen(
          onToggleFavorite: _toggleFavorite,
          isFavorite: _isFavorite,
          meals: _getFilteredMeals(widget.meals),
          categories: widget.categories,
        );
    }
  }

  List<Meal> _getFilteredMeals(List<Meal> meals) {
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
