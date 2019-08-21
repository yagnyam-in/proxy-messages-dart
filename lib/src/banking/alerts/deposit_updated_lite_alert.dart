import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class DepositUpdatedLiteAlert extends LiteAlert {
  final String depositId;

  final ProxyAccountId proxyAccountId;

  DepositUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.depositId,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: DepositUpdatedAlert.ALERT_TYPE,
          proxyUniverse: proxyUniverse,
          receiverProxyId: receiverProxyId,
        );

  factory DepositUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    return DepositUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      depositId: map[DepositUpdatedAlert.FIELD_DEPOSIT_ID],
      proxyAccountId: ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
        accountId: map[DepositUpdatedAlert.FIELD_ACCOUNT_ID],
        bankProxyId: ProxyId.fromUniqueId(map[DepositUpdatedAlert.FIELD_BANK_PROXY_ID]),
      ),
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
