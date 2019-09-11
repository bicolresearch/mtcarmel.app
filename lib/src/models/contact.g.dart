// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ContactData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return ContactData(
    json['id'],
    json['name'],
    json['description'],
    json['address1'],
    json['address2'],
    json['city_code'],
    json['province_code'],
    json['country_code'],
    json['landline'],
    json['mobile'],
    json['email'],
    json['dt_created'],
    json['dt_updated'],
    json['city_name'],
    json['province_name'],
    json['country_name'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address1': instance.address1,
      'address2': instance.address2,
      'city_code': instance.cityCode,
      'province_code': instance.provinceCode,
      'country_code': instance.countryCode,
      'landline': instance.landLine,
      'mobile': instance.mobile,
      'email': instance.email,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'city_name': instance.cityName,
      'province_name': instance.provinceName,
      'country_name': instance.countryName,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
