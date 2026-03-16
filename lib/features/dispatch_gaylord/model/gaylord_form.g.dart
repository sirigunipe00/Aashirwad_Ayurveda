// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gaylord_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GaylordFormImpl _$$GaylordFormImplFromJson(Map<String, dynamic> json) =>
    _$GaylordFormImpl(
      status: json['status'] as String,
      name: json['name'] as String,
      currentDate: json['posting_date'] as String,
      time: json['posting_time'] as String,
      customer: json['customer'] as String,
      customerName: json['customer_name'] as String,
    );

Map<String, dynamic> _$$GaylordFormImplToJson(_$GaylordFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'posting_date': instance.currentDate,
      'posting_time': instance.time,
      'customer': instance.customer,
      'customer_name': instance.customerName,
    };
