import 'package:bmi_app/constants/app_constants.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Text("hello"),
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.amber[50]!.withOpacity(.1),
                  width: 400,
                  //height: 150,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Height in meter",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        //fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(1.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.amber[50]!.withOpacity(.1),
                  width: 400,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Weight in Kg",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        //fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                maximumSize: Size(500.0, 200.0),
                backgroundColor: accentHexColor,
              ),
              onPressed: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  bmiResult = _w / (_h * _h);
                  if (bmiResult > 25) {
                    _textResult = "You\'re over weight";
                  } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                    _textResult = "You have a normal weight";
                  } else {
                    _textResult = "You\'re under weight";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  color: mainHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  // fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 40,
            ),
          ],
        ),
      ),
    );
  }
}
