import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/features/home/home_view_controller.dart';
import 'package:visualize_pdf_image/features/home/home_view_model.dart';
import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view_controller.dart';
import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view_model.dart';

class HomeFactory {
  HomeFactory._();

  static const String homeRoute = '/home_route';
  static const String pdfViewerRoute = '/pdfViewer_route';

  static StatefulWidget home() {
    final viewModel = HomeViewModel();

    return HomeViewController(viewModel: viewModel);
  }

  static StatefulWidget pdfViewer(String pdfPath) {
    final viewModel = PdfViewerViewModel(pdfPathArguments: pdfPath);

    return PdfViewerViewController(viewModel: viewModel);
  }
}
