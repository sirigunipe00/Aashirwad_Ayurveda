


import 'package:aashirwad/core/utils/typedefs.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_items.dart';

abstract interface class StockEntryRepo {
  AsyncValueOf<List<StockEntry>> fetchStockEntries(    int start,
    int? docStatus,
    String? search,
  );  
  AsyncValueOf<StockEntry> fetchStockEntry(String name);
  AsyncValueOf<List<StockItems>> fetchStockEntryDetails(String name);
  AsyncValueOf<String> createStockEntry(StockEntry stockEntry);
  AsyncValueOf<StockEntry> updateStockEntry(String name, String barcode);
  AsyncValueOf<bool> submitStockEntry(String name);
}