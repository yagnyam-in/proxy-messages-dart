// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_service_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityServiceProvider _$IdentityServiceProviderFromJson(Map json) {
  return IdentityServiceProvider(
    proxyId: ProxyId.fromJson(json['proxyId'] as Map),
    proxyUniverse: json['proxyUniverse'] as String,
    supportedSubjectTypes: (json['supportedSubjectTypes'] as List)
        .map((e) => _$enumDecode(_$SubjectIdTypeEnumEnumMap, e))
        .toList(),
    apiEndpoint: json['apiEndpoint'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$IdentityServiceProviderToJson(
        IdentityServiceProvider instance) =>
    <String, dynamic>{
      'proxyId': instance.proxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse,
      'supportedSubjectTypes': instance.supportedSubjectTypes
          .map((e) => _$SubjectIdTypeEnumEnumMap[e])
          .toList(),
      'apiEndpoint': instance.apiEndpoint,
      'name': instance.name,
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
