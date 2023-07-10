import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_mvvm/riverpod_mvvm.dart';
import 'package:riverpod_mvvm/riverpod_mvvm_platform_interface.dart';
import 'package:riverpod_mvvm/riverpod_mvvm_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRiverpodMvvmPlatform
    with MockPlatformInterfaceMixin
    implements RiverpodMvvmPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RiverpodMvvmPlatform initialPlatform = RiverpodMvvmPlatform.instance;

  test('$MethodChannelRiverpodMvvm is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRiverpodMvvm>());
  });

  test('getPlatformVersion', () async {
    RiverpodMvvm riverpodMvvmPlugin = RiverpodMvvm();
    MockRiverpodMvvmPlatform fakePlatform = MockRiverpodMvvmPlatform();
    RiverpodMvvmPlatform.instance = fakePlatform;

    expect(await riverpodMvvmPlugin.getPlatformVersion(), '42');
  });
}
