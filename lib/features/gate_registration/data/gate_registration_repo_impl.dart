import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/gate_registration/data/gate_registration_repo.dart';
import 'package:aashirwad/features/gate_registration/model/employee_details_form.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GateRegistrationRepo)
class GateRegistrationRepoImpl extends BaseApiRepository
    implements GateRegistrationRepo {
  const GateRegistrationRepoImpl(super.client);

  @override
  AsyncValueOf<Pair<String, String>> createGateRegistration(
      GateRegistrationForm form) async {
    return await executeSafely(() async {
      final formJson = GateRegistrationForm.toEncodedFormJson(form);
      final cleanedMap = removeNullValues(formJson);

      final config = RequestConfig(
        url: Urls.newGateRegistration,
        body: jsonEncode(cleanedMap),
        parser: (json) {
          final data = json['message']['data'];
          if (data is Map<String, dynamic>) {
            return data['name'] as String?;
          } else {
            final listData = data as List<dynamic>;
            return listData.first['name'] as String?;
          }
        },
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((docNo) {
        final msgWithDocNo =
            """The Gate Registration details - "${docNo.data}" have been saved successfully. Please submit it before leaving""";
        return right(Pair(docNo.data.valueOrEmpty, msgWithDocNo));
      });
    });
  }

  @override
  AsyncValueOf<Pair<String, String>> submitGateRegistration(
      GateRegistrationForm form) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.submitGateRegistration,
        parser: (json) {
          final data = json['message']['data'];
          if (data is Map<String, dynamic>) {
            return data['name'] as String?;
          } else {
            final listData = data as List<dynamic>;
            return listData.first['name'] as String?;
          }
        },
        body: jsonEncode(form.toJson()),
      );

      final response = await post(config);
      return response.process((docNo) {
        final msgWithDocNo =
            """Gate Registration ${docNo.data} is submitted successfully.""";
        return right(Pair(docNo.data.valueOrEmpty, msgWithDocNo));
      });
    });
  }

  @override
  AsyncValueOf<List<GateRegistrationForm>> fetchRegistrations(
      PageListFilters filter, int start, int end) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getVisitorsList,
        reqParams: {
          'status': filter.status,
          'startrow': start + 1,
          'endrow': end,
          if (filter.query.containsValidValue && filter.query!.length >= 2)
            'query': filter.query,
        },
        parser: (p0) {
          final entries = p0['message']['data'] as List<dynamic>;
          return entries.map((e) => GateRegistrationForm.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<EmployeeDetailsForm>> fetchEmployees() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.employeeList,
        reqParams: {
          'fields': EmployeeDetailsForm.fields,
          'limit_page_length': 'None'
        },
        parser: (p0) {
          final data = p0['data'] as List<dynamic>;
          return data.map((e) => EmployeeDetailsForm.fromJson(e)).toList();
        },
      );
      $logger.devLog(config);
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }
}
