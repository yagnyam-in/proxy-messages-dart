import 'package:proxy_messages/registration.dart';
import "package:test/test.dart";
import 'dart:convert';

main() {
  test('ProxyCreationResponse.isValid', (){
    expect(ProxyCreationResponse.nonSafe().isValid(), false);
  });
}