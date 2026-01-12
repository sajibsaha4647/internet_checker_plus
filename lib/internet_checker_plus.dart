import 'dart:async';
import 'dart:io';

import 'internet_level.dart';


class InternetCheckerPlus {
  static const _host = 'google.com';
  static const _port = 443;

  /// One-time check
  static Future<InternetLevel> check() async {
    final hasInternet = await _checkDns();
    if (!hasInternet) return InternetLevel.offline;

    final latencies = <int>[];
    for (int i = 0; i < 3; i++) {
      latencies.add(await _ping());
    }

    final avgLatency =
        latencies.reduce((a, b) => a + b) ~/ latencies.length;
    final jitter = _calculateJitter(latencies);

    return _decideLevel(
      avgLatency: avgLatency,
      jitter: jitter,
    );
  }

  /// Continuous monitoring
  static Stream<InternetLevel> onStatusChange({
    Duration interval = const Duration(seconds: 5),
  }) async* {
    while (true) {
      yield await check();
      await Future.delayed(interval);
    }
  }

  // ---------------- PRIVATE ----------------

  static Future<bool> _checkDns() async {
    try {
      final result = await InternetAddress.lookup(_host)
          .timeout(const Duration(seconds: 3));
      return result.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Future<int> _ping() async {
    final sw = Stopwatch()..start();
    try {
      final socket = await Socket.connect(
        _host,
        _port,
        timeout: const Duration(seconds: 2),
      );
      socket.destroy();
      sw.stop();
      return sw.elapsedMilliseconds;
    } catch (_) {
      return 2000;
    }
  }

  static int _calculateJitter(List<int> values) {
    final avg =
        values.reduce((a, b) => a + b) ~/ values.length;
    return values
        .map((v) => (v - avg).abs())
        .reduce((a, b) => a + b) ~/
        values.length;
  }

  static InternetLevel _decideLevel({
    required int avgLatency,
    required int jitter,
  }) {
    if (avgLatency > 1500 || jitter > 700) {
      return InternetLevel.poor;
    }

    if (avgLatency > 900 || jitter > 400) {
      return InternetLevel.unstable;
    }

    if (avgLatency > 400 || jitter > 200) {
      return InternetLevel.warn;
    }

    return InternetLevel.stable;
  }
}
