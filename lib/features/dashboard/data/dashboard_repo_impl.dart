import 'dart:convert';
import 'dart:io';

import 'package:aashirwad/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:aashirwad/features/dashboard/data/dashboard_repo.dart';
import 'package:aashirwad/features/dashboard/model/dashboard_master.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardRepo)
class DashbaordRepoImpl extends BaseApiRepository implements DashboardRepo {
  const DashbaordRepoImpl(super.client);

  @override
  AsyncValueOf<List<DashboardMaster>> fetchDashboards() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getDashboardList, 
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          return data.map((e) => DashboardMaster.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }
  
  @override
  AsyncValueOf<String> generateDashboardURL(String dashboard) async {
    return await executeSafely(() async {
      final setValResponse = await _setGraphValue(dashboard);
      return setValResponse.fold(left, (_) async {
        return await _getPublicKey(dashboard);
      });
    });
  }

  AsyncValueOf<None> _setGraphValue(String dashboard) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.setValue, 
        body: jsonEncode({
          'doctype': 'Insights Dashboard',
          'name': dashboard,
          'fieldname': {'is_public': 1},
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        parser: (json) => json,
      );
      final response = await post(config);
      return response.process((r) => right(const None()));
    });
  }

  AsyncValueOf<String> _getPublicKey(String dashboard) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getPublicKey, 
        parser: (json) {
          return json['message'];
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          'resource_type': 'Insights Dashboard',
          'resource_name': dashboard,
        })
      );
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }
}