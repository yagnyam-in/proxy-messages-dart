import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payee.g.dart';

enum PayeeTypeEnum {
  ProxyId,
  Email,
  Phone,
  AnyoneWithSecret
}

@JsonSerializable()
class Payee extends ProxyBaseObject with ProxyUtils {

  @JsonKey(nullable: false)
  String paymentEncashmentId;

  @JsonKey(nullable: false)
  final PayeeTypeEnum payeeType;

  @JsonKey(nullable: true)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: true)
  final ProxyId proxyId;

  @JsonKey(nullable: true)
  final String emailHash;

  @JsonKey(nullable: true)
  final String phoneHash;

  @JsonKey(nullable: true)
  final String secretHash;

  Payee({
    @required this.paymentEncashmentId,
    @required this.payeeType,
    this.proxyAccountId,
    this.proxyId,
    this.emailHash,
    this.phoneHash,
    this.secretHash,
  });

  @override
  void assertValid() {
    assert(paymentEncashmentId != null);
    assert(payeeType != null);
    assert(isValid());
  }

  @override
  bool isValid() {
    if (payeeType == null) {
      return false;
    }
    if (isEmpty(paymentEncashmentId)) {
      return false;
    }
    switch (payeeType) {
      case PayeeTypeEnum.ProxyId:
        return proxyId != null && proxyId.isValid();
      case PayeeTypeEnum.Email:
        return isNotEmpty(emailHash) && isNotEmpty(secretHash);
      case PayeeTypeEnum.Phone:
        return isNotEmpty(phoneHash) && isNotEmpty(secretHash);
      case PayeeTypeEnum.AnyoneWithSecret:
        return isNotEmpty(secretHash);
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
