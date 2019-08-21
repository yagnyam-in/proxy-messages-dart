import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class AccountUpdatedLiteAlert extends LiteAlert {
  final ProxyAccountId proxyAccountId;

  AccountUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: AccountUpdatedAlert.ALERT_TYPE,
          proxyUniverse: proxyUniverse,
          receiverProxyId: receiverProxyId,
        );

  factory AccountUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    return AccountUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      proxyAccountId: ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
        accountId: map[AccountUpdatedAlert.FIELD_ACCOUNT_ID],
        bankProxyId: ProxyId.fromUniqueId(map[AccountUpdatedAlert.FIELD_BANK_PROXY_ID]),
      ),
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
