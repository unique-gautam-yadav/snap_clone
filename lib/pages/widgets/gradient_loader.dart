import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientLoader extends StatefulWidget {
  const GradientLoader({super.key});

  @override
  State<GradientLoader> createState() => _GradientLoaderState();
}

class _GradientLoaderState extends State<GradientLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animation = Tween<double>(begin: -3, end: 3).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0, animation.value, 1],
          colors: const [
            Colors.amber,
            Colors.white,
            Colors.amber,
          ],
        ),
      ),
    );
  }
}
