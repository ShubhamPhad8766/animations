// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = 100.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Circular Animation Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double animationValue = _controller.value;
            double connectProgress = (animationValue - 5).clamp(0.0, 1.0);
            return Stack(
              alignment: Alignment.center,
              children: [
                _buildMovingBox(animationValue, 0, radius,
                    Colors.deepPurple[200]!, connectProgress),
                _buildMovingBox(animationValue, 1, radius, Colors.greenAccent,
                    connectProgress),
                _buildMovingBox(animationValue, 2, radius, Colors.pink[300]!,
                    connectProgress),
                _buildMovingBox(animationValue, 3, radius, Colors.teal[400]!,
                    connectProgress),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovingBox(double animationValue, int boxIndex, double radius,
      Color color, double connectProgress) {
    double angle = animationValue * 2 * pi + (pi / 2) * boxIndex;
    double x = radius * cos(angle);
    double y = radius * sin(angle);

    if (connectProgress > 0) {
      double targetX = 0;
      double targetY = 0;
      switch (boxIndex) {
        case 0:
          targetX = -50;
          targetY = -50;
          break;
        case 1:
          targetX = 50;
          targetY = -50;
          break;
        case 2:
          targetX = -50;
          targetY = 50;
          break;
        case 3:
          targetX = 50;
          targetY = 50;
          break;
      }

      x = lerpDouble(x, targetX, connectProgress)!;
      y = lerpDouble(y, targetY, connectProgress)!;
    }

    return Transform.translate(
      offset: Offset(x, y),
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }
}
