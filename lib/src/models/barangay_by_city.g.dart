// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barangay_by_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarangayByCity _$BarangayByCityFromJson(Map<String, dynamic> json) {
  return BarangayByCity(
    json['id'] as String,
    json['brgy_code'] as String,
    json['description'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['city_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$BarangayByCityToJson(BarangayByCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brgy_code': instance.brgyCode,
      'description': instance.description,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
    };
