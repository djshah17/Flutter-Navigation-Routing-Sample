import 'package:flutter/material.dart';
import 'package:flutternavigationsample/first_screen.dart';
import 'package:flutternavigationsample/second_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/FirstScreen':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/SecondScreen':
      // Validation of correct data type
        if (args is List<String>) {
          return MaterialPageRoute(
            builder: (_) => SecondScreen(
              listPlayerNames: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}