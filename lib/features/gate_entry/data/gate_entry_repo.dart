import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/gate_entry/model/gate_entry.dart';
import 'package:aashirwad/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:aashirwad/features/gate_entry/model/purchase_order.dart';

abstract interface class GateEntryRepo {
  AsyncValueOf<List<GateEntry>> fetchEntries(int start, int end, PageListFilters filters);
  AsyncValueOf<GateEntry> getEntry(String name);

  AsyncValueOf<List<PurchaseOrder>> fetchPONumbers();
  AsyncValueOf<Pair<String, String>> createGateEntry(NewGateEntryForm form);
  AsyncValueOf<Pair<String, String>> submitGateEntry(NewGateEntryForm form);
}
