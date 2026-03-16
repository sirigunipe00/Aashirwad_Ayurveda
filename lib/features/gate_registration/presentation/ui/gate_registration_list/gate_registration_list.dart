import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/app/widgets/app_page_view2.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration_filter/gate_registration_filter.dart';
import 'package:aashirwad/features/gate_registration/presentation/widgets/gate_registration_widget.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:aashirwad/widgets/infinite_list_widget.dart';

class GateRegistrationListScrn extends StatelessWidget {
  const GateRegistrationListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<GateRegistrationFilterCubit>(
      mode: PageMode2.gateregistration,
      backgroundColor: const Color(0xFFE0FFCC),
      scaffoldBg: AppIcons.bgFrame3.path,
      onNew: () => AppRoute.newGateRegistration.push<bool?>(context),
      onUpdateQuery: (value) {
        context.cubit<GateRegistrationFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<GateRegistrationFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['Draft', 'Submitted'],
      child: SizedBox(
        width: context.sizeOfWidth,
        child: InfiniteListViewWidget<GateRegistrationsCubit, GateRegistrationForm>(
          childBuilder: (_, registration) => GateRegistrationWidget(
            gateRegistration: registration,
            onTap: () => AppRoute.newGateRegistration
                .push<bool?>(context, extra: registration),
          ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No Vistors Registrations Found',
        ),
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateRegistrationFilterCubit>().state;
    context.cubit<GateRegistrationsCubit>().fetchInitial(filter);
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateRegistrationFilterCubit>().state;
    context.cubit<GateRegistrationsCubit>().fetchMore(filter);
  }
}
