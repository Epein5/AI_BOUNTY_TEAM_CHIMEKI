import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);

    return Center(
      child: PlayAnimationBuilder<double>(
        tween: Tween(begin: 200.0, end: 350.0),
        duration: const Duration(milliseconds: 500),
        // delay: const Duration(seconds: 0),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Center(
            child: Container(
              width: value,
              height: 50.0,
              // color: Color.fromARGB(255, 231, 230, 229),
              child: Opacity(
                opacity: 1, // Adjust based on the desired opacity range
                child: child,
              ),
            ),
          );
        },
        child: child,
      ),
    );
  }
}
