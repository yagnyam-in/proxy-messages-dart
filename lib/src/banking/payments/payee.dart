import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'payee.g.dart';

enum PayeeTypeEnum { ProxyId, Email, Phone, AnyoneWithSecret }

@JsonSerializable()
class Payee extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  String paymentEncashmentId;

  @JsonKey(nullable: false)
  final PayeeTypeEnum payeeType;

  @JsonKey(nullable: true)
  final ProxyId proxyId;

  @JsonKey(nullable: true)
  final HashValue emailHash;

  @JsonKey(nullable: true)
  final HashValue phoneHash;

  @JsonKey(nullable: true)
  final HashValue secretHash;

  Payee({
    @required this.paymentEncashmentId,
    @required this.payeeType,
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
        return isValidProxyObject(proxyId);
      case PayeeTypeEnum.Email:
        return isValidProxyObject(emailHash) && isValidProxyObject(secretHash);
      case PayeeTypeEnum.Phone:
        return isValidProxyObject(phoneHash) && isValidProxyObject(secretHash);
      case PayeeTypeEnum.AnyoneWithSecret:
        return isValidProxyObject(secretHash);
      default:
        return false;
    }
  }

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() => _$PayeeToJson(this);

  factory Payee.fromJson(Map json) => _$PayeeFromJson(json);
}
