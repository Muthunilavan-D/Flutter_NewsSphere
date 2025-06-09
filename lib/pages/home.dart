import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 250, 250, 250),
      body: Container(
        margin: EdgeInsets.only(top: 25, left: 15),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       const Color.fromARGB(221, 43, 43, 43),
        //       const Color.fromARGB(255, 86, 86, 86),
        //     ],
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Newz',
                  style: GoogleFonts.timmana(
                    color: const Color.fromARGB(255, 109, 104, 104),
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Sphere',
                  style: GoogleFonts.timmana(
                    color: const Color.fromARGB(255, 42, 205, 255),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              'HOT NEWS',
              style: GoogleFonts.robotoCondensed(
                color: const Color.fromARGB(255, 63, 166, 198),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'images/sample.jpg',
                                  width:
                                      MediaQuery.of(context).size.width / 1.85,
                                  fit: BoxFit.cover,
                                  height: 120,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.85,
                              child: Text(
                                textAlign: TextAlign.center,
                                'This is my first News App! Do you know?',
                                style: GoogleFonts.openSans(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.85,
                              child: Text(
                                'This will be the subtext of the news',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 74,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 120),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 26,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'images/sample.jpg',
                                  width:
                                      MediaQuery.of(context).size.width / 1.85,
                                  fit: BoxFit.cover,
                                  height: 120,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.85,
                              child: Text(
                                textAlign: TextAlign.center,
                                'This is my first News App! Do you know?',
                                style: GoogleFonts.openSans(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.85,
                              child: Text(
                                'This will be the subtext of the news',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 74,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 120),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 26,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
