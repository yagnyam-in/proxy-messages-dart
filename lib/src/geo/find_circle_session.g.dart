// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_circle_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCircleSession _$FindCircleSessionFromJson(Map json) {
  return FindCircleSession(
    sessionId: FindCircleSessionId.fromJson(json['sessionId'] as Map),
    requesterProxyId: ProxyId.fromJson(json['requesterProxyId'] as Map),
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
    alertLocation: json['alertLocation'] as String,
  );
}

Map<String, dynamic> _$FindCircleSessionToJson(FindCircleSession instance) {
  final val = <String, dynamic>{
    'sessionId': instance.sessionId.toJson(),
    'requesterProxyId': instance.requesterProxyId.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alertLocation', instance.alertLocation);
  val['creationDate'] = instance.creationDate.toIso8601String();
  val['expiryDate'] = instance.expiryDate.toIso8601String();
  return val;
}
