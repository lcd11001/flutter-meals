import 'dart:math';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  Category.randomColor({
    required this.id,
    required this.title,
  }) : color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  const Category({
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  String toString() {
    return 'Category(id: $id, title: $title, color: $color)';
  }
}
