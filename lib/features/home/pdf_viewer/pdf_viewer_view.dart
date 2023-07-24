import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../support/styles/app_colors.dart';

abstract class PdfViewerViewModelProtocol with ChangeNotifier {
  String get pdfPath;

  void onRenderPdf(int? pages);
  void onPageErrorPdf(int? page, dynamic error);
  void onErrorPdf(dynamic error);
  void onViewCreatedPdf(PDFViewController controller);
}

class PdfViewerView extends StatelessWidget {
  final PdfViewerViewModelProtocol viewModel;

  const PdfViewerView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: _bodyPdfViewerWidget,
      ),
    );
  }

  Widget _bodyPdfViewerWidget(BuildContext context, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: PDFView(
        filePath: viewModel.pdfPath,
        pageFling: false,
        pageSnap: false,
        fitEachPage: false,
        autoSpacing: Platform.isIOS,
        fitPolicy: FitPolicy.BOTH,
        onRender: viewModel.onRenderPdf,
        onError: viewModel.onErrorPdf,
        onViewCreated: viewModel.onViewCreatedPdf,
      ),
    );
  }
}
