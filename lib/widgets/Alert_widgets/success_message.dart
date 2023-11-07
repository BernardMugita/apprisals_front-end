import 'package:flutter/material.dart';

class SuccessMessage extends StatefulWidget {
  final String message;
  const SuccessMessage({Key? key, required this.message}) : super(key: key);

  @override
  State<SuccessMessage> createState() => _SuccessMessageState();
}

class _SuccessMessageState extends State<SuccessMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String message = widget.message;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation.value,
                color: Colors.green,
                backgroundColor: Colors.white,
              );
            },
          ),
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              message,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
