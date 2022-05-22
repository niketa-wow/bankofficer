local addonName, private = ...
local addon = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)
LibStub("LibAddonUtils-1.0"):Embed(addon)
local private = {}

L[addonName] = "Bank Officer"

L["Add"] = true
L["Add ItemID"] = true
L["Add List"] = true
L["Add Rule"] = true
L["Add Template"] = true
L["Apply rule to guilds"] = true
L["Apply Template"] = true
L["Cannot add soulbound item to template"] = true
L["Cannot add soulbound item to rule"] = true
L["Clear"] = true
L["Clear Slot"] = true
L["Control+click to remove from list"] = true
L["Duplicate"] = true
L["Edit Template"] = true
L["Enter ItemID:"] = true
L["Guilds"] = true
L["Help"] = true
L["ItemID exists in list rule"] = true
L["ItemIDs"] = true
L["Invalid itemID"] = true
L["List"] = true
L["Lists"] = true
L["Minimum Restock"] = true
L["Missing itemID"] = true
L["Quick-add"] = true
L["Quick-add template"] = true
L["Rules"] = true
L["Stack Size"] = true
L["Tab"] = true
L["Templates"] = true

L["Missing list name"] = true
L.DeleteList = function(ruleName, listName)
	return format('Are you sure you want to delete the list "%s" from "%s"?', listName, ruleName)
end
L.ListExists = function(listName)
	return format('List "%s" already exists', listName)
end

L["Invalid rule name"] = true
L["Missing rule name"] = true
L.DeleteRule = function(ruleName)
	return format('Are you sure you want to delete the rule "%s"?', ruleName)
end
L.RuleExists = function(ruleName)
	return format('Rule "%s" already exists', ruleName)
end
L.TabID = function(tabID)
	return tabID and ("Tab " .. tabID) or "Tab"
end

L["Invalid template name"] = true
L["Missing template name"] = true
L.TemplateExists = function(templateName)
	return format('Template "%s" already exists', templateName)
end
L.DeleteTemplate = function(templateName)
	return format('Are you sure you want to delete the template "%s"?', templateName)
end
