import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/features/home/di/home_factory.dart';
import 'package:visualize_pdf_image/features/home/home_view.dart';
import 'package:visualize_pdf_image/support/utils/components/default_dialog.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void Function(String pdfPath)? onTapSeeExam;
  VoidCallback? onFailureSeeExam;
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

    widget.viewModel.onFailureSeeExam = () {
      showDialog(
        context: context,
        builder: (_) {
          return const DefaultDialog(
            titleMessage: 'Erro ao visualizar PDF',
            contentMessage: 'No momento não foi possível enviar sua mensagem. Tente novamente mais tarde',
          );
        },
      );
    };
  }
}
