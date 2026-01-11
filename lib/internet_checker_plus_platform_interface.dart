import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'internet_checker_plus_method_channel.dart';

abstract class InternetCheckerPlusPlatform extends PlatformInterface {
  /// Constructs a InternetCheckerPlusPlatform.
  InternetCheckerPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static InternetCheckerPlusPlatform _instance = MethodChannelInternetCheckerPlus();

  /// The default instance of [InternetCheckerPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelInternetCheckerPlus].
  static InternetCheckerPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InternetCheckerPlusPlatform] when
  /// they register themselves.
  static set instance(InternetCheckerPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
