import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.value,
    required this.animation,
    super.key,
  });

  final int value;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: SizedBox(
        height: 128.0,
        child: Card(
          color: Colors.primaries[value % Colors.primaries.length],
          child: Center(
            child: Text(
              'Item $value',
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
