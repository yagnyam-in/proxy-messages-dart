import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'escrow_account_id.g.dart';

@JsonSerializable()
class EscrowAccountId extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String accountId;

  @JsonKey(nullable: false)
  final String bankId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  EscrowAccountId({@required this.accountId, @required String this.bankId, @required this.proxyUniverse}) {
    assertValid();
  }

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! EscrowAccountId) {
      return false;
    }
    EscrowAccountId otherEscrowAccountId = other as EscrowAccountId;
    return accountId == otherEscrowAccountId.accountId && bankId == otherEscrowAccountId.bankId;
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

  factory EscrowAccountId.fromJson(Map json) => _$EscrowAccountIdFromJson(json);

  Map<String, dynamic> toJson() => _$EscrowAccountIdToJson(this);
}
