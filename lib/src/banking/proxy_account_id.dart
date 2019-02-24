import 'package:json_annotation/json_annotation.dart';
import 'package:proxy_core/core.dart';

part 'proxy_account_id.g.dart';

@JsonSerializable()
class ProxyAccountId extends ProxyBaseObject with ProxyUtils {

  @JsonKey(nullable: false)
  final String accountId;

  @JsonKey(nullable: false)
  final String bankId;

  ProxyAccountId(this.accountId, [this.bankId = null])
      : assert(isNotEmpty(accountId)),
        assert(isNotEmpty(bankId));

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! ProxyAccountId) {
      return false;
    }
    ProxyAccountId otherProxyAccountId = other as ProxyAccountId;
    return accountId == otherProxyAccountId.accountId && bankId == otherProxyAccountId.bankId;
  }

  String toString() {
    return toJson().toString();
  }

  @override
  bool isValid() {
    return isValidId(accountId) && isValidId(bankId);
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory ProxyAccountId.fromJson(Map<String, dynamic> json) => _$ProxyAccountIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProxyAccountIdToJson(this);
}
