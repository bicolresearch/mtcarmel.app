// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barangay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barangay _$BarangayFromJson(Map<String, dynamic> json) {
  return Barangay(
    json['id'] as String,
    json['brgy_code'] as String,
    json['name'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['city_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$BarangayToJson(Barangay instance) => <String, dynamic>{
      'id': instance.id,
      'brgy_code': instance.brgyCode,
      'name': instance.name,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
    };
