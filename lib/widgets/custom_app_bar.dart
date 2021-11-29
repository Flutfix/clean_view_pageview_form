import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool isBackArrow;
  const CustomAppBar({
    Key? key,
    this.isBackArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBackArrow
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(19, 16, 21, 16),
                      child: SvgPicture.asset(
                        'lib/assets/images/back_arrow.svg',
                        width: 10,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 50,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Image.asset(
                'lib/assets/images/logo.png',
                width: 104,
              ),
            ),
            const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }
}
