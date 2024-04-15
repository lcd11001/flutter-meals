import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String _title = 'Categories';
  final List<String> _favoriteMealIds = [];

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
      case 0:
        return 'Categories';

      case 1:
        return 'Your Favorites';

      default:
        return 'Categories';
    }
  }

  Widget _getActivePage() {
    switch (_selectedPageIndex) {
      case 1:
        return MealsScreen(
          meals: _getFavoriteMeals(dummyMeals),
          onToggleFavorite: _toggleFavorite,
          isFavorite: _isFavorite,
        );

      default:
        return CategoriesScreen(
          onToggleFavorite: _toggleFavorite,
          isFavorite: _isFavorite,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _getActivePage(),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
