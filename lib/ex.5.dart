
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _isAnimated = false;

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beautiful Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _isAnimated ? 200.0 : 100.0,
            height: _isAnimated ? 200.0 : 100.0,
            decoration: BoxDecoration(
              color: _isAnimated ? Colors.blue : Colors.red,
              borderRadius: _isAnimated
                  ? BorderRadius.circular(20.0)
                  : BorderRadius.circular(0.0),
              boxShadow: _isAnimated
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: Text(
                _isAnimated ? 'Animated' : 'Not Animated',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
