import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/home.dart';
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Animated background circles
            Positioned(
              top: -60,
              left: -60,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.18),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: -40,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withOpacity(0.13),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.1,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(220, 20, 24, 38),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    TypeWriter.text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                      'Stay informed with',
                      duration: const Duration(seconds: 1),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'NewzSphere',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'WORLDWIDE NEWS',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 200,
                        height: 52,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF36D1C4), Color(0xFF5B86E5)],
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.18),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Start Exploring',
                            style: GoogleFonts.montserrat(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
