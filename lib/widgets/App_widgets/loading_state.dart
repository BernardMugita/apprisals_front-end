import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingState extends StatefulWidget {
  final String fetchText;
  const LoadingState({Key? key, required this.fetchText}) : super(key: key);

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState>
    with TickerProviderStateMixin {
  bool isLoading = true;
  bool isDataLoaded = false;

  final ColorTween colorTween = ColorTween(
      begin: const Color.fromARGB(255, 255, 196, 108),
      end: const Color.fromARGB(255, 0, 255, 8));
  late final AnimationController progressController;

  @override
  void initState() {
    super.initState();

    progressController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Start the animation when the widget is first built
    progressController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller to avoid memory leaks
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fetchText = widget.fetchText;
    return AnimatedBuilder(
      animation: colorTween.animate(progressController),
      builder: (context, child) {
        return Column(
          children: [
            Container(
              height: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colorTween.evaluate(progressController),
              ),
              child: LinearProgressIndicator(
                backgroundColor: const Color(0xFFFEF1ED),
                value: progressController.value,
                valueColor: colorTween.animate(progressController),
              ),
            ),
            const Gap(80),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                // boxShadow: [
                //   BoxShadow(
                //     color: const Color.fromARGB(255, 201, 201, 201)
                //         .withOpacity(0.5), // Shadow color
                //     spreadRadius: 2, // Spread radius
                //     blurRadius: 20, // Blur radius
                //     offset:
                //         const Offset(0, 3), // Offset from the top-left corner
                //   ),
                // ],
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0)
                          .animate(progressController),
                      child: Icon(
                        Icons.hourglass_bottom_rounded,
                        color: colorTween.evaluate(progressController),
                        size: 35,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      fetchText,
                      style: TextStyle(
                          color: colorTween.evaluate(progressController),
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
