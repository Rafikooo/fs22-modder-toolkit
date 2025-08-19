-- RuntimeInspector.lua (MAIN)
RuntimeInspector = RuntimeInspector or {}

RuntimeInspector.LOG_PREFIX          = RuntimeInspector.LOG_PREFIX          or "[RuntimeInspector] "
RuntimeInspector.DEFAULT_DEPTH       = RuntimeInspector.DEFAULT_DEPTH       or 1
RuntimeInspector.MAX_DEPTH           = RuntimeInspector.MAX_DEPTH           or 12
RuntimeInspector.MAX_NODES           = RuntimeInspector.MAX_NODES           or 50000
RuntimeInspector.WATCH_LIMIT         = RuntimeInspector.WATCH_LIMIT         or 12
RuntimeInspector.MOD_SETTINGS_FOLDER = RuntimeInspector.MOD_SETTINGS_FOLDER or "FS22_RuntimeInspector"

function RuntimeInspector:outDir()
    if not self.getOutDir then return self.loge("getOutDir not available (check modDesc order)") end
    self.logi("Output dir: " .. self:getOutDir())
end

function RuntimeInspector:help()
    self.logi("riInspect <g_name> [depth]                         - inspect a table/value")
    self.logi("riShow <path>                                      - show value (e.g. g_fieldManager.fields[1].fruitType)")
    self.logi("riDumpXML <globalPath> [depth] [tag] [file]        - export subtree values to XML")
    self.logi("riDumpAll [depth] [folder] [tag]                   - export all ^g_ roots (values)")
    self.logi("riDumpAllByPattern [depth] <pattern> [folder] [tag]- export matched roots (values)")
    self.logi("riDumpSignature <globalPath> [depth] [file]        - export runtime schema (array-aware)")
    self.logi("riWatch <path> / riUnwatch <path>                  - on-screen watch")
    self.logi("riOutDir                                           - show output dir")
end

function RuntimeInspector:register()
    addConsoleCommand("riInspect",          "Inspect a g_* (table/value)",            "inspect",          self)
    addConsoleCommand("riShow",             "Show value by path",                      "showValue",        self)
    addConsoleCommand("riDumpXML",          "Dump nested path to XML (values)",        "dumpXML",          self)
    addConsoleCommand("riDumpAll",          "Dump all ^g_ roots into files (values)", "dumpAll",          self)
    addConsoleCommand("riDumpAllByPattern", "Dump matched roots into files (values)",  "dumpAllByPattern", self)
    addConsoleCommand("riDumpSignature",    "Dump runtime schema (array-aware)",       "dumpSignature",    self)
    addConsoleCommand("riWatch",            "Watch path on HUD",                       "addWatch",         self)
    addConsoleCommand("riUnwatch",          "Stop watching path",                      "removeWatch",      self)
    addConsoleCommand("riOutDir",           "Show output dir",                         "outDir",           self)
    addConsoleCommand("riHelp",             "Show help",                               "help",             self)
    addModEventListener(self)
    self.logi("RuntimeInspector registered")
end

g_runtimeInspector = RuntimeInspector
g_runtimeInspector:register()
