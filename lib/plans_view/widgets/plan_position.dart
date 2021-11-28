import 'package:flutter/material.dart';

class PlanPosition extends StatefulWidget {
  final double width;
  final double height;

  final int currentIndex;
  final Color colorStart;
  final Color colorEnd;

  const PlanPosition({
    Key? key,
    required this.width,
    required this.height,
    required this.currentIndex,
    required this.colorStart,
    required this.colorEnd,
  }) : super(key: key);

  @override
  _PlanPositionState createState() => _PlanPositionState();
}

class _PlanPositionState extends State<PlanPosition> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD8D8D8),
              ),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD8D8D8),
              ),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD8D8D8),
              ),
            )
          ],
        ),
      ),
      AnimatedAlign(
        duration: const Duration(milliseconds: 150),
        alignment: widget.currentIndex == 0
            ? Alignment.centerLeft
            : widget.currentIndex == 1
                ? Alignment.center
                : Alignment.centerRight,
        child: Container(
          width: widget.width,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffD8D8D8),
              gradient: LinearGradient(colors: [
                widget.colorStart,
                widget.colorEnd,
              ])),
        ),
      ),
    ]);
  }
}
