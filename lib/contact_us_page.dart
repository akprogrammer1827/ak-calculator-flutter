import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactUsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.5,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Contact Us',style: GoogleFonts.exo(color: Colors.white)),
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          child: Container(
            height: 50,
            color: Colors.black,
            child: Center(
              child: Text('CALL NOW', style:  GoogleFonts.exo(color: Colors.white),),
            ),
          ),
          onTap: () {
            UrlLauncher.launch("tel://+917990463877");
          },
        ),
      ),
      body: Container(padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.asset('images/calculator.png',height: 200,width: 200,),
            SizedBox(height: 20,),
            Center(
              child: Text('AK Calculator', style: GoogleFonts.exo(color: Colors.black,
                fontSize: 24
                ),),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Image.asset('images/instagram.png',height: 20,width: 20,),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    child: Text('AK Programmer', style: GoogleFonts.exo(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),),
                    onTap: () {
                      UrlLauncher.launch("https://www.instagram.com/ak_programmer");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(Icons.access_time,color: Colors.black,),
                SizedBox(width: 10,),
                Expanded(
                  child: Text('Available 24/7',style: GoogleFonts.exo(color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Image.asset('images/whatsapp.png',height: 20,width: 20,),
                SizedBox(width: 10,),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        UrlLauncher.launch("https://wa.me/919979369683");

                      },
                      child: Text('+91 9979369683',style: GoogleFonts.exo(color: Colors.black,
                          fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(Icons.email,color: Colors.black,),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    child: Text('akprogrammer.1827@gmail,com', style: GoogleFonts.exo(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),),
                    onTap: () {
                      UrlLauncher.launch("mailto:akprogrammer.1827@gmail,com");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
