//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <riverpod_mvvm/riverpod_mvvm_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) riverpod_mvvm_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RiverpodMvvmPlugin");
  riverpod_mvvm_plugin_register_with_registrar(riverpod_mvvm_registrar);
}
