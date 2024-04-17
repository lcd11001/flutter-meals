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
          FilterType.glutenFree: false,
          FilterType.lactoseFree: false,
          FilterType.vegetarian: false,
          FilterType.vegan: false,
        });

  void toggleFilter(FilterType filterType) {
    final currentValue = state[filterType] ?? false;

    // not allowed => mutable state
    // state[filterType] = !currentValue;

    state = {
      ...state,
      filterType: !currentValue,
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
