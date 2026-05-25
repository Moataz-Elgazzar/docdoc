import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: "data")
  final List<SpecializationData> specializationDataList;

  SpecializationResponseModel({required this.specializationDataList});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) => _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  final int id;
  final String name;
  @JsonKey(name: "doctors")
  final List<Doctors> doctorList;

  SpecializationData({required this.id, required this.name, required this.doctorList});

  factory SpecializationData.fromJson(Map<String, dynamic> json) => _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class Doctors {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String degree;
  @JsonKey(name: "appoint_price")
  final int price;
  @JsonKey(name: "start_time")
  final String startTime;
  @JsonKey(name: "end_time")
  final String endTime;
  final Cities city;

  Doctors({required this.id, required this.address, required this.name, required this.city, required this.degree, required this.email, required this.endTime, required this.gender, required this.phone, required this.photo, required this.price, required this.startTime});

  factory Doctors.fromJson(Map<String, dynamic> json) => _$DoctorsFromJson(json);
}

@JsonSerializable()
class Cities {
  final int id;
  final String name;
  final Governrate governrate;

  Cities({required this.governrate, required this.id, required this.name});

  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);
}

@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({required this.id, required this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) => _$GovernrateFromJson(json);
}
