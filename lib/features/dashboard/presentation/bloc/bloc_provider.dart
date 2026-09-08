import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dashboard/data/dashboard_repo.dart';
import 'package:aashirwad/features/dashboard/model/dashboard_master.dart';
import 'package:injectable/injectable.dart';

typedef DashboardMasterCubit = NetworkRequestCubit<List<DashboardMaster>, None>;
typedef DashboardMasterState = NetworkRequestState<List<DashboardMaster>>;

typedef DashboardURLCubit = NetworkRequestCubit<String, String>;
typedef DashboardURLState = NetworkRequestState<String>;

@injectable
class DashboardBlocProvider {

  const DashboardBlocProvider({required this.repo});
  final DashboardRepo repo;

  static DashboardBlocProvider get() => $sl.get<DashboardBlocProvider>();

  DashboardMasterCubit dashboardsCubit() => DashboardMasterCubit(
    onRequest: (params, _) => repo.fetchDashboards(),
  );

  DashboardURLCubit dashboardURLCubit() => DashboardURLCubit(
    onRequest: (params, _) => repo.generateDashboardURL(params!),
  );
}