import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view_controller.dart';

class PdfViewerViewModel extends PdfViewerProtocol {
  final String pdfPathArguments;
  final PdfViewerController _pdfViewController = PdfViewerController();

  PdfViewerViewModel({required this.pdfPathArguments});

  @override
  String get pdfPath => pdfPathArguments;

  @override
  PdfViewerController get pdfViewController => _pdfViewController;
}
