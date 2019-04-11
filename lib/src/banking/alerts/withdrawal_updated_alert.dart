import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class WithdrawalUpdatedAlert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.WithdrawalUpdatedAlert";

  final String alertId;

  final String proxyUniverse;

  final String withdrawalId;

  final ProxyAccountId proxyAccountId;

  WithdrawalUpdatedAlert({
    @required this.alertId,
    @required this.proxyUniverse,
    @required this.withdrawalId,
    @required this.proxyAccountId,
  });

  factory WithdrawalUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE], accountId: map['accountId'], bankId: map['bankId']);
    return WithdrawalUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      withdrawalId: map['withdrawalId'],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
