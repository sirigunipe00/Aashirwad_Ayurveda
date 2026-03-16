import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/core/model/pair.dart';
import 'package:aashirwad/core/utils/typedefs.dart';
import 'package:aashirwad/features/gate_exit/model/gate_exit.dart';
import 'package:aashirwad/features/gate_exit/model/new_gate_exit_form.dart';

abstract interface class GateExitRepo {
  AsyncValueOf<List<GateExit>> fetchGateExits(int start, int end, PageListFilters filters);
  AsyncValueOf<GateExit> getGateExit(String name);

  AsyncValueOf<String?> getvehicleNumber(String siNumber);
  AsyncValueOf<Pair<String, String>> createGateExit(NewGateExitForm form);
  AsyncValueOf<Pair<String, String>>submitGateExit(NewGateExitForm form);
}