import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/styles/app_colors.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(kReleaseMode && !Urls.isTest) {
      return child;
    }
    final appName = AppConfig.appName;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: AppColors.red,
        message: _message(appName),
        location: BannerLocation.topEnd,
        textStyle: TextStyle(
          color: _color,
          fontSize: 12.0 * 0.85,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
        child: child,
      ),
    );
  }

  String _message(String name) => (kDebugMode) ? 'DEBUG $name' : 'UAT $name';

  Color get _color => HSLColor.fromColor(AppColors.red).lightness < 0.8
      ? Colors.white
      : Colors.black87;
}
