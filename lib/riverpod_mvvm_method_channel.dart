import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'riverpod_mvvm_platform_interface.dart';

/// An implementation of [RiverpodMvvmPlatform] that uses method channels.
class MethodChannelRiverpodMvvm extends RiverpodMvvmPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('riverpod_mvvm');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
