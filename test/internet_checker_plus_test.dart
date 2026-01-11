import 'package:flutter_test/flutter_test.dart';
import 'package:internet_checker_plus/internet_checker_plus.dart';
import 'package:internet_checker_plus/internet_checker_plus_platform_interface.dart';
import 'package:internet_checker_plus/internet_checker_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInternetCheckerPlusPlatform
    with MockPlatformInterfaceMixin
    implements InternetCheckerPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InternetCheckerPlusPlatform initialPlatform = InternetCheckerPlusPlatform.instance;

  test('$MethodChannelInternetCheckerPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInternetCheckerPlus>());
  });

  test('getPlatformVersion', () async {
    InternetCheckerPlus internetCheckerPlusPlugin = InternetCheckerPlus();
    MockInternetCheckerPlusPlatform fakePlatform = MockInternetCheckerPlusPlatform();
    InternetCheckerPlusPlatform.instance = fakePlatform;

    expect(await internetCheckerPlusPlugin.getPlatformVersion(), '42');
  });
}
