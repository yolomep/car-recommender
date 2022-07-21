import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'car-recommender',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> makeOptions = [], modelOptions = [], yearOptions = [], transmissionOptions = [];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<List<File>> get _getData async {
    final path = await _localPath;
    return [File('$path/make.csv'), File('$path/model.csv'), File('$path/year.csv')];
  }

  Future<List<List<String>>> readData() async {
    try {
      final files = await _getData;

      List<List<String>> options = [];
      for(File f in files) {
        options.add(await f.readAsLines());
      }

      return options;
    } catch (e) {
      print("No data found");
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
    readData().then((options) => {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Custom App Bar"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40), topLeft: Radius.circular(40), topRight: Radius.circular(40)) ,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}