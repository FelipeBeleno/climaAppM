import 'dart:math';

import 'package:clima_app/Search/city_delegate.dart';
import 'package:clima_app/helpers/card.dart';
import 'package:clima_app/helpers/list_view.dart';
import 'package:clima_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 6))
        ..repeat();
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    LoaderIcon(controller: _controller),
                    Expanded(child: Container()),
                    IconButton(
                        padding: EdgeInsets.only(right: 50, bottom: 50),
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          print('hola');
                          /*showSearch(
                            context: context, delegate: CitySeachDelegate())*/
                        },
                        icon: Icon(
                          Icons.manage_search_sharp,
                          size: 70,
                          color: Colors.amber,
                        ))
                  ],
                ),
                const CardContainer(),
                FutureBuilder(
                  future: appProvider.getCityCurrent(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ListHorizontal());
                    }
                    return Text('fallo');
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class LoaderIcon extends StatelessWidget {
  const LoaderIcon({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Hero(
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
            size: 75,
          ),
        ),
      ),
    );
  }
}
