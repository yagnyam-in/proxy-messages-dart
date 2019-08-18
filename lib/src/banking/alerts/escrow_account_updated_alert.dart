import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/escrow.dart';

part 'escrow_account_updated_alert.g.dart';

@JsonSerializable()
class EscorwAccountUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.escrow.alerts.EscorwAccountUpdatedAlert";

  @JsonKey(nullable: false)
  final EscrowAccountId escrowAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final List<ProxyId> receivers;

  EscorwAccountUpdatedAlert({
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

  static EscorwAccountUpdatedAlert fromJson(Map json) => _$EscorwAccountUpdatedAlertFromJson(json);

  static SignedMessage<EscorwAccountUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<EscorwAccountUpdatedAlert> signedMessage = SignedMessage.fromJson<EscorwAccountUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EscorwAccountUpdatedAlertToJson(this);

}
