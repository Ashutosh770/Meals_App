//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummydata.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal.dart';
import 'package:meals_app/widget/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCateagory(context, Category category) {
    final filteredMeals = List.of(
      widget.availableMeals.where(
        (meal) {
          return meal.categories.contains(category.id);
        },
      ),
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              MealsScreen(title: category.title, meals: filteredMeals),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        // return Padding(
        //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        //   child: child,
        // );
        return SlideTransition(
          position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
          // position: _animationController
          //     .drive(Tween(begin:const Offset(0, 0.3), end:const Offset(0, 0)))
          child: child,
        );
      },
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (var category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCateagory(context, category);
                },
              )
          ]),
    );
  }
}
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen(
//       {super.key,
//       //required this.onToggleFavorite,
//       required this.availableMeals});
//   //final Function(Meal meal) onToggleFavorite;
//   final List<Meal> availableMeals;
//   void _selectCateagory(context, Category category) {
//     final filteredMeals = List.of(
//       availableMeals.where(
//         (meal) {
//           return meal.categories.contains(category.id);
//         },
//       ),
//     );
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (ctx) => MealsScreen(
//               //onToggleFavorite: onToggleFavorite,
//               title: category.title,
//               meals: filteredMeals),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3 / 2,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20),
//           children: [
//             for (var category in availableCategories)
//               CategoryGridItem(
//                 category: category,
//                 onSelectCategory: () {
//                   _selectCateagory(context, category);
//                 },
//               )
//           ]),
//     );
//   }
// }
