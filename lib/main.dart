import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:music_player/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          home: const SplashPage(),
        );
      }
    );
  }
}

