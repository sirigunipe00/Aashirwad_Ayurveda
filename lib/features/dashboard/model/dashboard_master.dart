import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_master.freezed.dart';
part 'dashboard_master.g.dart';

@freezed
class DashboardMaster with _$DashboardMaster {
  const factory DashboardMaster({
    required String name,
    required String title,
    @JsonKey(name: 'is_favourite', defaultValue: false)
    required bool isFavourite,
    @JsonKey(name: 'charts_count') required int count,
    @JsonKey(name: 'modified') required String time,
    @JsonKey(name: 'view_count') required int viewCount,
  }) = _DashboardMaster;

  factory DashboardMaster.fromJson(Map<String, dynamic> json) =>
      _$DashboardMasterFromJson(json);
}
