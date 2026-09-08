import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/data/dispatch_gaylord_repo.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_items_form.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DispatchGaylordRepo)
class DispatchGaylordRepoImpl extends BaseApiRepository
    implements DispatchGaylordRepo {
  const DispatchGaylordRepoImpl(super.client);

  @override
  AsyncValueOf<List<GaylordForm>> getGaylords(int start, String status, String? search) async {
    final requestConfig = RequestConfig(
      url: Urls.getDispatchList,
      parser: (json) {
        final data = json['message']['data'];

        if (data is Map<String, dynamic>) {
          return [GaylordForm.fromJson(data)];
        } else {
          final listdata = data as List<dynamic>;
          return listdata.map((e) => GaylordForm.fromJson(e)).toList();
        }
      },
      body: jsonEncode(
        {
          if (search != null && search.isNotEmpty && search.length >= 2) ...{
            'query': search,
          },
          'startrow': start,
          'status': status,
        },
      ),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<GaylordItemsForm>> getGaylordItems(String name) async {
    final requestConfig = RequestConfig(
      url: Urls.getGaylord,
      parser: (json) {
        final data = json['message']['data']['scan_barcodes'];

        if (data is Map<String, dynamic>) {
          return [GaylordItemsForm.fromJson(data)];
        } else {
          final listdata = data as List<dynamic>;
          return listdata.map((e) => GaylordItemsForm.fromJson(e)).toList();
        }
      },
      body: jsonEncode({'DN_name': name}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<String> updateDispatchGaylord(
      String id, String barcoderesult) async {
    final requestConfig = RequestConfig(
      url: Urls.updateDispatchGaylord,
      parser: (json) => json,
      body: jsonEncode({
        'dn_id': id,
        'scan_barcode': [
          {'scan_barcode': barcoderesult}
        ]
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(requestConfig);
    return response.process((r) => right('Successfully Updated'));
  }

  @override
  AsyncValueOf<String> removeDispatchGaylord(
      String id, List<String> barcodeid) async {
    final requestConfig = RequestConfig(
      url: Urls.removeDispatchGaylord,
      parser: (json) => json,
      body: jsonEncode({
        'scan_barcode_id': barcodeid,
        'dn_id': id,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await post(requestConfig);
    return response.process((r) => right('Successfully Deleted'));
  }

  @override
  AsyncValueOf<String> submitDispatchGaylord(String id) async {
    final requestConfig = RequestConfig(
      url: Urls.submitDispatchGaylord,
      parser: (json) {
        final data = json['message']['message'];
        return data;
      },
      body: jsonEncode({'dn_id': id}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }
}
