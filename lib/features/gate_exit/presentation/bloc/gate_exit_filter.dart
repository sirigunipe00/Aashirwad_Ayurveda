
import 'package:aashirwad/core/cubit/base/filters_cubit.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/core/utils/utils.dart';

class GateExitFilterCubit extends FiltersCubit {
  GateExitFilterCubit() : super(PageListFilters.initial());

  @override
  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  @override
  void onSearch([String? query]) {
    if(query.doesNotHaveValue) {
      emitSafeState(PageListFilters(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}