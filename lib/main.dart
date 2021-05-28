import 'dart:math';

import 'package:flutter/material.dart';

import 'features/cards/bolus_mantra.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation flipAnimation;

  bool isTableView = false;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    flipAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.0, 0.5, curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          icon: Icon(Icons.table_chart, color: Colors.white,),
          onPressed: () {
            setState(() {
              isTableView = !isTableView;
            });
          },
        ),
      ),
      body: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return isTableView 
            ? TableView()
            :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * flipAnimation.value),
                  child: Container(
                      child: isFront
                          ? frontCard()
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: backCard())),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {
                            if (!isFront) {
                              _controller.reverse();
                              setState(() {
                                isFront = true;
                              });
                            }
                          },
                          child: Text(
                            'Front',
                            style: TextStyle(
                                color:
                                    isFront ? Colors.blue[900] : Colors.black),
                          )),
                      FlatButton(
                          onPressed: () {
                            if (isFront) {
                              _controller.forward();
                              setState(() {
                                isFront = false;
                              });
                            }
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color:
                                    isFront ? Colors.black : Colors.blue[900]),
                          )),
                    ],
                  ),
                )
              ],
            );
          },
          child: Center(child: frontCard())),
    );
  }
}
