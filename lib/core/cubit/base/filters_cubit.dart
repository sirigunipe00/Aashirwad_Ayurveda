import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';

abstract class FiltersCubit extends AppBaseCubit<PageListFilters> {
  FiltersCubit(super.initialState);
  void onSearch([String? query]);
  void onChangeStatus(String status);
}