
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gaylord_form.freezed.dart';
part 'gaylord_form.g.dart';

@freezed
class GaylordForm with _$GaylordForm {
  factory GaylordForm({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'posting_date') required String currentDate,
    @JsonKey(name : 'posting_time') required String time,
    @JsonKey(name: 'customer') required String customer,
    @JsonKey(name: 'customer_name') required String customerName,
  }) = _GaylordForm;

  factory GaylordForm.fromJson(Map<String, Object?> json) =>
      _$GaylordFormFromJson(json);

 
}
