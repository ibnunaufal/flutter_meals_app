import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, childAspectRatio: 3 / 2),
        children:
            DUMMY_CATEGORIES.map((e) => CategoryItem(e.title, e.color)).toList(),
      ),
    );
  }
}
