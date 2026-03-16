import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dashboard/model/dashboard_master.dart';

abstract interface class DashboardRepo {
  AsyncValueOf<List<DashboardMaster>> fetchDashboards();
  AsyncValueOf<String> generateDashboardURL(String dashboard);
}
