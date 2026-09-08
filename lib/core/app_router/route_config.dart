import 'package:aashirwad/features/stock_transfer/presentation/bloc/block_provider.dart';
import 'package:aashirwad/features/stock_transfer/presentation/bloc/create_stock_entry_cubit.dart/stock_entry_cubit.dart';
import 'package:aashirwad/features/stock_transfer/presentation/ui/screen/new_entry.dart';
import 'package:aashirwad/features/stock_transfer/presentation/ui/screen/stock_entry_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/app/presentation/app_home_page.dart';
import 'package:aashirwad/app/presentation/app_splash_scrn.dart';
import 'package:aashirwad/app/presentation/app_profile_page.dart';
import 'package:aashirwad/app/presentation/app_update_blocprovider.dart';
import 'package:aashirwad/app/widgets/app_scaffold_widget.dart';
import 'package:aashirwad/app/widgets/image_preview_scrn.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/auth/presentation/authentication_scrn.dart';
import 'package:aashirwad/features/dashboard/model/dashboard_master.dart';
import 'package:aashirwad/features/dashboard/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dashboard/presentation/ui/dashboards_list_scrn.dart';
import 'package:aashirwad/features/dashboard/presentation/ui/widgets/dashboard_webview.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/ui/cretae/dispatch_gaylord_form_widget.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/ui/dispatch_gaylord_list/dispatch_gaylord_list.dart';
import 'package:aashirwad/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_entry/presentation/bloc/new_gate_entry/new_gate_entry_cubit.dart';
import 'package:aashirwad/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:aashirwad/features/gate_entry/presentation/ui/gate_entry_list/gate_entry_list.dart';
import 'package:aashirwad/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:aashirwad/features/gate_exit/presentation/ui/create/new_gate_exit.dart';
import 'package:aashirwad/features/gate_exit/presentation/ui/gate_exit_list/gate_exit_list.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration/gate_registration_cubit.dart';
import 'package:aashirwad/features/gate_registration/presentation/ui/create/new_gate_registration.dart';
import 'package:aashirwad/features/gate_registration/presentation/ui/gate_registration_list/gate_registration_list.dart';
import 'package:aashirwad/features/po_approval_list/model/po_approval.dart';
import 'package:aashirwad/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/po_approval_list/presentation/ui/details/po_approval_form_widget.dart';
import 'package:aashirwad/features/po_approval_list/presentation/ui/po_approval_list/po_approval_list.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.initial.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.initial.path,
        builder: (_, state) => const AppSplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder: (_, state) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) =>
                            AppUpdateBlocprovider.get().appversionCubit()
                              ..request(),
                      ),
                    ],
                    child: const AppHomePage(),
                  );
                },
                routes: [
                  GoRoute(
                    path: _getPath(AppRoute.gateEntry),
                    builder: (ctxt, state) => const GateEntryListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateEntry),
                        builder: (ctxt, state) {
                          final provider = GateEntryBlocProvider.get();
                          final name = state.extra as String?;
                          return MultiBlocProvider(
                            providers: [
                              if (name.isNull) ...[
                                BlocProvider(
                                    create: (_) => provider.getDetails()),
                              ] else ...[
                                BlocProvider(
                                    create: (_) =>
                                        provider.getDetails()..request(name!)),
                              ],
                              BlocProvider(
                                  create: (_) =>
                                      provider.fetchPONumbers()..request()),
                              BlocProvider(
                                  create: (_) => $sl.get<NewGateEntryCubit>()),
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newGateEntryPreview),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.gateExit),
                    builder: (ctxt, state) => const GateExitListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateExit),
                        builder: (_, state) {
                          final provider = GateExitBlocProvider.get();
                          final name = state.extra as String?;
                          return MultiBlocProvider(
                            providers: [
                              if (name.isNull) ...[
                                BlocProvider(
                                    create: (_) => provider.getDetails()),
                              ] else ...[
                                BlocProvider(
                                    create: (_) =>
                                        provider.getDetails()..request(name!)),
                              ],
                              BlocProvider(
                                  create: (_) => provider.getVehicleNumber()),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateGateExitCubit>()),
                            ],
                            child: const NewGateExit(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newGateExitPreview),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.gateRegistration),
                    builder: (ctxt, state) {
                      return const GateRegistrationListScrn();
                    },
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateRegistration),
                        builder: (_, state) {
                          final blocprovider =
                              GateRegistrationBlocProvider.get();
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.employeeList()..request()),
                              BlocProvider(
                                create: (_) => $sl.get<GateRegistrationCubit>()
                                  ..initDetails(state.extra),
                              ),
                            ],
                            child: const NewGateRegistration(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                      path: _getPath(AppRoute.dipatchGaylord),
                      builder: (ctxt, state) {
                        return const DispatchGaylordList();
                      },
                      routes: [
                        GoRoute(
                          path: _getPath(AppRoute.dispatchGaylordPreview),
                          builder: (_, state) {
                            final form = state.extra as GaylordForm;
                            final blocprovider = DispatchBlocProvider.get();
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (_) =>
                                      blocprovider.fetchGaylordItems()
                                        ..request(form.name),
                                ),
                                BlocProvider(
                                    create: (_) =>
                                        blocprovider.updateGaylord()),
                                BlocProvider(
                                  create: (_) => blocprovider.removeGaylord(),
                                ),
                                BlocProvider(
                                    create: (_) =>
                                        blocprovider.submitGaylord()),
                              ],
                              child: DispatchGaylordFormWidget(
                                form: form,
                              ),
                            );
                          },
                        )
                      ]),
                  GoRoute(
                    path: _getPath(AppRoute.stockTransfer),
                    builder: (context, state) {
                      final filters = Pair(
                        StringUtils.docStatusInt('Draft'),
                        null,
                      );
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                StockEntryBlocProvider.get().fetchStockEntries()
                                  ..fetchInitial(filters),
                          ),
                        ],
                        child: const StockEntryListScrn(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newStockEntry),
                        builder: (context, state) {
                          final stockEntryName = state.extra as String?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    StockEntryBlocProvider.get().getStockItems()
                                      ..request(stockEntryName),
                              ),
                              BlocProvider(
                                  create: (_) => $sl.get<NewStockEntryCubit>()),
                            ],
                            child:
                                NewStockEntry(stockEntryName: stockEntryName),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.poApprovalList),
                    builder: (ctxt, state) => const PoApprovalListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.poApprovalListPreview),
                        builder: (_, state) {
                          final form = state.extra as PoApprovalForm;
                          final blocprovider = PoApprovalBlocProvider.get();
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (_) => blocprovider.fetchPoOrderItems()
                                  ..request(form.name),
                              ),
                              BlocProvider(
                                  create: (_) => blocprovider.rejectPO()),
                              BlocProvider(
                                  create: (_) => blocprovider.approvePO()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.poAttchmentsCubit()
                                        ..request(form.name)),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.poPermissionCubit()
                                        ..request(form.name)),
                            ],
                            child: PoApprovalFormWidegt(form: form),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.dashboards),
                    builder: (ctxt, state) => BlocProvider(
                      create: (_) =>
                          DashboardBlocProvider.get().dashboardsCubit()
                            ..request(),
                      child: const DashboardsListScrn(),
                    ),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.dashboardView),
                        builder: (_, state) {
                          final mastr = state.extra as DashboardMaster;
                          final provider = DashboardBlocProvider.get();
                          return BlocProvider(
                            create: (_) => provider.dashboardURLCubit()
                              ..request(mastr.name),
                            child: DashboardWebview(
                                name: mastr.name, title: mastr.title),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.account.path,
                builder: (_, __) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static String _getPath(AppRoute route) => route.path.split('/').last;
}
