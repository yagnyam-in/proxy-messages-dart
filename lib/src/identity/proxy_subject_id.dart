import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'proxy_subject_id.g.dart';

@JsonSerializable()
class ProxySubjectId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String subjectId;

  @JsonKey(nullable: false)
  final ProxyId identityProviderProxyId;

  ProxySubjectId({@required this.subjectId, @required this.identityProviderProxyId}) {
    assertValid();
  }

  String get issuerId => identityProviderProxyId?.id;

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! ProxySubjectId) {
      return false;
    }
    ProxySubjectId otherSubjectId = other as ProxySubjectId;
    return ProxySubjectId == otherSubjectId.subjectId &&
        identityProviderProxyId == otherSubjectId.identityProviderProxyId;
  }

  String toString() {
    return "(subjectId: $subjectId, identityProviderProxyId: $identityProviderProxyId)";
  }

  @override
  bool isValid() {
    return isNotEmpty(subjectId) && isValidProxyId(identityProviderProxyId);
  }

  @override
  void assertValid() {
    assert(isNotEmpty(subjectId), "Invalid subjectId $subjectId");
    assert(isValidProxyId(identityProviderProxyId), "Invalid identityProviderProxyId $identityProviderProxyId");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory ProxySubjectId.fromJson(Map json) => _$ProxySubjectIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProxySubjectIdToJson(this);
}
