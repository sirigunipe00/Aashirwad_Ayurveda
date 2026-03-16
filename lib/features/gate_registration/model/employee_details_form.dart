
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_details_form.freezed.dart';
part 'employee_details_form.g.dart';

@freezed
class EmployeeDetailsForm with _$EmployeeDetailsForm {
  factory EmployeeDetailsForm({
    @JsonKey(name: 'name')  required String name,
    @JsonKey(name: 'employee_name',defaultValue: '') required String employeeName,
    
  }) = _EmployeeDetailsForm;

  factory EmployeeDetailsForm.fromJson(Map<String, Object?> json) =>
      _$EmployeeDetailsFormFromJson(json);

     static List<String> fields = ['name', 'employee_name',];

  
}
