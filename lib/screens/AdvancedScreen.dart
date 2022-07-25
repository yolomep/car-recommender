import 'dart:html';

import 'package:car_recommender/recommender/Car.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'ResultsScreen.dart';

class AdvancedScreen extends StatefulWidget {
  Car data;
  AdvancedScreen(this.data, {Key? key}) : super(key: key);

  static const String routeName = "/AdvancedScreen";

  @override
  State<AdvancedScreen> createState() => _AdvancedScreenState();
}

class _AdvancedScreenState extends State<AdvancedScreen> {
  List<String> _makeOptions = [], _modelOptions = [], _yearOptions = [];
  String _modelDropdownValue = "";
  String _makeDropdownValue = "";
  Map<String, List<String>> _allModelOptions = {};
  RangeValues _currentPriceRange = RangeValues(0, 100);

  Future<List<String>> readData() async {
    try {
      final fileNames = ['make.csv', 'model.csv', 'year.csv'];

      List<String> options = [];
      for(String name in fileNames) {
        options.add(await rootBundle.loadString('data/$name'));
      }

      return options;
    } catch (e) {
      showDialog(
          context: context,
          builder: (context)
          {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.

                title: Text("Error!"),
                content: Text("The data files have been deleted or cannot be accessed. Please try reinstalling the app again."),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      exit(0);
                    },
                  )
                ]);
          });
      return [];
    }
  }

  @override
  void initState() {
    super.initState();

    readData().then((options) {
      setState(() {
        _makeOptions = (const CsvToListConverter().convert(options[0])).map((make) => make[1].toString()).toList();
        //CsvToListConvert sucks
        List<String> lines = options[1].split("\n");

        for(String line in lines) {
          List<String> row = line.split(",");
          if(_allModelOptions.containsKey(row[1])) {
            _allModelOptions[row[1]]!.add(row[2]);
          }
          else {
            _allModelOptions.putIfAbsent(row[1], () => ["no preference", row[2]]);
          }

        }

        //model options is special

        _yearOptions = (const CsvToListConverter().convert(options[2])).map((year) => year[1].toString()).toList();
        // _makeOptions.insert(0, "no preference");
        // _modelOptions.insert(0, "no preference");
        // _yearOptions.insert(0, "no preference");
        _makeDropdownValue = widget.data.make!;
        _modelOptions = _allModelOptions[_makeDropdownValue]!;
        _modelDropdownValue = _modelOptions.first;
        if(widget.data.model != "no preference") _modelDropdownValue = widget.data.model!;
        _currentPriceRange = widget.data.priceRange;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Car Recommender",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text('Car Finder'),
          actions: const [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  0.0,
                  30.0,
                  0.0,
                ),
                child: Icon(FontAwesomeIcons.car)
            )
          ],

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              //, topLeft: Radius.circular(40), topRight: Radius.circular(40)) ,
              color: Colors.black,
            ),
          ),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2AD07D),
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "make",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        FontAwesomeIcons.building,
                        size: 30.0,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                    ),
                    child: DropdownButton<String>(
                      value: _makeDropdownValue,
                      dropdownColor: Color(0xFFDBF24B),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _makeDropdownValue = newValue!;
                          _modelOptions = _allModelOptions[_makeDropdownValue]!;
                          _modelDropdownValue = _modelOptions.first;
                        });
                      },
                      items: _makeOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFF2AD07D),
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Model",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        FontAwesomeIcons.commentDollar,
                        size: 30.0,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                    ),
                    child: DropdownButton<String>(
                      value: _modelDropdownValue,
                      dropdownColor: Color(0xFFDBF24B),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelDropdownValue = newValue!;
                        });
                      },
                      items: _modelOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFF2AD07D),
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Price Range",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        FontAwesomeIcons.carSide,
                        size: 30.0,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF2AD07D),
                    ),
                    child: RangeSlider(
                      values: _currentPriceRange,
                      max: 100000,
                      min: 10000,
                      divisions: 9000,
                      labels: RangeLabels(
                        _currentPriceRange.start.round().toString(),
                        _currentPriceRange.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentPriceRange = values;
                        });
                      },
                    ),
                  ),
                ],),
            ),

            Container(
                margin: const EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2AD02A),
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child:
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultsScreen(Car.fromData(
                            make: _makeDropdownValue,
                            model: _modelDropdownValue,
                            priceRange: _currentPriceRange));
                      }),
                    );
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'submit',
                    style: TextStyle(fontSize: 24),
                  ),
                )
            )
          ],
        ),


      ),
    );
  }
}
