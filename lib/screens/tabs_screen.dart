import 'package:flutter/material.dart';
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
      case 0:
        return const CategoriesScreen();

      case 1:
        return const MealsScreen(meals: []);

      default:
        return const CategoriesScreen();
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
