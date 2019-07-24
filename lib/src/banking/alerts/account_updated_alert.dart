import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class AccountUpdatedAlert extends Alert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.AccountUpdatedAlert";

  final ProxyAccountId proxyAccountId;

  AccountUpdatedAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: ALERT_TYPE,
          proxyUniverse: proxyUniverse,
        );

  factory AccountUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      accountId: map['accountId'],
      bankId: map['bankId'],
    );
    return AccountUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
