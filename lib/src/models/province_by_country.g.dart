// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_by_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceByCountry _$ProvinceByCountryFromJson(Map<String, dynamic> json) {
  return ProvinceByCountry(
    json['id'] as String,
    json['csgp_code'] as String,
    json['description'] as String,
    json['region_code'] as String,
    json['province_code'] as String,
    json['city_code'] as String,
    json['country_code'] as String,
  );
}

Map<String, dynamic> _$ProvinceByCountryToJson(ProvinceByCountry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'csgp_code': instance.csgpCode,
      'description': instance.description,
      'region_code': instance.regionCode,
      'province_code': instance.provinceCode,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
    };
