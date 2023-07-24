import 'package:visualize_pdf_image/features/home/home_view_controller.dart';
import 'package:visualize_pdf_image/support/utils/download_helper.dart';

import '../../models/exam.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _isLoading = false;
  final DownloadHelperProtocol downloadHelper = DownloadHelper();
  final List<Exam> _exams = [
    Exam(1, 'Arquivo 1', '2022-07-24',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(2, 'Arquivo 2', '2022-07-24',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(3, 'Arquivo 3', '2022-07-23',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(4, 'Arquivo 4', '2022-07-23',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(5, 'Arquivo 5', '2022-07-23',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(6, 'Arquivo 6', '2022-07-23',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(7, 'Arquivo 7', '2022-07-22',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
    Exam(8, 'Arquivo 8', '2022-07-22',
        'https://jera-sauver.s3.amazonaws.com/uploads/staging/document/output_file/340/a7f6e1b9-8777-4dcb-aec9-67125ccff96f.pdf'),
  ];

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isExamsEmpty => exams.isEmpty;

  @override
  List<Exam> get exams => _exams;

  @override
  void didTapSeeExam(Exam exam) {
    _updateIsLoading(true);

    downloadHelper.downloadPDF(
      url: exam.outputFile,
      pdfName: exam.name,
      onSuccess: (path) {
        _updateIsLoading(false);

        onTapSeeExam?.call(path);
      },
      onFailure: () {
        _updateIsLoading(false);

        onFailureSeeExam?.call();
      },
    );
  }

  void _updateIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
