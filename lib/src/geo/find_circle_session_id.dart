import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'find_circle_session_id.g.dart';

@JsonSerializable()
class FindCircleSessionId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId serviceProviderId;

  @JsonKey(nullable: false)
  final String sessionId;

  FindCircleSessionId({
    @required this.serviceProviderId,
    @required this.sessionId,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyId(serviceProviderId) && isNotEmpty(sessionId);
  }

  @override
  void assertValid() {
    assertValidProxyId(serviceProviderId);
    assertNotEmpty(sessionId);
  }

  static FindCircleSessionId fromJson(Map json) => _$FindCircleSessionIdFromJson(json);

  Map<String, dynamic> toJson() => _$FindCircleSessionIdToJson(this);
}
