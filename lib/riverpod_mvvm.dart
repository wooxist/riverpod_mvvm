library riverpod_mvvm;

import 'package:flutter/widgets.dart';

import 'riverpod_mvvm_platform_interface.dart';

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sources/ui_actions.dart';

part 'sources/view.dart';

part 'sources/view_model.dart';

class RiverpodMvvm {
  Future<String?> getPlatformVersion() {
    return RiverpodMvvmPlatform.instance.getPlatformVersion();
  }
}
