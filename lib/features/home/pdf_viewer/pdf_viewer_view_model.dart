import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view_controller.dart';

class PdfViewerViewModel extends PdfViewerProtocol {
  final String pdfPathArguments;
  final _pdfViewController = Completer<PDFViewController>();

  PdfViewerViewModel({required this.pdfPathArguments});

  @override
  String get pdfPath => pdfPathArguments;

  @override
  void onViewCreatedPdf(PDFViewController controller) {
    _pdfViewController.complete(controller);
    notifyListeners();
  }

  @override
  void onRenderPdf(int? pages) {
    notifyListeners();
  }

  @override
  void onErrorPdf(dynamic error) {
    notifyListeners();
  }

  @override
  void onPageErrorPdf(int? page, dynamic error) {
    notifyListeners();
  }
}
