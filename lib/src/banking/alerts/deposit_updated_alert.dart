import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'deposit_updated_alert.g.dart';

@JsonSerializable()
class DepositUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.DepositUpdatedAlert";
  static const FIELD_DEPOSIT_ID = "depositId";
  static const FIELD_ACCOUNT_ID = "accountId";
  static const FIELD_BANK_PROXY_ID = "bankProxyId";

  @JsonKey(nullable: false)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final String depositId;

  @JsonKey(nullable: false)
  final ProxyId receiverId;

  DepositUpdatedAlert({
    @required this.alertId,
    @required this.proxyAccountId,
    @required this.depositId,
    @required this.receiverId,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
    assertNotEmpty(depositId);
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
    return isNotEmpty(alertId) && isNotEmpty(depositId) && isValidProxyId(receiverId) && isValidProxyObject(proxyAccountId);
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

  static DepositUpdatedAlert fromJson(Map json) => _$DepositUpdatedAlertFromJson(json);

  static SignedMessage<DepositUpdatedAlert> signedMessageFromJson(Map json) {
    SignedMessage<DepositUpdatedAlert> signedMessage = SignedMessage.fromJson<DepositUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositUpdatedAlertToJson(this);

}
