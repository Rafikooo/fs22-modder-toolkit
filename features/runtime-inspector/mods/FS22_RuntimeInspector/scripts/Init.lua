-- Init.lua
-- Initialize RuntimeInspector namespace and constants
-- MUST be loaded first (before all other modules)

RuntimeInspector = RuntimeInspector or {}

-- Constants
RuntimeInspector.LOG_PREFIX          = RuntimeInspector.LOG_PREFIX          or "[RuntimeInspector] "
RuntimeInspector.DEFAULT_DEPTH       = RuntimeInspector.DEFAULT_DEPTH       or 1
RuntimeInspector.MAX_DEPTH           = RuntimeInspector.MAX_DEPTH           or 12
RuntimeInspector.MAX_NODES           = RuntimeInspector.MAX_NODES           or 50000
RuntimeInspector.WATCH_LIMIT         = RuntimeInspector.WATCH_LIMIT         or 12
RuntimeInspector.MOD_SETTINGS_FOLDER = RuntimeInspector.MOD_SETTINGS_FOLDER or "FS22_RuntimeInspector"

function RuntimeInspector.logi(msg)
    Logging.info((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg)
end

function RuntimeInspector.logw(msg)
    Logging.warning((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg)
end

function RuntimeInspector.loge(msg)
    Logging.error((RuntimeInspector.LOG_PREFIX or "[RuntimeInspector] ") .. msg)
end

function RuntimeInspector:getClock()
    return getTimeSec()
end

RuntimeInspector.logi("RuntimeInspector namespace initialized")
