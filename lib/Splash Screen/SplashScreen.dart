import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:pobcrawl/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "title")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x060606),
      body: Stack(
        children: [
          Positioned(
            left: 150,
            bottom: 400,
            child: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ui.Color.fromARGB(191, 234, 58, 170),
                  border: Border.all(
                    color: Colors
                        .transparent, // Set the border color to transparent
                  ),
                ),
                height: 400,
                width: 400,
                child: CustomPaint(
                    foregroundPainter: CircleBlurPainter(
                        circleWidth: 150,
                        blurSigma: 40.0,
                        color: ui.Color.fromARGB(191, 234, 58, 170))),
              ),              
            ]),
          ),
          Positioned(
            right: 150,
            bottom: 100,
            child: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ui.Color(0xFF00FFE0),
                  border: Border.all(
                    color: Colors
                        .transparent, // Set the border color to transparent
                  ),
                ),
                height: 400,
                width: 400,
                child: CustomPaint(
                    foregroundPainter: CircleBlurPainter(
                        circleWidth: 150,
                        blurSigma: 40.0,
                        color: ui.Color(0xFF00FFE0))),
              ),              
            ]),
          ),
          // Positioned(
          //   right: 200,
          //   bottom: 200,
          //   child: Container(
          //     width: 288,
          //     height: 288,
          //     decoration: const ShapeDecoration(
          //       color: Color(0xFF00FFE0),
          //       shape: OvalBorder(),
          //     ),
          //   ),
          // ),
          Positioned(
            left: 200,
            top: 450,
            child: Container(
              width: 288,
              height: 288,
              decoration: const ShapeDecoration(
                color: Color(0xFF9747FF),
                shape: OvalBorder(),
              ),
            ),
          ),
          Center(
            child: Positioned(
              child: Opacity(
                opacity: 0.50,
                child: Container(
                  width: 266,
                  height: 228,
                  decoration: BoxDecoration(color: Color(0xFF060606)),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                        sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                            0.0), // Adjust the background color and opacity
                      ),
                    ),
                  ),
                ),
                Image.asset('assets/images/splash_ic.png'),
                const SizedBox(height: 5.0),
                Image.asset('assets/images/pob.png'),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/crawl.png'),
                    const SizedBox(width: 5.0),
                    Image.asset('assets/images/app.png'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter(
      {required this.circleWidth,
      required this.blurSigma,
      required this.color});

  double circleWidth;
  double blurSigma;
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
