import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/gate_registration/data/gate_registration_repo.dart';
import 'package:aashirwad/features/gate_registration/model/employee_details_form.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';
import 'package:injectable/injectable.dart';

typedef GateRegistrationsCubit = InfiniteListCubit<GateRegistrationForm, PageListFilters?,PageListFilters? >;
typedef GateRegistrationsCubitState = InfiniteListState<GateRegistrationForm>;

typedef EmployeeList = NetworkRequestCubit<List<EmployeeDetailsForm>, None>;
typedef EmployeeListState = NetworkRequestState<List<EmployeeDetailsForm>>;




@lazySingleton
class GateRegistrationBlocProvider {
  const GateRegistrationBlocProvider(this.repo);

  final GateRegistrationRepo repo;

  static GateRegistrationBlocProvider get() => $sl.get<GateRegistrationBlocProvider>();

  GateRegistrationsCubit createGateRegistrationsCubit() => GateRegistrationsCubit(
    requestInitial: (params, state) => repo.fetchRegistrations(params!, 0, 20),
    requestMore: (params, state) => repo.fetchRegistrations(params!, state.curLength + 1, state.curLength + 20),
  );

  EmployeeList employeeList() => EmployeeList(
    onRequest: (_, state) => repo.fetchEmployees(),
  );

 
 
}