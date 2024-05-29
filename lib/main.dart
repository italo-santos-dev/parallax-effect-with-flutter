import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParallaxScreen(),
    );
  }
}

class ParallaxScreen extends StatefulWidget {
  @override
  _ParallaxScreenState createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {
  double _scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
           child: Image.network(
             'https://imgnike-a.akamaihd.net/branding/cdp-bnt/assets/img/p1-desk.png',
             fit: BoxFit.cover,
             alignment: Alignment(0, -_scrollPosition / 500),
           ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              setState(() {
                _scrollPosition = scrollInfo.metrics.pixels;
              });
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 500,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: const Column(
                      children: [
                        Text(
                          'Parallax Effect',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'This is an example of a parallax effect in Flutter.'
                              'Scroll down to see the effect',
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    height: 710,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}