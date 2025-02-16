import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key, required this.curr});
  final String curr;
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/second.jpg',
              height: MediaQuery.of(context).size.height / (1.7),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.9,
              ),

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 46, 45, 45),
                    const Color.fromARGB(255, 33, 59, 52),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TypeWriter.text(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfair(
                      fontSize: 23,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                    'Stay informed with NewsSphere',
                    duration: Duration(seconds: 2),
                  ),
                  // Text(
                  //   textAlign: TextAlign.center,
                  //   ,
                  //   style:
                  // ),
                  SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'images/newspp.png',
                      width: 120,
                      height: 120,
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
