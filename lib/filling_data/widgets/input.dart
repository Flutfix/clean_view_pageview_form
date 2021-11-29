import 'package:flutter/material.dart';
import 'package:flutter_application_1/filling_data/widgets/container_with_star.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String? hintText;
  final double? width;
  final TextInputType? keyboardType;

  const Input({
    Key? key,
    required this.controller,
    this.textInputAction,
    this.width,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: widget.width,
          height: 42,
          child: TextField(
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            cursorColor: const Color(0xFF3DBDFF),
            keyboardType: widget.keyboardType,
            onChanged: (_) {
              setState(() {});
            },
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 5.0),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.15),
                fontWeight: FontWeight.w500,
              ),
            ),
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF3DBDFF),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ContainerWithStar(
          isActive: widget.controller.text.isEmpty ? false : true,
        ),
      ],
    );
  }
}
