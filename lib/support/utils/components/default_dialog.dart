import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_fonts.dart';

class DefaultDialog extends StatelessWidget {
  final String titleMessage;
  final String contentMessage;
  final VoidCallback? onTapButton;

  const DefaultDialog({
    required this.titleMessage,
    required this.contentMessage,
    this.onTapButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Text(titleMessage, style: AppFonts.robotoMedium(17)),
            const SizedBox(height: 20),
            Text(
              contentMessage,
              style: AppFonts.robotoMedium(13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Divider(
              height: 0,
              color: AppColors.black.withOpacity(0.15),
              thickness: 2,
            ),
            TextButton(
              onPressed: onTapButton ?? Navigator.of(context).pop,
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
