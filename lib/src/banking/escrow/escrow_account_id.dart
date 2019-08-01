import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'escrow_account_id.g.dart';

@JsonSerializable()
class EscrowAccountId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String accountId;

  @JsonKey(nullable: false)
  final ProxyId bankProxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  EscrowAccountId({@required this.accountId, @required this.bankProxyId, @required this.proxyUniverse}) {
    assertValid();
  }

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! EscrowAccountId) {
      return false;
    }
    EscrowAccountId otherEscrowAccountId = other as EscrowAccountId;
    return accountId == otherEscrowAccountId.accountId && bankProxyId == otherEscrowAccountId.bankProxyId;
  }

  String toString() {
    return "(accountId: $accountId, bankId: $bankProxyId)";
  }

  @override
  bool isValid() {
    return isValidId(accountId) && isValidProxyId(bankProxyId) && isNotEmpty(proxyUniverse);
  }

  @override
  void assertValid() {
    assert(isValidId(accountId), "Invalid accountId $accountId");
    assertValidProxyId(bankProxyId);
    assert(isNotEmpty(proxyUniverse), "Invalid proxyUniverse $proxyUniverse");
  }

  static bool isValidId(String id) {
    return id != null && ProxyId.ID_REGEX.hasMatch(id);
  }

  factory EscrowAccountId.fromJson(Map json) => _$EscrowAccountIdFromJson(json);

  Map<String, dynamic> toJson() => _$EscrowAccountIdToJson(this);
}
