import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aashirwad/core/core.dart';

part 'gate_registration_form.freezed.dart';
part 'gate_registration_form.g.dart';

@freezed
class GateRegistrationForm with _$GateRegistrationForm {
  factory GateRegistrationForm({
    @JsonKey(includeToJson: false) String? status,
    @JsonKey(includeToJson: true, includeIfNull: false) String? name,
    @JsonKey(name: 'visitor_name') String? visitorName,
    @JsonKey(name: 'contact_person') String? contactperson,
    @JsonKey(name: 'contact_person_name') String? contactpersonName,
    @JsonKey(name: 'created_by') String? signature,
    @JsonKey(name: 'phone_number') String? phoneNo,
    @JsonKey(name: 'created_date') String? visitingDate,
    @JsonKey(name: 'time_in')  String? timeIn,
    @JsonKey(name: 'time_out') String? timeOut,
    @JsonKey(name: 'others') int? others,
    @JsonKey(name: 'government_issued_id', includeToJson: false)
    String? govtIdUrl,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? govtIdImage,
    @JsonKey(name: 'address_line_1') String? address1,
    @JsonKey(name: 'address_line_2') String? address2,
    @JsonKey(name: 'citytown') String? citytown,
    @JsonKey(name: 'state') String? states,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'arrival_modevehicle_no') String? vehicleNo,
    @JsonKey(name: 'purpose_of_visit') String? purpose,
    @JsonKey(name: 'remarks') String? remarks,
  }) = _GateRegistrationForm;

  factory GateRegistrationForm.fromJson(Map<String, Object?> json) =>
      _$GateRegistrationFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(
      final GateRegistrationForm form) {
    final vehPhoto = form.govtIdImage.isNull
        ? null
        : base64Encode(form.govtIdImage!.readAsBytesSync());
    final json = form.toJson();
    json['government_issued_id'] = vehPhoto;
    return json;
  }
}
