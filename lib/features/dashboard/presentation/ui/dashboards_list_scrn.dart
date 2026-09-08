import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/app/widgets/app_page_view2.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dashboard/model/dashboard_master.dart';
import 'package:aashirwad/features/dashboard/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:aashirwad/widgets/app_error_widget.dart';
import 'package:aashirwad/widgets/loading_indicator.dart';
import 'package:intl/intl.dart';

class DashboardsListScrn extends StatelessWidget {
  const DashboardsListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2(
      mode: PageMode2.dashbaords,
      scaffoldBg: AppIcons.bgFrame5.path,
      backgroundColor: const Color(0xFF8DC2FF),
      hideFAB: true,
      child: BlocBuilder<DashboardMasterCubit, DashboardMasterState>(
        builder: (_, state) => state.maybeWhen(
          orElse: () => const Center(child: LoadingIndicator()),
          failure: (failure) => AppErrorWidget(
            error: failure.error,
            onRefresh: context.cubit<DashboardMasterCubit>().request,
          ),
          success: (data) => _DashbaordList(items: data),
        ),
      ),
    );
  }
}

class _DashbaordList extends StatelessWidget {
  const _DashbaordList({required this.items});

  final List<DashboardMaster> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final item = items.elementAt(index);
        return GestureDetector(
          onTap: () => AppRoute.dashboardView.push(context, extra: item),
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.subtitlecolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(item.isFavourite
                          ? Icons.star
                          : Icons.star_border_outlined),
                      const Icon(Icons.arrow_right_alt)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility_rounded,
                        color: Colors.grey,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        item.viewCount.toString(),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                        getTimeDifference(parseDate(item.time)),
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

DateTime parseDate(String dateString) {
  return DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS').parse(dateString);
}

String getTimeDifference(DateTime lastUpdated) {
  final now = DateTime.now();
  final difference = now.difference(lastUpdated);

  if (difference.inMinutes < 1) {
    return 'Updated just now';
  } else if (difference.inMinutes < 60) {
    return 'Updated ${difference.inMinutes} mins ago';
  } else if (difference.inHours < 24) {
    return 'Updated ${difference.inHours} hrs ago';
  } else {
    return 'Updated ${difference.inDays} days ago';
  }
}
