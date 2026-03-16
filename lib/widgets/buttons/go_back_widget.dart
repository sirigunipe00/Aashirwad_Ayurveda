import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/styles/app_colors.dart';

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.close,
      child: const CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.chimneySweep,
        child: Icon(Icons.arrow_back, color: AppColors.white, size: 20),
      ),
    );
  }
}
