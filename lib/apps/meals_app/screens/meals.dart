import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/meals_app/model/meal.dart';
import 'package:review_app_2024/apps/meals_app/screens/meal_details.dart';
import 'package:review_app_2024/apps/meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(
                  meal: meal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: () {
              selectMeal(context, meals[index]);
            },
          );
        });

    if (meals.isEmpty) {
      mainContent = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nothing to display here",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Try Selecting a different Category",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return mainContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mainContent,
    );
  }
}
