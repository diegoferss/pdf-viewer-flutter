import 'package:flutter/material.dart';
import 'package:visualize_pdf_image/support/styles/app_colors.dart';
import 'package:visualize_pdf_image/support/styles/app_fonts.dart';

import '../../models/exam.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  bool get isExamsEmpty;
  bool get isLoading;
  List<Exam> get exams;

  void didTapSeeExam(Exam exam);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Lista de exames',
          style: AppFonts.robotoBold(20),
        ),
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
        builder: (_, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _bodyWidget,
          );
        },
      ),
    );
  }

  List<Widget> get _bodyWidget {
    if (viewModel.isLoading) {
      return [const Center(child: CircularProgressIndicator())];
    }

    if (viewModel.isExamsEmpty) {
      return [
        const Center(
          child: Icon(Icons.edit_document, size: 100),
        ),
        const SizedBox(height: 24),
        Text(
          'O paciente não possui exames',
          style: AppFonts.robotoMedium(16),
          textAlign: TextAlign.center,
        )
      ];
    }

    return [
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
          ),
          itemCount: viewModel.exams.length,
          itemBuilder: (_, index) {
            final exam = viewModel.exams[index];

            return InkWell(
              onTap: () {
                viewModel.didTapSeeExam(exam);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Text(exam.name, style: AppFonts.robotoBold(16)),
                    const Spacer(),
                    const Icon(Icons.edit_document, size: 24),
                    const Spacer(),
                    Text(exam.date),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}


/*

SingleChildScrollView(
          child: Wrap(
            children: viewModel.exams.map((exam) {
              return Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Text(exam.name, style: AppFonts.robotoBold(16)),
                    const Spacer(),
                    Text('Feito no dia: ${exam.date}'),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        */