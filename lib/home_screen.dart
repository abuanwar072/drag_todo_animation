import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/drag_handle.dart';
import 'widgets/health_summary.dart';
import 'widgets/task_summary.dart';
import 'widgets/task_tile.dart';
import 'widgets/top_heaser.dart';

const minimumDragSize = 0.43;
const maximumDragSize = 1.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  double draggableSheetSize = minimumDragSize;

  bool isExpanded = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );

    _draggableScrollableController.addListener(() {
      draggableSheetSize = _draggableScrollableController.size;
      if (_draggableScrollableController.size >= .8) {
        setState(() {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          );
          isExpanded = true;
        });
      } else if (_draggableScrollableController.size < .85) {
        setState(() {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          );

          isExpanded = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: draggableSheetSize > .65 ? 10.0 : 0.0,
          ),
          duration: Duration(milliseconds: 350),
          curve: Curves.linearToEaseOut,
          builder: (context, sigma, child) => ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: child,
          ),
          child: Column(
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
        ),
        DraggableScrollableSheet(
          snap: true,
          controller: _draggableScrollableController,
          initialChildSize: minimumDragSize,
          minChildSize: minimumDragSize,
          maxChildSize: maximumDragSize,
          builder: (context, scrollController) => Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: tasks.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return DragHandle(isVisible: !isExpanded);
                    }
                    return tasks[index - 1];
                  },
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut,
                right: MediaQuery.of(context).size.width / 3,
                bottom: isExpanded ? 24 : -200,
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
        TopHeader(isExpanded: isExpanded),
      ],
    ),
  );
}
