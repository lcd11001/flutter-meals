import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_provider.dart';

enum FilterType {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<FilterType, bool>> {
  FiltersNotifier()
      : super({
          // FilterType.glutenFree: false,
          // FilterType.lactoseFree: false,
          // FilterType.vegetarian: false,
          // FilterType.vegan: false,
        });

  void toggleFilter(FilterType filterType) {
    final currentValue = state[filterType] ?? false;

    setFilter(filterType, !currentValue);
  }

  void setFilter(FilterType filterType, bool value) {
    // not allowed => mutable state
    // state[filterType] = value;

    state = {
      ...state,
      filterType: value,
    };
  }

  void setFilters(Map<FilterType, bool> newFilters) {
    state = newFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FilterType, bool>>(
  (ref) => FiltersNotifier(),
);

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    final isGlutenFree = selectedFilters[FilterType.glutenFree] ?? false;
    if (isGlutenFree && !meal.isGlutenFree) {
      return false;
    }

    final isLactoseFree = selectedFilters[FilterType.lactoseFree] ?? false;
    if (isLactoseFree && !meal.isLactoseFree) {
      return false;
    }

    final isVegetarian = selectedFilters[FilterType.vegetarian] ?? false;
    if (isVegetarian && !meal.isVegetarian) {
      return false;
    }

    final isVegan = selectedFilters[FilterType.vegan] ?? false;
    if (isVegan && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
