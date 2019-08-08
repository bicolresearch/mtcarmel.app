// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_by_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityByProvince _$CityByProvinceFromJson(Map<String, dynamic> json) {
  return CityByProvince(
    json['id'] as String,
    json['psgc_code'] as String,
    json['description'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['city_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$CityByProvinceToJson(CityByProvince instance) =>
    <String, dynamic>{
      'id': instance.id,
      'psgc_code': instance.psgcCode,
      'description': instance.description,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
    };
