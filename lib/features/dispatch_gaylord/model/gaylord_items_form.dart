
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gaylord_items_form.freezed.dart';
part 'gaylord_items_form.g.dart';

@freezed

class GaylordItemsForm with _$GaylordItemsForm {
  factory GaylordItemsForm({
    @JsonKey(name: 'name')  String? name,
    @JsonKey(name: 'scan_value') String? scanValue,
  }) = _GaylordItemsForm;

  factory GaylordItemsForm.fromJson(Map<String, Object?> json) =>
      _$GaylordItemsFormFromJson(json);

 
}
