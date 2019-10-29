// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectDetails _$SubjectDetailsFromJson(Map json) {
  return SubjectDetails(
    subjectIdType:
        _$enumDecodeNullable(_$SubjectIdTypeEnumEnumMap, json['subjectIdType']),
    nationality: json['nationality'] as String,
    aadhaarNumber: json['aadhaarNumber'] as String,
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

  writeNotNull(
      'subjectIdType', _$SubjectIdTypeEnumEnumMap[instance.subjectIdType]);
  writeNotNull('nationality', instance.nationality);
  writeNotNull('aadhaarNumber', instance.aadhaarNumber);
  writeNotNull('name', instance.name);
  writeNotNull('gender', instance.gender);
  writeNotNull('age', instance.age);
  writeNotNull('is18Plus', instance.is18Plus);
  writeNotNull('dateOfBirth', instance.dateOfBirth?.toIso8601String());
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SubjectIdTypeEnumEnumMap = {
  SubjectIdTypeEnum.IN_AADHAAR: 'IN_AADHAAR',
};
