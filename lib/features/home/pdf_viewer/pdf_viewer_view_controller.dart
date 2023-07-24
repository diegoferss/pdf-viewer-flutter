import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/features/home/pdf_viewer/pdf_viewer_view.dart';

abstract class PdfViewerProtocol extends PdfViewerViewModelProtocol {}

class PdfViewerViewController extends StatefulWidget {
  final PdfViewerProtocol viewModel;

  const PdfViewerViewController({super.key, required this.viewModel});

  @override
  State<PdfViewerViewController> createState() => _PdfViewerViewControllerState();
}

class _PdfViewerViewControllerState extends State<PdfViewerViewController> {
  @override
  Widget build(BuildContext context) {
    return PdfViewerView(viewModel: widget.viewModel);
  }
}
