import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gas Price Calculator",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 40.0,bottom: 10.0),
              padding: const EdgeInsets.only(left: 5.0, right: 5.0,top: 0,bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0,top: 0,bottom: 5.0),
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5,bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20.0,
                        ),
                        Text(
                          "Car Found",
                          style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      FontAwesomeIcons.car,
                      color: Colors.white,
                      size: 250.0,
                    ),
                  ),
                ],),
            ),


            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                   padding: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5,bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(

                    children: [

                      Container(
                        margin: const EdgeInsets.all(5.0)
                      ),
                      Text(
                        "Make:",
                        style:
                        TextStyle(fontSize: 20.0, color: Colors.white),

                      ),

                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Model:",
                        style:
                        TextStyle(fontSize: 20.0 ,color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Year:",
                        style:
                        TextStyle(fontSize: 20.0,color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Rating:",
                        style:
                        TextStyle(fontSize: 20.0,color: Colors.white),
                      ),
                      Container(
                        margin  : const EdgeInsets.all(5.0),
                      ),
                      Text(
                        "Website Link:",
                        style:
                        TextStyle(fontSize: 20.0,color: Colors.white),
                      ),
                    ],
                  ),
                ),


              ],),


            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                     IconButton(
                        onPressed: () {


                        },
                        icon: Icon(FontAwesomeIcons.circleChevronLeft,
                             size: 50.0,)

                    ),

                    IconButton(
                        onPressed: () {

                        },
                        icon: Icon(FontAwesomeIcons.circleChevronRight,size: 50.0,)),

                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0,top: 10.0,bottom: 10.0),
                decoration: BoxDecoration(
                  color:  Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child:
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'Go Back',
                    style: TextStyle(fontSize: 24),

                  ),

                )
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