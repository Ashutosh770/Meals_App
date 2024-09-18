import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widget/meal_item.dart';
//import 'package:meals_app/data/dummydata.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    //required this.onToggleFavorite,
  });
  final String? title;
  final List<Meal> meals;
  // final Function(Meal meal) onToggleFavorite;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealDetailsScreen(
        meal: meal, //onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meals.isEmpty) {
      content = const Center(child: Text('Uh.Oh. there is nothing to show!'));
    } else {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: selectMeal,
          );
        },
      );
    }
    if (title == null) return content;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 181, 134, 134),
        appBar: AppBar(title: Text(title!)),
        body: content);
  }
}
