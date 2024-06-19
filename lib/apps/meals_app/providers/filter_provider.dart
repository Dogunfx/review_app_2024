import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_app_2024/apps/meals_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterStateNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterStateNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void updateFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void updateFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterStateNotifier, Map<Filter, bool>>(
        (ref) => FilterStateNotifier());

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final currentFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (currentFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (currentFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (currentFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (currentFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
