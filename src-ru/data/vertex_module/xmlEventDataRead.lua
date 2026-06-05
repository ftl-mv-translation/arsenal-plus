local vertexdata = mods.vertexdata
local Children = vertexdata.Children

vertexdata.eventInfo = vertexdata.eventInfo or {}

local eventInfo = vertexdata.eventInfo

local baseEventFiles = {
    "data/events.xml",
    "data/dlcEvents.xml",
    "data/dlcEventsOverwrite.xml",
    "data/newEvents.xml",
    "data/nameEvents.xml",
    "data/events_boss.xml",
    "data/events_crystal.xml",
    "data/events_engi.xml",
    "data/events_fuel.xml",
    "data/events_mantis.xml",
    "data/events_nebula.xml",
    "data/events_pirate.xml",
    "data/events_rebel.xml",
    "data/events_rock.xml",
    "data/events_ships.xml",
    "data/events_slug.xml",
    "data/events_zoltan.xml",
}

local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function normalize_custom_environment(value)
    value = trim(value or "")
    value = value:lower()
    value = value:gsub("[%s%-]+", "_")
    return value
end

local function add_unique(list, value)
    for _, existing in ipairs(list) do
        if existing == value then
            return
        end
    end
    list[#list + 1] = value
end

local function add_event_file(files, seen, fileName)
    fileName = trim(fileName or "")
    if fileName == "" or seen[fileName] then
        return
    end
    seen[fileName] = true
    files[#files + 1] = fileName
end

local function safe_parse_file(fileName)
    local doc = RapidXML.xml_document()
    local ok = pcall(function()
        doc:parse_file(fileName)
    end)
    if not ok then
        return nil, nil
    end
    local root = doc:first_node("FTL") or doc
    if not root then
        doc:clear()
        return nil, nil
    end
    return doc, root
end

local function normalize_event_file_name(name)
    local fileName = string.lower(trim(name))
    if fileName == "" then
        return nil
    end
    if string.find(fileName, ".xml.append", 1, true) or string.find(fileName, ".xml", 1, true) then
        return fileName
    end
    if string.find(fileName, "data/", 1, true) == 1 then
        return fileName .. ".xml"
    end
    if string.find(fileName, "events_", 1, true) == 1 then
        return "data/" .. fileName .. ".xml"
    end
    return "data/events_" .. fileName .. ".xml"
end

local function collect_tagged_event_files()
    local files = {}
    local seen = {}

    for _, fileName in ipairs(baseEventFiles) do
        local normalized = normalize_event_file_name(fileName)
        if normalized and not seen[normalized] then
            local probeDoc, probeRoot = safe_parse_file(normalized)
            if probeDoc and probeRoot then
                add_event_file(files, seen, normalized)
                probeDoc:clear()
            end
        end
    end

    return files
end

local function merge_custom_environments(eventName, values)
    if not eventName or #values == 0 then
        return
    end

    local info = eventInfo[eventName]
    if not info then
        info = {}
        eventInfo[eventName] = info
    end

    local stored = info.customEnvironment or {}
    info.customEnvironment = stored
    for _, value in ipairs(values) do
        add_unique(stored, value)
    end
end

local function collect_custom_environments(node)
    local values = {}
    for child in Children(node) do
        if child:name() == "customEnvironment" then
            local value = normalize_custom_environment(child:value())
            if value ~= "" then
                add_unique(values, value)
            end
        end
    end
    return values
end

local function parse_event_file(fileName)
    local ok, doc = pcall(function()
        local parsed = RapidXML.xml_document()
        parsed:parse_file(fileName)
        return parsed
    end)
    if not ok or not doc then
        return
    end

    local root = doc:first_node("FTL") or doc
    for node in Children(root) do
        local nodeName = node:name()
        if nodeName == "event" or nodeName == "eventList" then
            local nameAttr = node:first_attribute("name")
            if nameAttr then
                local values = collect_custom_environments(node)
                if #values > 0 then
                    merge_custom_environments(nameAttr:value(), values)
                end
            end
        end
    end

    doc:clear()
end

local filesToParse = collect_tagged_event_files()
for _, fileName in ipairs(filesToParse) do
    parse_event_file(fileName)
end

function vertexdata.get_event_custom_environments(eventName)
    if not eventName then
        return nil
    end
    local info = eventInfo[eventName]
    return info and info.customEnvironment or nil
end
