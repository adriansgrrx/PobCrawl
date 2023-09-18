import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:pobcrawl/main.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1();
}

class _SplashScreen1 extends State<SplashScreen1> {
  // @override
  // void initState() {
  //   super.initState();
  //   _navigatetohome();
  // }

  // _navigatetohome() async {
  //   await Future.delayed(const Duration(milliseconds: 3000), () {});
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => const MyHomePage(title: "title")));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x060606),
      body: Stack(
        children: [
          Positioned(
            right: 100,
            top: 50,
            child: Stack(children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ui.Color(0xFF00FFE0),
                    border: Border.all(
                      color: Colors
                          .transparent, // Set the border color to transparent
                    ),
                  ),
                  height: 800,
                  width: 800,
                  child: CustomPaint(
                      foregroundPainter: CircleBlurPainter(
                          circleWidth: 300,
                          blurSigma: 40.0,
                          color: ui.Color(0xFF00FFE0))),
                ),
              ),
            ]),
          ),
          Positioned(
            left: 150,
            bottom: 300,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ui.Color(0xFFEA3AA9),
                  border: Border.all(
                    color: Colors
                        .transparent, // Set the border color to transparent
                  ),
                ),
                height: 500,
                width: 500,
                child: CustomPaint(
                    foregroundPainter: CircleBlurPainter(
                        circleWidth: 150,
                        blurSigma: 40.0,
                        color: ui.Color(0xFFEA3AA9))),
              ),
            ]),
          ),

          Positioned(
            left: 70,
            top: 250,
            child: Stack(children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ui.Color(0xFF9747FF),
                    border: Border.all(
                      color: Colors
                          .transparent, // Set the border color to transparent
                    ),
                  ),
                  height: 800,
                  width: 800,
                  child: CustomPaint(
                      foregroundPainter: CircleBlurPainter(
                          circleWidth: 300,
                          blurSigma: 40.0,
                          color: ui.Color(0xFF9747FF))),
                ),
              ),
            ]),
          ),
          // Positioned(
          //   left: 200,
          //   top: 450,
          //   child: Container(
          //     width: 288,
          //     height: 288,
          //     decoration: const ShapeDecoration(
          //       color: Color(0xFF9747FF),
          //       shape: OvalBorder(),
          //     ),
          //   ),
          // ),
          Center(
            child: Positioned(
              child: Opacity(
                opacity: 0.2,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: ui.Color.fromARGB(255, 0, 0, 0),
                      border: Border.all(
                        color: Colors
                            .transparent, // Set the border color to transparent
                      ),
                    ),
                    height: 228,
                    width: 266,
                    child: CustomPaint(
                        foregroundPainter: RectangleBlurPainter(
                            rectangleWidth: 20,
                            blurSigma: 5.0,
                            color: ui.Color.fromARGB(255, 0, 0, 0))),
                  ),
                ]),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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

class RectangleBlurPainter extends CustomPainter {
  RectangleBlurPainter({
    required this.rectangleWidth,
    required this.blurSigma,
    required this.color,
  });

  double rectangleWidth;
  double blurSigma;
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = rectangleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;

    // Define the rectangle's coordinates based on its center and half-width/height
    Rect rect = Rect.fromCenter(
      center: Offset(halfWidth, halfHeight),
      width: halfWidth * 2, // Width
      height: halfHeight * 2, // Height
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
