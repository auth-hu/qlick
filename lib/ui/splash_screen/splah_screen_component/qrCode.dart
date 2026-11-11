// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qlick/const/color.dart';
import 'package:qlick/const/splash_cons.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcode extends StatelessWidget {
  final String links;

  const Qrcode({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    final isDark = AppDark.isDark(context);

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        width: 150,
        height: 150,
        child: QrImageView(
          data: links,
          backgroundColor: isDark ? darkBackground : background,
          eyeStyle: QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: isDark ? darkTextPrimary : textPrimary,
          ),
          dataModuleStyle: QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: isDark ? background : darkBackground,
          ),
        ),
      ),
    );
  }
}