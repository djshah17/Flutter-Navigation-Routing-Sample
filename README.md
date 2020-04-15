# Flutter-Navigation-Routing-Sample
A demo app to demonstrate navigation and routing between different screens in flutter app.

## Create dynamic RouteGenerator Class
```dart
import 'package:flutter/material.dart';
import 'package:flutternavigationsample/first_screen.dart';
import 'package:flutternavigationsample/second_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/FirstScreen':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/SecondScreen':
        return MaterialPageRoute(builder: (_) => SecondScreen());
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
```

## Integrate RouteGenerator Class in main.dart file
```dart
import 'package:flutter/material.dart';
import 'package:flutternavigationsample/first_screen.dart';
import 'package:flutternavigationsample/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
```

## Navigate from First Screen to Second Screen
```dart
Navigator.pushNamed(context, "/SecondScreen");
```

## Pass arguments Between Screens

### Set argumants in first screen
```dart
List<String> playerNames = ["Cristiano Ronaldo, Lional Messi"];
Navigator.pushNamed(context, "/SecondScreen", arguments: playerNames);
```

### Pass arguments in RouteGenerator class
```dart
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
```

### Get arguments in Second Screen
```dart
List<String> listPlayerNames;
SecondScreen({this.listPlayerNames});
```

## Return data from Second Screen to First Screen with Pop

### Make changes in Second Screen
```dart
Navigator.pop(context,playerName);
```

### Make changes in First Screen
```dart
displayResult(BuildContext context, List<String> playerNames) async{
    final getSelectedPlayerName = await Navigator.pushNamed(context, "/SecondScreen", arguments: playerNames);
    print(getSelectedPlayerName.toString());
}
```
