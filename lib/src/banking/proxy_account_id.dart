import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'proxy_account_id.g.dart';

@JsonSerializable()
class ProxyAccountId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String accountId;

  @JsonKey(nullable: false)
  final ProxyId bankProxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  ProxyAccountId({@required this.accountId, @required this.bankProxyId, @required this.proxyUniverse}) {
    assertValid();
  }

  String get bankId => bankProxyId?.id;

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! ProxyAccountId) {
      return false;
    }
    ProxyAccountId otherProxyAccountId = other as ProxyAccountId;
    return accountId == otherProxyAccountId.accountId && bankProxyId == otherProxyAccountId.bankProxyId;
  }

  String toString() {
    return "(accountId: $accountId, bankProxyId: $bankProxyId)";
  }

  @override
  bool isValid() {
    return isValidId(accountId) && isValidProxyId(bankProxyId) && isValidId(proxyUniverse);
  }

  @override
  void assertValid() {
    assert(isValidId(accountId), "Invalid accountId $accountId");
    assert(isValidProxyId(bankProxyId), "Invalid bankProxyId $bankProxyId");
    assert(isValidId(proxyUniverse), "Invalid proxyUniverse $proxyUniverse");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory ProxyAccountId.fromJson(Map json) => _$ProxyAccountIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProxyAccountIdToJson(this);
}
