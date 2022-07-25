import 'package:car_recommender/recommender/Car.dart';
import 'package:car_recommender/screens/AdvancedScreen.dart';
import 'package:car_recommender/screens/ResultsScreen.dart';
import 'package:flutter/material.dart';
import 'package:car_recommender/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'car-recommender',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      //not needed
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        AdvancedScreen.routeName: (context) => AdvancedScreen(Car.fromData()),
        ResultsScreen.routeName: (context) => ResultsScreen(Car.fromData()),
      },
    );
  }
}

