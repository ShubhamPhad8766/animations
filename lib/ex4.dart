import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
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
      body: Column(
        children: [
          // Center(
          //   child: Container(
          //     width: _animation.value,
          //     height: 50.0,
          //     color: Colors.blue,
          //     child: const Center(child: Text("Shubham")),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Center(
          //   child: Container(
          //     width: _animation.value,
          //     height: 50.0,
          //     color: Colors.red,
          //     child: const Center(child: Text("Phad")),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Container(
                      width: _animation.value,
                      height: 50.0,
                      color: Colors.red,
                      child: const Center(child: Text("Phad")),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Container(
                      width: _animation.value,
                      height: 50.0,
                      color: Colors.red,
                      child: const Center(child: Text("Phad")),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
