import 'package:clima_app/providers/app_provider.dart';
import 'package:clima_app/screens/index_screen.dart';
import 'package:clima_app/screens/loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:geolocator/geolocator.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'JosefinSans'),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (context) => const Loader(),
        'index_screen': (context) => const IndexScreen()
      },
    );
  }
}
