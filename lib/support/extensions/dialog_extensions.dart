import 'package:flutter/material.dart';

import '../utils/components/default_dialog.dart';

extension DialogExtensions on State {
  void showDefaultDialog({
    required String titleMessage,
    required String contentMessage,
    VoidCallback? onTapButton,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return DefaultDialog(
          titleMessage: titleMessage,
          contentMessage: contentMessage,
          onTapButton: onTapButton,
        );
      },
    );
  }
}
