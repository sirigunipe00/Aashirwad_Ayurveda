import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:aashirwad/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/dispatch_gaylord_filter.dart';
import 'package:aashirwad/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_entry/presentation/bloc/gate_entry_filter.dart';
import 'package:aashirwad/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration_filter/gate_registration_filter.dart';
import 'package:aashirwad/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/po_approval_list/presentation/bloc/po_approval_filters_cubit.dart';
import 'package:aashirwad/styles/material_theme.dart';

import 'widgets/widgets.dart';

class AashirwadApp extends StatelessWidget {
  const AashirwadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider<SignInCubit>(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(create: (_) => GateExitFilterCubit()),
        BlocProvider(create: (_) => GateRegistrationFilterCubit()),
        BlocProvider(create: (_) => PoApprovalFiltersCubit()),
        BlocProvider(create: (_) => DispatchGaylordFilterCubit()),
        BlocProvider(
          create: (_) => GateEntryBlocProvider.get().createGateEntriesCubit()),
        BlocProvider(
          create: (_) => GateExitBlocProvider.get().createGateExitsCubit()),
        BlocProvider(
          create: (_) => GateRegistrationBlocProvider.get().createGateRegistrationsCubit()),
        BlocProvider(create: (_) => PoApprovalBlocProvider.get().fetchPurchaseOrders()),
        BlocProvider(create: (_) => DispatchBlocProvider.get().fetchGaylords()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          final routerCtxt = AppRouterConfig.parentNavigatorKey.currentContext!;
          state.maybeWhen(
            orElse: () => AppRoute.initial.go(routerCtxt),
            authenticated: () {
              routerCtxt
                ..cubit<GateEntriesCubit>().fetchInitial(PageListFilters.initial())
                ..cubit<GateExitsCubit>().fetchInitial(PageListFilters.initial())
                ..cubit<GateRegistrationsCubit>().fetchInitial(PageListFilters.initial())
                ..cubit<DispatchCubit>().fetchInitial(PageListFilters.initial())
                ..cubit<PoApprovalCubit>().fetchInitial(PageListFilters.initial());
              AppRoute.home.go(routerCtxt);
            },
            unAuthenticated: () => AppRoute.login.go(routerCtxt),
          );
        },
        child: FlavorBanner(
          child: MaterialApp.router(
            title: AppConfig.appName,
            theme: AppMaterialTheme.lightTheme,
            darkTheme: AppMaterialTheme.lightTheme,
            routerConfig: AppRouterConfig.router,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
