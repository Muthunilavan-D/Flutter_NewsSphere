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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'images/sample.jpg',
                          width: MediaQuery.of(context).size.width / 1.8,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          'This is my first News App! Do you know?',
                          style: GoogleFonts.openSans(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          'This will be the subtext of the news',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
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
