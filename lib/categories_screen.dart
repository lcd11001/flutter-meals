import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          Container(
            color: Colors.red,
            child: Text('1'),
          ),
          Container(
            color: Colors.green,
            child: Text('2'),
          ),
          Container(
            color: Colors.blue,
            child: Text('3'),
          ),
          Container(
            color: Colors.yellow,
            child: Text('4'),
          ),
          Container(
            color: Colors.purple,
            child: Text('5'),
          ),
          Container(
            color: Colors.cyan,
            child: Text('6'),
          ),
        ],
      ),
    );
  }
}
