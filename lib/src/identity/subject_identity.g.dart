// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectIdentity _$SubjectIdentityFromJson(Map json) {
  return SubjectIdentity(
    identityProviderProxyId:
        ProxyId.fromJson(json['identityProviderProxyId'] as Map),
    subjectIdType:
        _$enumDecode(_$SubjectIdTypeEnumEnumMap, json['subjectIdType']),
    subjectId: json['subjectId'] as String,
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
    subjectDetails: SubjectDetails.fromJson(json['subjectDetails'] as Map),
  );
}

Map<String, dynamic> _$SubjectIdentityToJson(SubjectIdentity instance) =>
    <String, dynamic>{
      'identityProviderProxyId': instance.identityProviderProxyId.toJson(),
      'subjectIdType': _$SubjectIdTypeEnumEnumMap[instance.subjectIdType],
      'subjectId': instance.subjectId,
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'subjectDetails': instance.subjectDetails.toJson(),
    };

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

const _$SubjectIdTypeEnumEnumMap = {
  SubjectIdTypeEnum.IN_AADHAAR: 'IN_AADHAAR',
};
