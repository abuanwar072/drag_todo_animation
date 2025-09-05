import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  curve: Curves.linearToEaseOut,
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    color: isExpanded ? Colors.black : Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                  child: const Text("09"),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                ),
                Spacer(),
                AnimatedDefaultTextStyle(
                  curve: Curves.linearToEaseOut,
                  style: TextStyle(
                    color: isExpanded ? Colors.black45 : Colors.white70,
                    fontSize: 20,
                  ),
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  child: Text.rich(
                    textAlign: TextAlign.end,
                    TextSpan(
                      text: "Sep' 30\n",
                      children: [
                        TextSpan(
                          text: "Tuesday",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
