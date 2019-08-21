import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class WithdrawalUpdatedLiteAlert extends LiteAlert {
  final String withdrawalId;

  final ProxyAccountId proxyAccountId;

  WithdrawalUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.withdrawalId,
    @required this.proxyAccountId,
  }) : super(
          alertId: alertId,
          alertType: WithdrawalUpdatedAlert.ALERT_TYPE,
          proxyUniverse: proxyUniverse,
          receiverProxyId: receiverProxyId,
        );

  factory WithdrawalUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId proxyAccountId = ProxyAccountId(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      accountId: map[WithdrawalUpdatedAlert.FIELD_ACCOUNT_ID],
      bankProxyId: ProxyId.fromUniqueId(map[WithdrawalUpdatedAlert.FIELD_BANK_PROXY_ID]),
    );
    return WithdrawalUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      withdrawalId: map[WithdrawalUpdatedAlert.FIELD_WITHDRAWAL_ID],
      proxyAccountId: proxyAccountId,
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
