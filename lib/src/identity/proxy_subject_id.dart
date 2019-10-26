import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'proxy_subject_id.g.dart';

@JsonSerializable()
class ProxySubjectId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String subjectId;

  @JsonKey(nullable: false)
  final ProxyId issuerProxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  ProxySubjectId({@required this.subjectId, @required this.issuerProxyId, @required this.proxyUniverse}) {
    assertValid();
  }

  String get issuerId => issuerProxyId?.id;

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! ProxySubjectId) {
      return false;
    }
    ProxySubjectId otherSubjectId = other as ProxySubjectId;
    return ProxySubjectId == otherSubjectId.subjectId && issuerProxyId == otherSubjectId.issuerProxyId;
  }

  String toString() {
    return "(subjectId: $subjectId, issuerProxyId: $issuerProxyId)";
  }

  @override
  bool isValid() {
    return isValidId(subjectId) && isValidProxyId(issuerProxyId) && isValidId(proxyUniverse);
  }

  @override
  void assertValid() {
    assert(isValidId(subjectId), "Invalid subjectId $subjectId");
    assert(isValidProxyId(issuerProxyId), "Invalid issuerProxyId $issuerProxyId");
    assert(isValidId(proxyUniverse), "Invalid proxyUniverse $proxyUniverse");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory ProxySubjectId.fromJson(Map json) => _$ProxySubjectIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProxySubjectIdToJson(this);
}
