// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relying_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelyingParty _$RelyingPartyFromJson(Map json) {
  return RelyingParty(
    proxyId: ProxyId.fromJson(json['proxyId'] as Map),
    proxyUniverse: json['proxyUniverse'] as String,
    oneAccountPerSubject: json['oneAccountPerSubject'] as bool,
    mandatoryFields: (json['mandatoryFields'] as List)
        .map((e) => _$enumDecode(_$SubjectFieldEnumEnumMap, e))
        .toList(),
    optionalFields: (json['optionalFields'] as List)
        .map((e) => _$enumDecode(_$SubjectFieldEnumEnumMap, e))
        .toList(),
    apiEndpoint: json['apiEndpoint'] as String,
    name: json['name'] as String,
    identityServiceProviderProxyId:
        ProxyId.fromJson(json['identityServiceProviderProxyId'] as Map),
  );
}

Map<String, dynamic> _$RelyingPartyToJson(RelyingParty instance) =>
    <String, dynamic>{
      'proxyId': instance.proxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse,
      'oneAccountPerSubject': instance.oneAccountPerSubject,
      'mandatoryFields': instance.mandatoryFields
          .map((e) => _$SubjectFieldEnumEnumMap[e])
          .toList(),
      'optionalFields': instance.optionalFields
          .map((e) => _$SubjectFieldEnumEnumMap[e])
          .toList(),
      'apiEndpoint': instance.apiEndpoint,
      'name': instance.name,
      'identityServiceProviderProxyId':
          instance.identityServiceProviderProxyId.toJson(),
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

const _$SubjectFieldEnumEnumMap = {
  SubjectFieldEnum.subjectIdType: 'subjectIdType',
  SubjectFieldEnum.nationality: 'nationality',
  SubjectFieldEnum.aadhaarNumber: 'aadhaarNumber',
  SubjectFieldEnum.name: 'name',
  SubjectFieldEnum.gender: 'gender',
  SubjectFieldEnum.age: 'age',
  SubjectFieldEnum.is18Plus: 'is18Plus',
  SubjectFieldEnum.dateOfBirth: 'dateOfBirth',
};
