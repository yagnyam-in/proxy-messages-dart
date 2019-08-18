import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_encashment_updated_alert.g.dart';

@JsonSerializable()
class PaymentEncashmentUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.payments.PaymentEncashmentUpdatedAlert";

  @JsonKey(nullable: false)
  final ProxyAccountId payerAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final String paymentAuthorizationId;

  @JsonKey(nullable: false)
  final String paymentEncashmentId;

  @JsonKey(nullable: false)
  final List<ProxyId> receivers;

  PaymentEncashmentUpdatedAlert({
    @required this.alertId,
    @required this.payerAccountId,
    @required this.paymentAuthorizationId,
    @required this.paymentEncashmentId,
    @required this.receivers,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
    assertNotEmpty(paymentAuthorizationId);
    assertNotEmpty(paymentEncashmentId);
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
        isNotEmpty(paymentEncashmentId) &&
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

  static PaymentEncashmentUpdatedAlert fromJson(Map json) => _$PaymentEncashmentUpdatedAlertFromJson(json);

  static SignedMessage<PaymentEncashmentUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<PaymentEncashmentUpdatedAlert> signedMessage =
        SignedMessage.fromJson<PaymentEncashmentUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentEncashmentUpdatedAlertToJson(this);
}
