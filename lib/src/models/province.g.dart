// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    json['id'] as String,
    json['psgc_code'] as String,
    json['name'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'psgc_code': instance.psgcCode,
      'name': instance.name,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'country_code': instance.countryCode,
    };
