import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payee.g.dart';

enum PayeeTypeEnum {
  ProxyAccountId,
  ProxyId,
  Email,
  Phone,
  AnyoneWithSecret
}

@JsonSerializable()
class Payee extends ProxyBaseObject with ProxyUtils {

  @JsonKey(nullable: false)
  final PayeeTypeEnum payeeType;

  @JsonKey(nullable: true)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: true)
  final ProxyId proxyId;

  @JsonKey(nullable: true)
  final String email;

  @JsonKey(nullable: true)
  final String phone;

  @JsonKey(nullable: true)
  final String ivPrefixedSecretHash;

  Payee({
    @required this.payeeType,
    this.proxyAccountId,
    this.proxyId,
    this.email,
    this.phone,
    this.ivPrefixedSecretHash,
  });

  @override
  void assertValid() {
    assert(payeeType != null);
    assert(isValid());
  }

  @override
  bool isValid() {
    if (payeeType == null) {
      return false;
    }
    switch (payeeType) {
      case PayeeTypeEnum.ProxyAccountId:
        return proxyAccountId != null && proxyAccountId.isValid() && proxyId != null && proxyId.isValid();
      case PayeeTypeEnum.ProxyId:
        return proxyId != null && proxyId.isValid();
      case PayeeTypeEnum.Email:
        return isNotEmpty(email) && isNotEmpty(ivPrefixedSecretHash);
      case PayeeTypeEnum.Phone:
        return isNotEmpty(phone) && isNotEmpty(ivPrefixedSecretHash);
      case PayeeTypeEnum.AnyoneWithSecret:
        return isNotEmpty(ivPrefixedSecretHash);
      default:
        return false;
    }
  }

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$PayeeToJson(this);

  factory Payee.fromJson(Map<String, dynamic> json) =>
      _$PayeeFromJson(json);
}
