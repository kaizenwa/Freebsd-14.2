//===-- symbolLocator.cpp -------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "lldb/Symbol/SymbolLocator.h"

#include "lldb/Core/Debugger.h"
#include "lldb/Core/PluginManager.h"

#include "llvm/ADT/SmallSet.h"
#include "llvm/Support/ThreadPool.h"

using namespace lldb;
using namespace lldb_private;

void SymbolLocator::DownloadSymbolFileAsync(const UUID &uuid) {
  if (!ModuleList::GetGlobalModuleListProperties().GetEnableBackgroundLookup())
    return;

  static llvm::SmallSet<UUID, 8> g_seen_uuids;
  static std::mutex g_mutex;
  Debugger::GetThreadPool().async([=]() {
    {
      std::lock_guard<std::mutex> guard(g_mutex);
      if (g_seen_uuids.count(uuid))
        return;
      g_seen_uuids.insert(uuid);
    }

    Status error;
    ModuleSpec module_spec;
    module_spec.GetUUID() = uuid;
    if (!PluginManager::DownloadObjectAndSymbolFile(module_spec, error,
                                                    /*force_lookup=*/true,
                                                    /*copy_executable=*/false))
      return;

    if (error.Fail())
      return;

    Debugger::ReportSymbolChange(module_spec);
  });
}
