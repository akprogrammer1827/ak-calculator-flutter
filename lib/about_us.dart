import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.5,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('About Us',style: GoogleFonts.exo(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('images/calculator.png',height: 200,width: 200,),
            SizedBox(height: 20,),
            Center(
              child: Text('AK Calculator', style: GoogleFonts.exo(color: Colors.black,
                  fontSize: 24
              ),),
            ),
            SizedBox(height: 20,),
            Expanded(
              child:  Text('AK Calculator is the essential tool for your smartphone, simple and easy to use with a sleek design - the perfect calculator for Android.\nAK Calculator provides simple mathematical functions in a beautifully designed app.Perform basic calculations such as:\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\nIf you find a bug or have suggestions for improvement, please contact us.\nThis version of Calculator is ad-free.\nThankYou for using our App,',
                textAlign: TextAlign.justify,
                style:GoogleFonts.exo(
                  color: Colors.black,) ,),
            )
          ],
        ),
      ),
    );
  }
}
