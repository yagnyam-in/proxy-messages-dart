import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'money_sack_id.g.dart';

@JsonSerializable()
class MoneySackId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String id;

  @JsonKey(nullable: false)
  final ProxyId sackProviderProxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  MoneySackId({@required this.id, @required this.sackProviderProxyId, @required this.proxyUniverse}) {
    assertValid();
  }

  String get bankId => sackProviderProxyId?.id;

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! MoneySackId) {
      return false;
    }
    MoneySackId otherMoneySackId = other as MoneySackId;
    return id == otherMoneySackId.id && sackProviderProxyId == otherMoneySackId.sackProviderProxyId;
  }

  String toString() {
    return "MoneySackId(id: $id, provider: $sackProviderProxyId, proxyUniverse: $proxyUniverse)";
  }

  @override
  bool isValid() {
    return isValidId(id) && isValidProxyId(sackProviderProxyId) && isValidId(proxyUniverse);
  }

  @override
  void assertValid() {
    assert(isValidId(id), "Invalid id $id");
    assert(isValidProxyId(sackProviderProxyId), "Invalid sackProviderProxyId $sackProviderProxyId");
    assert(isValidId(proxyUniverse), "Invalid proxyUniverse $proxyUniverse");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory MoneySackId.fromJson(Map json) => _$MoneySackIdFromJson(json);

  Map<String, dynamic> toJson() => _$MoneySackIdToJson(this);
}
