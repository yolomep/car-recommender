import 'package:car_recommender/recommender/Car.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class ResultsScreen extends StatefulWidget {
  Car data;
  ResultsScreen(this.data, {Key? key}) : super(key: key);

  static const String routeName = "/ResultsScreen";

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<Car> allCars = [];
  Car currentCar = Car.fromData();
  int currentIndex = 0;

  Future<String> readData() async {
    try {
      return await rootBundle.loadString('data/car.csv');
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.

                title: Text("Error!"),
                content: Text(
                    "The data files have been deleted or cannot be accessed. Please try reinstalling the app again."),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      exit(0);
                    },
                  )
                ]);
          });
      return "Dummy";
    }
  }

  @override
  void initState() {
    super.initState();

    readData().then((options) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Results Page",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 0, bottom: 5.0),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 5, bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20.0,
                        ),
                        Text(
                          "Car Found",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Image.network(currentCar.photo!)
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 5, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Container(margin: const EdgeInsets.all(5.0)),
                      Text(
                        "Make:",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Model:",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Year:",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Rating:",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Website Link: ",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      left: 120.0, right: 120.0, top: 10.0, bottom: 5.0),
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    10.0,
                    18.0,
                  ),
                  // padding: const EdgeInsets.only(left: 0.0, right: 0.0,top: 0.0,bottom: 17),
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(180)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            FontAwesomeIcons.circleChevronLeft,
                            size: 50.0,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.circleChevronRight,
                            size: 50.0,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'Go Back',
                    style: TextStyle(fontSize: 24),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
