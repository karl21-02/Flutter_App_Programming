import 'package:flutter/material.dart';
import 'package:animation_exmaple/saturnLoading.dart';
import 'dart:async';
import 'main.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IntroPage();
  }
}

class _IntroPage extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AnimationApp()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('애니메이션 앱'),
              SizedBox(
                height: 20,
              ),
              Saturnloading()
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}