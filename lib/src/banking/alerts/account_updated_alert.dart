import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/alerts/account_updated_lite_alert.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'account_updated_alert.g.dart';

@JsonSerializable()
class AccountUpdatedAlert extends SignableAlertMessage with ProxyUtils {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.AccountUpdatedAlert";
  static const FIELD_ACCOUNT_ID = "accountId";
  static const FIELD_BANK_PROXY_ID = "bankProxyId";

  @JsonKey(nullable: false)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: false)
  final String alertId;

  @JsonKey(nullable: false)
  final ProxyId receiverId;

  AccountUpdatedAlert({
    @required this.alertId,
    @required this.proxyAccountId,
    @required this.receiverId,
  });

  @override
  void assertValid() {
    assertNotEmpty(alertId);
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
    return isNotEmpty(alertId) && isValidProxyId(receiverId) && isValidProxyObject(proxyAccountId);
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

  static AccountUpdatedAlert fromJson(Map json) => _$AccountUpdatedAlertFromJson(json);

  static SignedMessage<AccountUpdatedAlert> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AccountUpdatedAlert> signedMessage = SignedMessage.fromJson<AccountUpdatedAlert>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$AccountUpdatedAlertToJson(this);

  AccountUpdatedLiteAlert toLiteAlert(ProxyId receiverProxyId) {
    return AccountUpdatedLiteAlert(
      proxyUniverse: proxyUniverse,
      alertId: alertId,
      proxyAccountId: proxyAccountId,
      receiverProxyId: receiverProxyId,
    );
  }
}
