#include "include/riverpod_mvvm/riverpod_mvvm_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "riverpod_mvvm_plugin.h"

void RiverpodMvvmPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  riverpod_mvvm::RiverpodMvvmPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
