import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/app/presentation/app_update_blocprovider.dart';
import 'package:aashirwad/app/widgets/app_feature_widget.dart';
import 'package:aashirwad/app/widgets/app_page_view.dart';
import 'package:aashirwad/app/widgets/app_update_dailog.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/styles/app_text_styles.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {

  Future<void> launchProduction() async {
    final String base = Urls.baseUrl.replaceAll('/api', '');
  final Uri url = Uri.parse('$base/app/production-booking-s');

  try {
    bool launched = await launchUrl(
      url, 
      mode: LaunchMode.externalApplication,
    );
  if (!launched) {
      debugPrint('Could not launch $url');
    }
  } catch (e) {
    debugPrint('Error launching URL: $e');

  }
}
    final userRoles = context.user.roles;
    return AppPageView(
      mode: PageMode.home,
      child: BlocListener<AppVersionCubit, AppVersionCubitState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (data) {
              if (data) {
                showDialog(
                    context: context,
                    builder: (ctx) => AppUpdateDialog(
                        appName: AppConfig.appName.toUpperCase(),
                        packageName: AppConfig.packageName),
                    barrierDismissible: false);
              }
            },
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (userRoles == null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${context.user.name} does not have access to view the features.',
                    style: AppTextStyles.featureLabelStyle(context).copyWith(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (userRoles != null) ...[
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(12.0),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 1,
                    children: [
                      if (BooleanUtls.fromInt(userRoles.entry))
                        AppFeatureWidget(
                          icon: AppIcons.vechileEntry.toWidget(
                              height: 100, width: 120, fit: BoxFit.contain),
                          title: Text('Gate Entry',
                              style: AppTextStyles.featureLabelStyle(context)),
                          featureColor: AppColors.marigoldDDust,
                          onTap: () => AppRoute.gateEntry.push(context),
                        ),
                      if (BooleanUtls.fromInt(userRoles.exit))
                        AppFeatureWidget(
                          icon: AppIcons.vehcileExit.toWidget(
                              height: 100, width: 120, fit: BoxFit.contain),
                          title: Text('Gate Exit',
                              style: AppTextStyles.featureLabelStyle(context)),
                          featureColor: AppColors.shyMoment,
                          onTap: () => AppRoute.gateExit.push(context),
                        ),
                      // if (BooleanUtls.fromInt(userRoles.registration))
                        AppFeatureWidget(
                          icon: AppIcons.production.toWidget(
                              height: 140, width: 140, fit: BoxFit.contain),
                          title: FittedBox(
                            child: Text('Production Bookings',
                                style:
                                    AppTextStyles.featureLabelStyle(context)),
                          ),
                          featureColor: AppColors.haintBlue.withValues(alpha: 0.7),
                          onTap: () => launchProduction(),
                        ),
                      // if (BooleanUtls.fromInt(userRoles.gaylord))
                      // AppFeatureWidget(
                      //   icon: AppIcons.stock.toWidget(
                      //       height: 120, width: 100, fit: BoxFit.contain),
                      //   title: FittedBox(
                      //     child: Text('Stock Transfer',
                      //         style: AppTextStyles.featureLabelStyle(context)),
                      //   ),
                      //   featureColor: const Color(0xFFFFA95F).withValues(alpha: 0.7),
                      //   onTap: () => AppRoute.stockTransfer.push(context),
                      // ),
                      //   AppFeatureWidget(
                      //     icon: AppIcons.gayLord.toWidget(
                      //         height: 100, width: 120, fit: BoxFit.fill),
                      //     title: FittedBox(
                      //       child: Text('Dispatch Gaylord',
                      //           style:
                      //               AppTextStyles.featureLabelStyle(context)),
                      //     ),
                      //     featureColor: AppColors.dispatch,
                      //     onTap: () {
                      //       // AppRoute.dipatchGaylord.push(context);
                      //     },
                      //   ),
                   
                      // if (BooleanUtls.fromInt(userRoles.approval))
                      //   AppFeatureWidget(
                      //     icon: FittedBox(
                      //       child: AppIcons.poApproval.toWidget(
                      //           height: 100, width: 120, fit: BoxFit.contain),
                      //     ),
                      //     title: FittedBox(
                      //       child: Text('PO Approval List',
                      //           style:
                      //               AppTextStyles.featureLabelStyle(context)),
                      //     ),
                      //     featureColor: const Color(0xFF0DB295),
                      //     onTap: () => AppRoute.poApprovalList.push(context),
                      //   ),
                      // if (BooleanUtls.fromInt(userRoles.dashbaords))
                      //   AppFeatureWidget(
                      //     icon: AppIcons.dashboards.toWidget(
                      //         height: 100, width: 120, fit: BoxFit.fill),
                      //     title: Text('Dashboard',
                      //         style: AppTextStyles.featureLabelStyle(context)),
                      //     featureColor: AppColors.dashboard,
                      //     onTap: () => AppRoute.dashboards.push(context),
                      //   ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
