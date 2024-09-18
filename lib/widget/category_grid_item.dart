import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});
  final Category category;
  final Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    //or u can use "GestureDetector" isntead of inkwell but in getsure.. we dont get feedback option
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: category.color,
          ),
          child: Text(category.title)),
    );
  }
}
