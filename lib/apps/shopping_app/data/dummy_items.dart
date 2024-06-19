import 'package:review_app_2024/apps/shopping_app/data/categories.dart';
import 'package:review_app_2024/apps/shopping_app/models/category.dart';
import 'package:review_app_2024/apps/shopping_app/models/grocery_item.dart';

var groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
