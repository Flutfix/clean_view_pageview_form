import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerWithStar extends StatefulWidget {
  final bool isActive;
  const ContainerWithStar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  State<ContainerWithStar> createState() => _ContainerWithStarState();
}

class _ContainerWithStarState extends State<ContainerWithStar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: LinearGradient(
          colors: widget.isActive
              ? [
                  const Color(0xFFF59CEC),
                  const Color(0xFF3DBDFF),
                ]
              : [
                  const Color(0xFFD9D9D9),
                  const Color(0xFFD9D9D9),
                ],
        ),
      ),
      child: SvgPicture.asset(
        'lib/assets/images/star.svg',
        color: Colors.white,
        width: 15,
        height: 15,
      ),
    );
  }
}
