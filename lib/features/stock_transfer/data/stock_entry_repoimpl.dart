
import 'dart:convert';
import 'dart:io';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/stock_transfer/data/stock_entry_repo.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_items.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StockEntryRepo)
class StockEntryRepoImpl extends BaseApiRepository implements StockEntryRepo {
  const StockEntryRepoImpl(super.client);

 @override
  AsyncValueOf<List<StockEntry>> fetchStockEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final filters = <List<dynamic>>[];

    if (docStatus != null) {
      filters.add(['docstatus', '=', docStatus]);
    }

    if (search != null && search.trim().isNotEmpty) {
  filters.add([
    'name',
    'like',
    '%${search.trim().toUpperCase()}%',
  ]);
}
    filters..add([
  'from_warehouse' ,'=','FQC Warehouse - RCPL'
    ],
   
    )
    ..add( [
        'to_warehouse','=','Finished Goods - RCPL'
    ]);
    
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'] as List<dynamic>;
        return data.map((e) => StockEntry.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,

        'order_by': 'creation desc',
        'doctype': 'Stock Entry',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }
  @override
AsyncValueOf<List<StockItems>> fetchStockEntryDetails(
  String stockEntryName,
) async {
  final requestConfig = RequestConfig(
    url: Urls.getList,
    parser: (json) {
      final data = json['message'] as List<dynamic>;

      return data
          .map((e) => StockItems.fromJson(e))
          .toList();
    },
    reqParams: {
      'parent': 'Stock Entry',
      'doctype': 'Stock Entry Detail',
      'fields': ['*'],
      'filters': [
        ['s_warehouse', '=', 'FQC Warehouse - RCPL'],
        ['t_warehouse', '=', 'Finished Goods - RCPL'],
        ['parent', '=', stockEntryName],
      ]
    },
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  final response = await get(requestConfig);

  return response.process((r) => right(r.data!));
}
@override
AsyncValueOf<StockEntry> fetchStockEntry(String name) async {
  final requestConfig = RequestConfig(
    url: Urls.getList,
    parser: (json) {
      final data = json['message'] as List<dynamic>;
      return StockEntry.fromJson(data.first);
    },
    reqParams: {
      'doctype': 'Stock Entry',
      'fields': '["*"]',
      'filters': '[["name","=","$name"]]',
      'limit': 1,
    },
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  final response = await get(requestConfig);

  return response.process((r) => right(r.data!));
}
@override
AsyncValueOf<String> createStockEntry(
  StockEntry stockEntry,
) async {
  final requestConfig = RequestConfig(
    url: Urls.createStockEntry,
    parser: (json) {
      return json['message']['stock_entry_name'] as String;
    },
   body: jsonEncode({
    // "stock_entry_name": null,
    'barcode': stockEntry.scanBarcode,
}),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  final response = await post(requestConfig);
  $logger..devLog('createStockEntry response: $response')

..devLog('createStockEntry requestConfig: $requestConfig');
  return response.process((r) => right(r.data!));
}

@override
AsyncValueOf<StockEntry> updateStockEntry(String name, String barcode) async {
  final requestConfig = RequestConfig(
    url: Urls.updateStockEntry, 
    parser: (json) => StockEntry.fromJson(json['message']),
    body: jsonEncode({
      'stock_entry_name': name,
      'barcode': barcode,
    }),
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );
  final response = await post(requestConfig);
  return response.process((r) => right(r.data!));
}

@override
AsyncValueOf<bool> submitStockEntry(String stockEntryName) async {
  final requestConfig = RequestConfig(
    url: Urls.submitStockEntry, 
    parser: (json) => true,
    body: jsonEncode({'stock_entry_name': stockEntryName}),
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );
  final response = await post(requestConfig);
  return response.process((r) => right(r.data!));
}
}