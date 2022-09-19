import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 6))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(135, 206, 250, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'id_sun',
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: child,
                  );
                },
                child: Icon(
                  Icons.wb_sunny_rounded,
                  color: Colors.amber,
                  size: 200,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    //side: BorderSide(color: Colors.red),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, 'index_screen');
              },
              child: Text(
                'Ingresar',
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
