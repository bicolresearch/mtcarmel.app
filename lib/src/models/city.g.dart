// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as String,
    json['psgc_code'] as String,
    json['name'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['city_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'psgc_code': instance.psgcCode,
      'name': instance.name,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
    };
