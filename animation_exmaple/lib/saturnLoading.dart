import 'package:flutter/material.dart';
import 'dart:math';

class Saturnloading extends StatefulWidget {
  _SaturnLoading _saturnLoading = _SaturnLoading();

  @override
  State<StatefulWidget> createState() => _saturnLoading;

  void start() {
    _saturnLoading.start();
  }

  void stop() {
    _saturnLoading.stop();
  }
}

class _SaturnLoading extends State<Saturnloading> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Image.asset(
                'repo/images/circle.png',
                width: 100,
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'repo/images/sunny.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Transform.rotate(
                  angle: _animation!.value,
                  origin: Offset(35, 35),
                  child: Image.asset(
                    'repo/images/saturn.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void start() {
    _animationController!.repeat();
  }

  void stop() {
    _animationController!.stop(canceled: true);
  }
}