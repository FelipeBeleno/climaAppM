import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
