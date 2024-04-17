import 'package:flutter_riverpod/flutter_riverpod.dart';

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
