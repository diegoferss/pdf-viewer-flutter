import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/features/home/di/home_factory.dart';
import 'package:visualize_pdf_image/features/home/home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void Function(String pdfPath)? onTapSeeExam;
}

class HomeViewController extends StatefulWidget {
  final HomeViewProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapSeeExam = (String pdfPath) {
      Navigator.pushNamed(
        context,
        HomeFactory.pdfViewerRoute,
        arguments: pdfPath,
      );
    };
  }
}
