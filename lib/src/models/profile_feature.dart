/*
*   Filename    :   profile_feature.dart
*   Purpose     :
*   Created     :   08/10/2019 5:45 PM by Detective Conan
*   Updated     :   08/10/2019 5:45 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'profile_feature.g.dart';

@JsonSerializable()
class ProfileFeatureData {
  final draw;
  final recordsTotal;
  final recordsFiltered;
  final List<ProfileFeature> data;

  ProfileFeatureData(
      this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  factory ProfileFeatureData.fromJson(Map<String, dynamic> json) =>
      _$ProfileFeatureDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileFeatureDataToJson(this);
}

@JsonSerializable()
class ProfileFeature {
  ProfileFeature(this.id, this.branchId, this.name, this.description,
      this.coverPhoto, this.subModulesIds);

  final id;
  @JsonKey(name: "branch_id")
  final branchId;
  final name;
  final description;
  @JsonKey(name: "cover_photo")
  final coverPhoto;
  @JsonKey(name: "sub_modules_ids")
  final subModulesIds;

  factory ProfileFeature.fromJson(Map<String, dynamic> json) =>
      _$ProfileFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileFeatureToJson(this);
}
