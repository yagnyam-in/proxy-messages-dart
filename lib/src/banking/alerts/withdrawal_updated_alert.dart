import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class WithdrawalUpdatedAlert extends Alert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.banking.alerts.WithdrawalUpdatedAlert";

  final String withdrawalId;

  final ProxyAccountId proxyAccountId;

  WithdrawalUpdatedAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required this.withdrawalId,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: ALERT_TYPE,
          proxyUniverse: proxyUniverse,
        );

  factory WithdrawalUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      accountId: map['accountId'],
      bankProxyId: ProxyId.fromUniqueId(map['bankProxyId']),
    );
    return WithdrawalUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      withdrawalId: map['withdrawalId'],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
