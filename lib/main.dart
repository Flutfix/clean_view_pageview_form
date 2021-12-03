import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/pages/plans_page_view/general.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controllers/general_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GeneralController controller = GeneralController();

  @override
  Widget build(BuildContext context) {
    return Provider<GeneralController>(
      create: (_) => controller,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          color: AppConfig.whiteColor,
          theme: ThemeData(fontFamily: AppConfig.fontFamilyInter),
          debugShowCheckedModeBanner: false,
          home: const General(),
        ),
      ),
    );
  }
}
