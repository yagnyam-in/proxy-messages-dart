// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectDetails _$SubjectDetailsFromJson(Map json) {
  return SubjectDetails(
    nationality: json['nationality'] as String,
    name: json['name'] as String,
    gender: json['gender'] as String,
    age: json['age'] as int,
    is18Plus: json['is18Plus'] as bool,
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
  );
}

Map<String, dynamic> _$SubjectDetailsToJson(SubjectDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nationality', instance.nationality);
  writeNotNull('name', instance.name);
  writeNotNull('gender', instance.gender);
  writeNotNull('age', instance.age);
  writeNotNull('is18Plus', instance.is18Plus);
  writeNotNull('dateOfBirth', instance.dateOfBirth?.toIso8601String());
  return val;
}
