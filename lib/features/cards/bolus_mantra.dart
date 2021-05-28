import 'dart:math';

import 'package:flutter/material.dart';

class BolusMantra extends StatefulWidget {
  @override
  _BolusMantraState createState() => _BolusMantraState();
}

class _BolusMantraState extends State<BolusMantra> {
  @override
  Widget build(BuildContext context) {
    return TableView();
  }
}

class TableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset('assets/images/c3.jpg').image, fit: BoxFit.fill),
      ),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: MediaQuery.of(context).size.width * 0.08,
            child: Transform.rotate(
              angle: -pi / 8,
              child: backCard(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.26,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Transform.rotate(angle: pi / 24, child: frontCard()),
          ),
        ],
      ),
    );
  }
}


Stack frontCard() {
  return Stack(
    children: [
      cardBackground(),
      rippleSection(),
      bottomDesign(),
      titleSection(),
      emailSection()
    ],
  );
}

Stack backCard() {
  return Stack(
    children: [
      cardBackground(),
      Positioned(
          top: 50,
          left: 50,
          child: Column(
            children: [
              Text(
                'Xrole'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white, fontSize: 30, letterSpacing: 12),
              ),
              SizedBox(height: 2),
              Text(
                'www.meet-xrole.com.ng',
                style: TextStyle(color: Colors.green, fontSize: 12),
              )
            ],
          ))
    ],
  );
}

Positioned emailSection() {
  return Positioned(
      top: 120,
      left: 10,
      child: Row(
        children: [
          Container(
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green)),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'xrolediamon@gmail.com',
                style: TextStyle(color: Colors.green, fontSize: 10),
              ),
              SizedBox(height: 2),
              Text('+234 9028 0140 55',
                  style: TextStyle(color: Colors.green, fontSize: 10))
            ],
          )
        ],
      ));
}

Positioned titleSection() {
  return Positioned(
      top: 48,
      left: 150,
      child: Transform.rotate(
        angle: -pi / 160,
        child: Column(
          children: [
            Text(
              'Xrole Diamo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Creative ux designer',
              style: TextStyle(color: Colors.green, fontSize: 10),
            )
          ],
        ),
      ));
}

Positioned bottomDesign() {
  return Positioned(
    top: 100,
    left: 255,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(width: 30, color: Color.fromRGBO(68, 88, 96, 1)),
          borderRadius: BorderRadius.circular(40)),
      child: Text('      '),
    ),
  );
}

Positioned rippleSection() {
  return Positioned(
    top: 35,
    left: 110,
    child: Transform.rotate(
      angle: pi / 12,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(132, 152, 161, 1),
              radius: 15,
            ),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 32,
              backgroundColor: Color.fromRGBO(68, 88, 96, 1),
            ),
            SizedBox(width: 30),
            CircleAvatar(
              backgroundColor: Color.fromRGBO(60, 80, 89, 1),
              radius: 16,
            ),
          ],
        ),
      ),
    ),
  );
}

Container cardBackground() {
  return Container(
    height: 170,
    width: 300,
    decoration: BoxDecoration(
      color: Color.fromRGBO(37, 57, 66, 1),
    ),
  );
}
