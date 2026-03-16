import 'package:flutter/material.dart';
import 'package:aashirwad/app/widgets/app_page_view2.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/dispatch_gaylord_filter.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/ui/dispatch_gaylord_list/widget/dipatch_widget.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:aashirwad/widgets/infinite_list_widget.dart';

class DispatchGaylordList extends StatelessWidget {
  const DispatchGaylordList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<DispatchGaylordFilterCubit>(
      mode: PageMode2.dipatchGaylord,
      scaffoldBg: AppIcons.bgFrame6.path,
      hideFAB: true,
      backgroundColor: const Color(0xFFF9CFC0),
      status: const ['Draft', 'Submitted'],
      onUpdateStatus: (value) {
        context.cubit<DispatchGaylordFilterCubit>().onChangeStatus(value);
        _fetchInitial(context);
      },
      onUpdateQuery: (value) {
        context.cubit<DispatchGaylordFilterCubit>().onSearch(value);
        _fetchInitial(context);
      },
      child: InfiniteListViewWidget<DispatchCubit, GaylordForm>(
        childBuilder: (context, list) {
          return DispatchWidget(
            gayLord: list,
            onTap: () {
              AppRoute.dispatchGaylordPreview
                  .push<bool?>(context, extra: list);
            },
          );
        },
        fetchInitial: () => _fetchInitial(context),
        fetchMore: () => _fetchMore(context),
        emptyListText: 'No Dispatch Gaylords Found',
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filters = context.cubit<DispatchGaylordFilterCubit>().state;
    context.cubit<DispatchCubit>().fetchInitial(filters);
  }

  void _fetchMore(BuildContext context) {
    final filters = context.cubit<DispatchGaylordFilterCubit>().state;
    context.cubit<DispatchCubit>().fetchMore(filters);
  }
}
