import 'package:flutter/material.dart';
import 'package:flutternavigationsample/first_screen.dart';
import 'package:flutternavigationsample/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}