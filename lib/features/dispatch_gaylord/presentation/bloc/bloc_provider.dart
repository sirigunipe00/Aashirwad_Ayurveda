import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/dispatch_gaylord/data/dispatch_gaylord_repo.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_items_form.dart';
import 'package:injectable/injectable.dart';

typedef DispatchCubit = InfiniteListCubit<GaylordForm, PageListFilters, PageListFilters>;
typedef DispatchState = InfiniteListState<GaylordForm>;

typedef GaylordItemLines = NetworkRequestCubit<List<GaylordItemsForm>, String>;
typedef GaylordItemLinesState = NetworkRequestState<List<GaylordItemsForm>>;

typedef UpdateDispatchGaylord
    = NetworkRequestCubit<String, Pair<String, String>>;
typedef UpdateDispatchGaylordState = NetworkRequestState<String>;

typedef RemoveDispatchGaylord = NetworkRequestCubit<String, Pair<String ,List<String>>>;
typedef RemoveDispatchGaylordState = NetworkRequestState<String>;

typedef SubmitDispatchGaylord = NetworkRequestCubit<String, String>;
typedef SubmitDispatchGaylordState = NetworkRequestState<String>;



@lazySingleton
class DispatchBlocProvider {
  const DispatchBlocProvider(this.repo);

  final DispatchGaylordRepo repo;

  static DispatchBlocProvider get() => $sl.get<DispatchBlocProvider>();

  DispatchCubit fetchGaylords() => DispatchCubit(
        requestInitial: (params, state) =>
            repo.getGaylords(1, params!.status, params.query),
        requestMore: (params, state) => repo.getGaylords(
          state.curLength + 1,
          params!.status,
          params.query,
        ),
      );

  GaylordItemLines fetchGaylordItems() => GaylordItemLines(
        onRequest: (params, __) => repo.getGaylordItems(params!),
      );

  UpdateDispatchGaylord updateGaylord() => UpdateDispatchGaylord(
        onRequest: (params, state) =>
            repo.updateDispatchGaylord(params!.first, params.second),
      );
  RemoveDispatchGaylord removeGaylord() => RemoveDispatchGaylord(
    onRequest:(params, state) =>repo.removeDispatchGaylord(params!.first, params.second));

  SubmitDispatchGaylord submitGaylord() => SubmitDispatchGaylord(
    onRequest: (params, state) => repo.submitDispatchGaylord(params!),);
}
