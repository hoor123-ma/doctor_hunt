import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/app_router.dart';
import 'package:doctor_hunt/features/spalsh/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(fontFamily: AppConsts.fontName),
    );
  }
}
