import 'package:flutter/material.dart';
import 'package:project1/contacts/screens/home_screen.dart';

import 'contacts/screens/splash_screen.dart';
import 'contacts/widgets/route_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.onBoardingRouteName,
      // routes: {
      //   AppRoutes.onBoardingRouteName: (context) => OnBoardingScreen(),
      //   AppRoutes.homeRouteName: (context) => HomeScreen(),
      // },
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: RouteColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: RouteColors.darkBlue,
          primary: RouteColors.darkBlue,
        ),
        fontFamily: 'Roboto',
      ),
      home: const AnimatedSplashScreen(),
    );
  }
}
