import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'withdrawal_updated_alert.g.dart';

@JsonSerializable()
class WithdrawalUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.WithdrawalUpdatedAlert";

  @JsonKey(nullable: false)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final String withdrawalId;

  @JsonKey(nullable: false)
  final ProxyId receiverId;

  WithdrawalUpdatedAlert({
    @required this.alertId,
    @required this.proxyAccountId,
    @required this.withdrawalId,
    @required this.receiverId,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
    assertNotEmpty(withdrawalId);
    assertValidProxyId(receiverId);
    assertValidProxyObject(proxyAccountId);
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
    return isNotEmpty(alertId) && isNotEmpty(withdrawalId) && isValidProxyId(receiverId) && isValidProxyObject(proxyAccountId);
  }

  @override
  String get messageType => ALERT_TYPE;

  @override
  String get proxyUniverse => proxyAccountId.proxyUniverse;

  @override
  List<ProxyId> get receivers => [receiverId];


  @override
  String toReadableString() {
    return null;
  }

  static WithdrawalUpdatedAlert fromJson(Map json) => _$WithdrawalUpdatedAlertFromJson(json);

  static SignedMessage<WithdrawalUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<WithdrawalUpdatedAlert> signedMessage = SignedMessage.fromJson<WithdrawalUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalUpdatedAlertToJson(this);

}
