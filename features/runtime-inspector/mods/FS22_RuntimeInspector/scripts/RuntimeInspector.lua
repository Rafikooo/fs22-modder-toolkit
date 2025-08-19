-- RuntimeInspector.lua (MAIN) — konfiguracja, komendy, global

RuntimeInspector = RuntimeInspector or {}

-- Konfiguracja (bezpieczne domyślne wartości)
RuntimeInspector.LOG_PREFIX          = RuntimeInspector.LOG_PREFIX          or "[RuntimeInspector] "
RuntimeInspector.DEFAULT_DEPTH       = RuntimeInspector.DEFAULT_DEPTH       or 1
RuntimeInspector.MAX_DEPTH           = RuntimeInspector.MAX_DEPTH           or 12
RuntimeInspector.MAX_NODES           = RuntimeInspector.MAX_NODES           or 50000
RuntimeInspector.WATCH_LIMIT         = RuntimeInspector.WATCH_LIMIT         or 12
RuntimeInspector.MOD_SETTINGS_FOLDER = RuntimeInspector.MOD_SETTINGS_FOLDER or "FS22_RuntimeInspector"

local logi, logw, loge = RuntimeInspector.logi, RuntimeInspector.logw, RuntimeInspector.loge

function RuntimeInspector:outDir()
    logi("Output dir: " .. self:getOutDir())
end

function RuntimeInspector:help()
    logi("riInspect <g_name> [depth]                     - inspect a table/value")
    logi("riShow <path>                                  - show value (e.g. g_fieldManager.fields[1].fruitType)")
    logi("riDumpXML <globalPath> [depth] [tag] [file]    - export subtree to XML")
    logi("riDumpAll [depth] [folder] [tag]               - export all ^g_ roots into files")
    logi("riDumpAllByPattern [depth] <pattern> [folder] [tag] - export matched roots")
    logi("riWatch <path> / riUnwatch <path>              - on-screen watch")
    logi("riOutDir                                       - show output dir")
end

function RuntimeInspector:register()
    addConsoleCommand("riInspect",          "Inspect a g_* (table/value)",            "inspect",          self)
    addConsoleCommand("riShow",             "Show value by path",                      "showValue",        self)
    addConsoleCommand("riDumpXML",          "Dump nested path to XML",                 "dumpXML",          self)
    addConsoleCommand("riDumpAll",          "Dump all ^g_ roots into files",          "dumpAll",          self)
    addConsoleCommand("riDumpAllByPattern", "Dump matched roots into files",           "dumpAllByPattern", self)
    addConsoleCommand("riWatch",            "Watch path on HUD",                       "addWatch",         self)
    addConsoleCommand("riUnwatch",          "Stop watching path",                      "removeWatch",      self)
    addConsoleCommand("riOutDir",           "Show output dir",                         "outDir",           self)
    addConsoleCommand("riHelp",             "Show help",                               "help",             self)
    addModEventListener(self) -- dla HUD: drawUI()
    logi("RuntimeInspector registered")
end

-- Pełna nazwa globalna w stylu FS22
g_runtimeInspector = RuntimeInspector
g_runtimeInspector:register()
