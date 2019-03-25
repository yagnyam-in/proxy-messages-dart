import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class AccountUpdatedAlert {
  static const ALERT_TYPE =
      "in.yagnyam.proxy.messages.banking.alerts.AccountUpdatedAlert";

  final String alertId;

  final ProxyAccountId proxyAccountId;

  AccountUpdatedAlert({
    @required this.proxyAccountId,
    @required this.alertId,
  });

  factory AccountUpdatedAlert.fromJson(Map<String, dynamic> map) {
    ProxyAccountId proxyAccountId =
        ProxyAccountId(accountId: map['accountId'], bankId: map['bankId']);
    return AccountUpdatedAlert(
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
