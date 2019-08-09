// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    json['id'] as String,
    json['name'] as String,
    json['country_code'] as String,
    json['landline_format'] as String,
    json['mobile_format'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'country_code': instance.countryCode,
      'landline_format': instance.landlineFormat,
      'mobile_format': instance.mobileFormat,
    };
