import 'package:flutter/material.dart';

import 'count_up.dart';

class TasksSummary extends StatelessWidget {
  const TasksSummary({
    super.key,
    required this.taskCount,
    required this.meetingCount,
    required this.habitCount,
  });

  final double taskCount;
  final double meetingCount;
  final double habitCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Good morning,",
                style: TextStyle(color: Colors.white60, fontSize: 24),
              ),
              SizedBox(width: 12),
              Image.asset('assets/img/ethiel.png', width: 28),
              SizedBox(width: 8),
              Text(
                "Ethiel.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              text: "You have ",
              style: TextStyle(
                color: Colors.white60,
                height: 36 / 20,
                fontSize: 24,
              ),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: CountUpText(
                    emoji: "📅",
                    value: meetingCount,
                    label: "meetings",
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: CountUpText(
                    emoji: "✅",
                    value: taskCount,
                    label: "tasks ",
                  ),
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(color: Colors.white60, fontSize: 24),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: CountUpText(
                    emoji: "🥋",
                    value: habitCount,
                    label: "habits ",
                  ),
                ),
                TextSpan(
                  text: "today. You're ",
                  style: TextStyle(color: Colors.white60, fontSize: 24),
                ),
                TextSpan(
                  text: "mostly free ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "after 4PM.",
                  style: TextStyle(color: Colors.white60, fontSize: 24),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
