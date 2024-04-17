import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<String>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(String id) {
    // always create a new list
    // .add or .remove will not allow
    debugPrint('toggleFavorite: $id');
    debugPrint('before state: $state address: ${state.hashCode}');
    bool isExist = state.contains(id);

    if (isExist) {
      // remove
      state = state.where((mealId) => mealId != id).toList();
    } else {
      // add
      state = [...state, id];
    }

    debugPrint('after state: $state address: ${state.hashCode}');
    return !isExist;
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<String>>((ref) {
  return FavoriteMealsNotifier();
});
