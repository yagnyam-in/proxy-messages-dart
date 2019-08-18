import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/escrow.dart';

part 'escrow_account_updated_alert.g.dart';

@JsonSerializable()
class EscrowAccountUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.escrow.alerts.EscrowAccountUpdatedAlert";

  @JsonKey(nullable: false)
  final EscrowAccountId escrowAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final List<ProxyId> receivers;

  EscrowAccountUpdatedAlert({
    @required this.alertId,
    @required this.escrowAccountId,
    @required this.receivers,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
    assertValidProxyObjectList(receivers);
    assertValidProxyObject(escrowAccountId);
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
    return isNotEmpty(alertId) && isValidProxyObjectList(receivers) && isValidProxyObject(escrowAccountId);
  }

  @override
  String get messageType => ALERT_TYPE;

  @override
  String get proxyUniverse => escrowAccountId.proxyUniverse;


  @override
  String toReadableString() {
    return null;
  }

  static EscrowAccountUpdatedAlert fromJson(Map json) => _$EscrowAccountUpdatedAlertFromJson(json);

  static SignedMessage<EscrowAccountUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountUpdatedAlert> signedMessage = SignedMessage.fromJson<EscrowAccountUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountUpdatedAlertToJson(this);

}
