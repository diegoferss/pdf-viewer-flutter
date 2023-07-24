import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view_controller.dart';

class PdfViewerViewModel extends PdfViewerProtocol {
  final String pdfPathArguments;

  PdfViewerViewModel({required this.pdfPathArguments});

  @override
  String get pdfPath => pdfPathArguments;
}
