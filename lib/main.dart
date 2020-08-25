import 'dart:io';
import 'package:akcalculator/about_us.dart';
import 'package:akcalculator/contact_us_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AK Calculator',
      theme: ThemeData(primaryColor: Colors.black),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Future<bool> _closeApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('AK Calculator'),
          content: Text(
            'Are you sure you want to close AK Calculator.',
            style: GoogleFonts.exo(color: Colors.black),
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Text(
                "Stay",
                style: GoogleFonts.exo(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoButton(
              child: Text(
                "Exit",
                style: GoogleFonts.exo(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                exit(0);
              },
            ),
          ],
        );
      },
    );
  }

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _closeApp,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {
                  Share.share(
                      'Download this app and support us :- https://play.google.com/store/apps/details?id=com.akprogrammer.akcalculator');
                },
              ),
            ],
            title: Text(
              'AK Calculator',
              style: GoogleFonts.exo(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
        drawer: Drawer(
            child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: GestureDetector(
              child: Container(
                height: 50,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Creator:- AK PROGRAMMER',
                    style: GoogleFonts.exo(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                UrlLauncher.launch("tel://+917990463877");
              },
            ),
          ),
          body: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset("images/calculator.png"),
                accountName: Text(
                  'AK CALCULATOR',
                  style: GoogleFonts.exo(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.black,
                ),
                title: Text('Contact Us',
                    style: GoogleFonts.exo(color: Colors.black)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text('About AK Calculator',
                    style: GoogleFonts.exo(color: Colors.black)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_power,
                  color: Colors.black,
                ),
                title:
                    Text('Quit', style: GoogleFonts.exo(color: Colors.black)),
                onTap: () {
                  _closeApp();
                },
              ),
            ],
          ),
        )),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: equationFontSize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("C", 1, Colors.red),
                        buildButton("⌫", 1, Colors.blue[800]),
                        buildButton("÷", 1, Colors.blue[800]),
                      ]),
                      TableRow(children: [
                        buildButton("7", 1, Colors.black),
                        buildButton("8", 1, Colors.black),
                        buildButton("9", 1, Colors.black),
                      ]),
                      TableRow(children: [
                        buildButton("4", 1, Colors.black),
                        buildButton("5", 1, Colors.black),
                        buildButton("6", 1, Colors.black),
                      ]),
                      TableRow(children: [
                        buildButton("1", 1, Colors.black),
                        buildButton("2", 1, Colors.black),
                        buildButton("3", 1, Colors.black),
                      ]),
                      TableRow(children: [
                        buildButton(".", 1, Colors.black),
                        buildButton("0", 1, Colors.black),
                        buildButton("00", 1, Colors.black),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton("×", 1, Colors.blue[800]),
                      ]),
                      TableRow(children: [
                        buildButton("-", 1, Colors.blue[800]),
                      ]),
                      TableRow(children: [
                        buildButton("+", 1, Colors.blue[800]),
                      ]),
                      TableRow(children: [
                        buildButton("=", 2, Colors.red),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
