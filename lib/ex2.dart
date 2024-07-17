// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 10, end: 70).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animation1 = Tween<double>(begin: 10, end: 70).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: 10, end: 70).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: 10, end: 70).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _animation.value,
                  height: _animation.value,
                  color: Colors.deepPurple[200],
                  // child: const Center(child: Text('Box 1')),
                ),
                const SizedBox(width: 10),
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _animation1.value,
                  height: _animation1.value,
                  color: Colors.greenAccent,
                  // child: const Center(child: Text('Box 2')),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _animation2.value,
                  height: _animation2.value,
                  color: Colors.pink[300],
                  // child: const Center(child: Text('Box 3')),
                ),
                const SizedBox(width: 10),
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _animation3.value,
                  height: _animation3.value,
                  color: Colors.teal[400],
                  // child: const Center(child: Text('Box 4')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
