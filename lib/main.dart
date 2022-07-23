import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  double pricePerGallon = 0.0;
  double gallonsPumped = 0.0;
  double priceToPay = 0.0;
  String dropdownValue = "";
  LinkedHashMap<String, double> gasPricesMap = LinkedHashMap<String, double>();
  @override
  void initState() {
    gasPricesMap.putIfAbsent("Regular 87", () => 4.44);
    gasPricesMap.putIfAbsent("Premium 93", () => 4.70);
    gasPricesMap.putIfAbsent("Super 95", () => 5.20);
    gasPricesMap.putIfAbsent("Supreme 97", () => 5.90);
    gasPricesMap.putIfAbsent("Ethanol E85", () => 4.10);
    dropdownValue = gasPricesMap.isEmpty ? "" : gasPricesMap.keys.first;
    pricePerGallon = gasPricesMap.isEmpty
        ? 0.0
        : gasPricesMap[gasPricesMap.keys.first] ?? 0.0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gas Price Calculator",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: Text('Car Finder'),
          actions: [
            Padding(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.car),
                  onPressed: (){
                    print('add button pressed');
                  },
                ),
                padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  0.0,
                  30.0,
                  0.0,
                )
            )
          ],

          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40), topLeft: Radius.circular(40), topRight: Radius.circular(40)) ,
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
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              padding: const EdgeInsets.all(18.0),
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
                    children: [

                      Text(
                        "Make",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                          FontAwesomeIcons.building,
                        size: 50.0,
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
                      value: dropdownValue,
                      dropdownColor:Color(0xFFDBF24B) ,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          pricePerGallon = gasPricesMap[dropdownValue] ?? 0.0;
                        });
                      },
                      items: gasPricesMap.keys
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

            DisplayText("Todays price of ${dropdownValue} gasoline"),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 50.0, right: 50.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),

              child: Text(
                "advanced",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 50.0, right: 50.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFF2AD02A),
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),

              child: Text(
                "submit",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
//Class : Display text.
class DisplayText extends StatelessWidget {
  String _textToDisplay; //Attribute: The text value to display
  double fontSize; // Font size is a public attribute
  DisplayText(this._textToDisplay, {this.fontSize = 20.0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        _textToDisplay,
        style: TextStyle(
          fontSize: this.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}