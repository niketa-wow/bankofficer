local addonName, private = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(addonName)
local L = private.L
local ACD = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")

function private:CloseOptions()
    ACD:Close(addonName)
end

function private:GetGuilds()
    local options = {}

    for guildKey, guild in pairs(private.db.global.guilds) do
        options[guildKey] = {
            type = "group",
            name = guildKey,
            args = {
                scanBank = {
                    order = 1,
                    type = "execute",
                    name = L["Scan"],
                    func = function()
                        private:GetBankScan()
                    end,
                },
                organizeBank = {
                    order = 2,
                    type = "execute",
                    name = L["Organize"],
                    func = function()
                        private:OrganizeBank()
                    end,
                },
                rules = {
                    order = 3,
                    type = "group",
                    name = L["Rules"],
                    childGroups = "tab",
                    args = private:GetRulesOptions(guildKey),
                },
                scans = {
                    order = 3,
                    type = "group",
                    name = L["Scans"],
                    childGroups = "select",
                    args = private:GetScansOptions(guildKey, guild.scans),
                },
                settings = {
                    order = 4,
                    type = "group",
                    name = L["Settings"],
                    args = private:GetSettingsOptions(guildKey),
                },
            },
        }
    end

    return options
end

function private:GetOptions()
    local options = {
        type = "group",
        name = L.addonName,
        childGroups = "select",
        args = private:GetGuilds(),
    }

    return options
end

function private:InitializeOptions()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, private:GetOptions())
    private.options = ACR:GetOptionsTable(addonName, "dialog", addonName .. "-1.0")
    ACD:SetDefaultSize(addonName, 900, 700)
    private.frame = AceGUI:Create("Frame")
    _G["BankOfficerFrame"] = private.frame.frame
    tinsert(UISpecialFrames, "BankOfficerFrame")
    private.frame:Hide()
    private.organizeContextMenu =
        CreateFrame("Frame", "BankOfficer_OrganizeContextMenu", UIParent, "UIDropDownMenuTemplate")
end

function private:OpenOptions(...)
    ACD:SelectGroup(addonName, ...)
    ACD:Open(addonName, private.frame)
end

function private:RefreshOptions(...)
    private.options.args = private:GetGuilds()

    if ... then
        ACD:SelectGroup(addonName, ...)
    end

    ACD:Open(addonName, private.frame)
    ACR:NotifyChange(addonName)
end
