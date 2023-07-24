import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/router/mobile_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MobileRouter.routes,
      initialRoute: MobileRouter.initialRoute,
    );
  }
}
