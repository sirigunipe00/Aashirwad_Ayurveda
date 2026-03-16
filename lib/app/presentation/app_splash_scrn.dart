import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:svg_flutter/svg.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: SvgPicture.asset(AppConfig.logo, width: 200, height: 200)),
    );
  }
}