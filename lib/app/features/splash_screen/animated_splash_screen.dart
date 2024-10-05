import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  final Widget child;

  const AnimatedSplashScreen({super.key, required this.child});

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: RotationTransition(
                  turns: _animation,
                  child: Image.asset(
                    'assets/icon/logo_zulawy.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}