import 'package:proxy_messages/registration.dart';
import "package:test/test.dart";
import 'dart:convert';

main() {
  test('ProxyCreationRequest.isValid', (){
    expect(ProxyCreationRequest.nonSafe().isValid(), false);
  });
}