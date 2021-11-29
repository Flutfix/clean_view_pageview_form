import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/info_card_model.dart';

class PlanCard extends StatelessWidget {
  final InfoCardModel item;
  const PlanCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Stack(alignment: Alignment.center, children: [
        Image.asset(
          item.image,
          width: width,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'до ${item.square} м2',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: AppConfig.whiteColor,
                ),
              ),
              Text(
                '${item.price} ${item.currency}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: AppConfig.whiteColor,
                ),
              ),
              const SizedBox(height: 29),
              Text(
                '${item.previousPrice} ${item.currency}',
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w500,
                  color: AppConfig.whiteColor.withOpacity(0.4),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
