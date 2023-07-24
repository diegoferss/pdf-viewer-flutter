import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../support/styles/app_colors.dart';

abstract class PdfViewerViewModelProtocol with ChangeNotifier {
  String get pdfPath;
  PdfViewerController get pdfViewController;
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
        builder: (_, __) {
          return Scaffold(
            appBar: AppBar(),
            body: SfPdfViewer.network(
              viewModel.pdfPath,
              controller: viewModel.pdfViewController,
            ),
          );
        },
      ),
    );
  }
}
