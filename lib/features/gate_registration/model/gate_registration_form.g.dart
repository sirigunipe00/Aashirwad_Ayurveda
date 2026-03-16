// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_registration_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateRegistrationFormImpl _$$GateRegistrationFormImplFromJson(
        Map<String, dynamic> json) =>
    _$GateRegistrationFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      visitorName: json['visitor_name'] as String?,
      contactperson: json['contact_person'] as String?,
      contactpersonName: json['contact_person_name'] as String?,
      signature: json['created_by'] as String?,
      phoneNo: json['phone_number'] as String?,
      visitingDate: json['created_date'] as String?,
      timeIn: json['time_in'] as String?,
      timeOut: json['time_out'] as String?,
      others: (json['others'] as num?)?.toInt(),
      govtIdUrl: json['government_issued_id'] as String?,
      govtIdImage: toNull(json['govtIdImage']),
      address1: json['address_line_1'] as String?,
      address2: json['address_line_2'] as String?,
      citytown: json['citytown'] as String?,
      states: json['state'] as String?,
      country: json['country'] as String?,
      vehicleNo: json['arrival_modevehicle_no'] as String?,
      purpose: json['purpose_of_visit'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$GateRegistrationFormImplToJson(
        _$GateRegistrationFormImpl instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      'visitor_name': instance.visitorName,
      'contact_person': instance.contactperson,
      'contact_person_name': instance.contactpersonName,
      'created_by': instance.signature,
      'phone_number': instance.phoneNo,
      'created_date': instance.visitingDate,
      'time_in': instance.timeIn,
      'time_out': instance.timeOut,
      'others': instance.others,
      'address_line_1': instance.address1,
      'address_line_2': instance.address2,
      'citytown': instance.citytown,
      'state': instance.states,
      'country': instance.country,
      'arrival_modevehicle_no': instance.vehicleNo,
      'purpose_of_visit': instance.purpose,
      'remarks': instance.remarks,
    };
