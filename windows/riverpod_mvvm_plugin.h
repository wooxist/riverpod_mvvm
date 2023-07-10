#ifndef FLUTTER_PLUGIN_RIVERPOD_MVVM_PLUGIN_H_
#define FLUTTER_PLUGIN_RIVERPOD_MVVM_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace riverpod_mvvm {

class RiverpodMvvmPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  RiverpodMvvmPlugin();

  virtual ~RiverpodMvvmPlugin();

  // Disallow copy and assign.
  RiverpodMvvmPlugin(const RiverpodMvvmPlugin&) = delete;
  RiverpodMvvmPlugin& operator=(const RiverpodMvvmPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace riverpod_mvvm

#endif  // FLUTTER_PLUGIN_RIVERPOD_MVVM_PLUGIN_H_
