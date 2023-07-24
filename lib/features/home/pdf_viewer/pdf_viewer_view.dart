import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../support/styles/app_colors.dart';

abstract class PdfViewerViewModelProtocol with ChangeNotifier {
  String get pdfPath;
}

class PdfViewerView extends StatelessWidget {
  final PdfViewerViewModelProtocol viewModel;

  const PdfViewerView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: _bodyPdfViewerWidget,
      ),
    );
  }

  Widget _bodyPdfViewerWidget(BuildContext context, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(viewModel.pdfPath),
    );
  }
}
