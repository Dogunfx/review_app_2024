import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_app_2024/apps/meals_app/model/db.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
