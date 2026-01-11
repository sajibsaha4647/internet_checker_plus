import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'internet_checker_plus_platform_interface.dart';

/// An implementation of [InternetCheckerPlusPlatform] that uses method channels.
class MethodChannelInternetCheckerPlus extends InternetCheckerPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('internet_checker_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
