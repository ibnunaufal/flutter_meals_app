import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;
    final categoryMeals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final selected = categoryMeals[index];
            return MealItem(
                id: selected.id,
                title: selected.title,
                imageUrl: selected.imageUrl,
                duration: selected.duration,
                complexity: selected.complexity,
                affordability: selected.affordability);
            //MealItem(title: title, imageUrl: imageUrl, duration: duration, complexity: complexity, affordability: affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
