-- core/FileSystem.lua
-- File system operations and path management

FileSystem = FileSystem or {}

function FileSystem.getOutputDir()
    if RuntimeInspector and RuntimeInspector.getOutDir then
        return RuntimeInspector:getOutDir()
    end

    -- Safe fallback - check if RuntimeInspector exists before accessing fields
    local folderName = "FS22_RuntimeInspector"
    if RuntimeInspector and RuntimeInspector.MOD_SETTINGS_FOLDER then
        folderName = RuntimeInspector.MOD_SETTINGS_FOLDER
    end

    return getUserProfileAppPath() .. "modSettings/" .. folderName .. "/"
end

-- Create a directory (handles creation of parent directories)
function FileSystem.createFolder(path)
    createFolder(path)
end

-- Write content to a file
function FileSystem.writeFile(path, content)
    local file = io.open(path, "w")
    if file then
        file:write(content)
        file:close()
        return true
    end
    return false
end

-- Create simple export directory
-- Structure: modSettings/FS22_RuntimeInspector/schemas/
function FileSystem.createExportDir()
    local baseDir = FileSystem.getOutputDir() .. "schemas"
    FileSystem.createFolder(baseDir)
    return baseDir
end

-- Create directory for schema exports
-- Returns: full path for schema exports (all globals go to same directory)
-- Structure: modSettings/FS22_RuntimeInspector/schemas/
function FileSystem.createGlobalExportDir(globalName)
    local schemasDir = FileSystem.createExportDir()
    return schemasDir, "schemas"  -- Return dir and simple identifier
end
