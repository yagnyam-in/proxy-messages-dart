import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class DepositUpdatedAlert extends Alert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.DepositUpdatedAlert";

  final String depositId;

  final ProxyAccountId proxyAccountId;

  DepositUpdatedAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required this.depositId,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: ALERT_TYPE,
          proxyUniverse: proxyUniverse,
        );

  factory DepositUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      accountId: map['accountId'],
      bankProxyId: ProxyId.fromUniqueId(map['bankProxyId']),
    );
    return DepositUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      depositId: map['depositId'],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
