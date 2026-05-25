// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecializationResponseModel(
  specializationDataList: (json['data'] as List<dynamic>)
      .map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecializationResponseModelToJson(
  SpecializationResponseModel instance,
) => <String, dynamic>{'data': instance.specializationDataList};

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctorList: (json['doctors'] as List<dynamic>)
          .map((e) => Doctors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctorList,
    };

Doctors _$DoctorsFromJson(Map<String, dynamic> json) => Doctors(
  id: (json['id'] as num).toInt(),
  address: json['address'] as String,
  name: json['name'] as String,
  city: Cities.fromJson(json['city'] as Map<String, dynamic>),
  degree: json['degree'] as String,
  email: json['email'] as String,
  endTime: json['end_time'] as String,
  gender: json['gender'] as String,
  phone: json['phone'] as String,
  photo: json['photo'] as String,
  price: (json['appoint_price'] as num).toInt(),
  startTime: json['start_time'] as String,
);

Map<String, dynamic> _$DoctorsToJson(Doctors instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
  'address': instance.address,
  'degree': instance.degree,
  'appoint_price': instance.price,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'city': instance.city,
};

Cities _$CitiesFromJson(Map<String, dynamic> json) => Cities(
  governrate: Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governrate': instance.governrate,
};

Governrate _$GovernrateFromJson(Map<String, dynamic> json) =>
    Governrate(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GovernrateToJson(Governrate instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
