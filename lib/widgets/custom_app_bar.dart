import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.height = 60,
    this.isBackArrow = false,
    this.isChatAvailable = false,
    this.onChatTap,
  }) : super(key: key);

  final bool isBackArrow;
  final double height;
  final bool isChatAvailable;
  final Function()? onChatTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isBackArrow
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(19, 0, 21, 0),
                          child: SvgPicture.asset(
                            'lib/assets/images/back_arrow.svg',
                            width: 10,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  )
                : const SizedBox(width: 50),
            Padding(
                padding: const EdgeInsets.only(top: 3),
                child: _buildLogo(text: AppConfig.companyName)),
            widget.isChatAvailable
                ? _buildChatButton(
                    icon: 'lib/assets/images/chat.png',
                    iconSize: 28,
                    onTap: widget.onChatTap,
                  )
                : const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildChatButton({
    required String icon,
    required Function()? onTap,
    double? iconSize,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            height: 30,
            width: 50,
          ),
          Image.asset(
            icon,
            width: iconSize,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo({required String text}) {
    var textList = text.split(' ');
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: '${textList[0]} ',
        style: const TextStyle(
          fontSize: 20,
          color: AppConfig.blueColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      TextSpan(
        text: textList[1],
        style: const TextStyle(
          fontSize: 20,
          color: AppConfig.blackColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    ]));
  }
}
