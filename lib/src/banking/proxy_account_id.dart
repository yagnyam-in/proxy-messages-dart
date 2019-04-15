import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'proxy_account_id.g.dart';

@JsonSerializable()
class ProxyAccountId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String accountId;

  @JsonKey(nullable: false)
  final String bankId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  ProxyAccountId({@required this.accountId, @required String this.bankId, @required this.proxyUniverse}) {
    assertValid();
  }

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! ProxyAccountId) {
      return false;
    }
    ProxyAccountId otherProxyAccountId = other as ProxyAccountId;
    return accountId == otherProxyAccountId.accountId && bankId == otherProxyAccountId.bankId;
  }

  String toString() {
    return "(accountId: $accountId, bankId: $bankId)";
  }

  @override
  bool isValid() {
    return isValidId(accountId) && isValidId(bankId) && isValidId(proxyUniverse);
  }

  @override
  void assertValid() {
    assert(isValidId(accountId), "Invalid accountId $accountId");
    assert(isValidId(bankId), "Invalid bankId $bankId");
    assert(isValidId(proxyUniverse), "Invalid proxyUniverse $proxyUniverse");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory ProxyAccountId.fromJson(Map<String, dynamic> json) => _$ProxyAccountIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProxyAccountIdToJson(this);
}
