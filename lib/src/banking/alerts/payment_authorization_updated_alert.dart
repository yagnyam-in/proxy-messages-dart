import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_authorization_updated_alert.g.dart';

@JsonSerializable()
class PaymentAuthorizationUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.payments.PaymentAuthorizationUpdatedAlert";

  @JsonKey(nullable: false)
  final ProxyAccountId payerAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final String paymentAuthorizationId;

  @JsonKey(nullable: false)
  final List<ProxyId> receivers;

  PaymentAuthorizationUpdatedAlert({
    @required this.alertId,
    @required this.payerAccountId,
    @required this.paymentAuthorizationId,
    @required this.receivers,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
    assertNotEmpty(paymentAuthorizationId);
    assertValidProxyObjectList(receivers);
    assertValidProxyObject(payerAccountId);
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  bool isValid() {
    return isNotEmpty(alertId) &&
        isNotEmpty(paymentAuthorizationId) &&
        isValidProxyObjectList(receivers) &&
        isValidProxyObject(payerAccountId);
  }

  @override
  String get messageType => ALERT_TYPE;

  @override
  String get proxyUniverse => payerAccountId.proxyUniverse;

  @override
  String toReadableString() {
    return null;
  }

  static PaymentAuthorizationUpdatedAlert fromJson(Map json) => _$PaymentAuthorizationUpdatedAlertFromJson(json);

  static SignedMessage<PaymentAuthorizationUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<PaymentAuthorizationUpdatedAlert> signedMessage =
        SignedMessage.fromJson<PaymentAuthorizationUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentAuthorizationUpdatedAlertToJson(this);
}
