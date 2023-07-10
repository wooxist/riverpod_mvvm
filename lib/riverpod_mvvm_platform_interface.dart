import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'riverpod_mvvm_method_channel.dart';

abstract class RiverpodMvvmPlatform extends PlatformInterface {
  /// Constructs a RiverpodMvvmPlatform.
  RiverpodMvvmPlatform() : super(token: _token);

  static final Object _token = Object();

  static RiverpodMvvmPlatform _instance = MethodChannelRiverpodMvvm();

  /// The default instance of [RiverpodMvvmPlatform] to use.
  ///
  /// Defaults to [MethodChannelRiverpodMvvm].
  static RiverpodMvvmPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RiverpodMvvmPlatform] when
  /// they register themselves.
  static set instance(RiverpodMvvmPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
