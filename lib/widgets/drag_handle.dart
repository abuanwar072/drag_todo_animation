import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({
    super.key,
  
    required this.isVisible,
  });

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.linearToEaseOut,
        duration: Duration(milliseconds: 400),
        margin: EdgeInsets.symmetric(
          vertical: isVisible ? 6 : 50,
        ),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: isVisible ? Colors.grey.shade400 : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
