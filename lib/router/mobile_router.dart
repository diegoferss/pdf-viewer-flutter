import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/features/home/di/home_factory.dart';

class MobileRouter {
  static const String initialRoute = HomeFactory.homeRoute;

  static Map<String, WidgetBuilder> routes = {
    HomeFactory.homeRoute: (_) => HomeFactory.home(),
    HomeFactory.pdfViewerRoute: (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments as String;

      return HomeFactory.pdfViewer(arguments);
    },
  };
}
