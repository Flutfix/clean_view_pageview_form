import 'package:flutter/material.dart';

class DefaultContainer extends StatefulWidget {
  final Widget? child;
  final double? borderRadius;
  const DefaultContainer({Key? key, this.child, this.borderRadius})
      : super(key: key);

  @override
  _DefaultContainerState createState() => _DefaultContainerState();
}

class _DefaultContainerState extends State<DefaultContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 34),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 15,
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
