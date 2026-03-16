// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardMasterImpl _$$DashboardMasterImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardMasterImpl(
      name: json['name'] as String,
      title: json['title'] as String,
      isFavourite: json['is_favourite'] as bool? ?? false,
      count: (json['charts_count'] as num).toInt(),
      time: json['modified'] as String,
      viewCount: (json['view_count'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardMasterImplToJson(
        _$DashboardMasterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'is_favourite': instance.isFavourite,
      'charts_count': instance.count,
      'modified': instance.time,
      'view_count': instance.viewCount,
    };
