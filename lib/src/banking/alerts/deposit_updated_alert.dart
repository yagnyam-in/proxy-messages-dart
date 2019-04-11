import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class DepositUpdatedAlert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.DepositUpdatedAlert";

  final String alertId;

  final String proxyUniverse;

  final String depositId;

  final ProxyAccountId proxyAccountId;

  DepositUpdatedAlert({
    @required this.alertId,
    @required this.proxyUniverse,
    @required this.depositId,
    @required this.proxyAccountId,
  });

  factory DepositUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE], accountId: map['accountId'], bankId: map['bankId']);
    return DepositUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      depositId: map['depositId'],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
