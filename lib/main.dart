// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app_ui/app_theme.dart';
import 'package:grocery_app_ui/models/cart_model.dart';
import 'package:grocery_app_ui/screens/item_details_screen/item_details_screen.dart';

import 'package:grocery_app_ui/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: SafeArea(
            child: Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}
