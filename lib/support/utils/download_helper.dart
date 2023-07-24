import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../api/setup/api_provider.dart';

typedef Success = void Function(String dirPath);
typedef Failure = VoidCallback;

abstract class DownloadHelperProtocol {
  Future<void> downloadPDF({
    required String url,
    required String pdfName,
    Success? onSuccess,
    Failure? onFailure,
  });
}

class DownloadHelper extends DownloadHelperProtocol {
  final ApiProvider _apiProvider = ApiProvider();

  @override
  Future<void> downloadPDF({
    required String url,
    required String pdfName,
    Success? onSuccess,
    Failure? onFailure,
  }) {
    final dir = getApplicationDocumentsDirectory();
    return dir.then(
      (directory) {
        final path = '${directory.path}/exames/$pdfName.pdf';
        return _apiProvider.downloadFile(url: url, path: path).then((_) => onSuccess?.call(path));
      },
    ).catchError(
      (_) => onFailure?.call(),
    );
  }
}
