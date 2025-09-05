import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/drag_handle.dart';
import 'widgets/health_summary.dart';
import 'widgets/task_summary.dart';
import 'widgets/task_tile.dart';
import 'widgets/top_heaser.dart';

const minimumDragSize = 0.43;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TasksSummary(taskCount: 3, meetingCount: 2, habitCount: 1),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: const HealthSummary(),
            ),
          ],
        ),
        DraggableScrollableSheet(
          // snap: true,
          // controller: _draggableScrollableController,
          // initialChildSize: minimumDragSize,
          // minChildSize: minimumDragSize,
          // maxChildSize: maximumDragSize,
          builder: (context, scrollController) => Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView.builder(
                  // physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: tasks.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return DragHandle();
                    }
                    return tasks[index - 1];
                  },
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width / 3,
                bottom: 24,
                left: MediaQuery.of(context).size.width / 3,
                child: FloatingActionButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: Color(0xffe9e9e9),
                  elevation: 0,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        TopHeader(),
      ],
    ),
  );
}
