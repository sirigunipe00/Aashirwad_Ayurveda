import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/features/gate_registration/model/employee_details_form.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';

abstract interface class 
GateRegistrationRepo {
 AsyncValueOf<List<GateRegistrationForm>> fetchRegistrations(PageListFilters filters, int start, int end);
 AsyncValueOf<List<EmployeeDetailsForm>> fetchEmployees();
  AsyncValueOf<Pair<String, String>> createGateRegistration(GateRegistrationForm form);
  AsyncValueOf<Pair<String, String>> submitGateRegistration(GateRegistrationForm form);

}
