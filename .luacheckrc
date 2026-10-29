-- Luacheck config, run in CI by .github/workflows/luacheck.yml.
-- Only syntax errors (011) and reads of unknown globals (113) fail the build, which catches typos
-- such as misspelled variable names. Add new Eluna/WoW API globals to the lists below when you use them.
std = "lua51"
max_line_length = false
allow_defined = true
only = { "011", "113" }

exclude_files = { "patches/**/Libs/**" }

-- Eluna + AIO (server).
files["lua_scripts/**/*.lua"] = {
	read_globals = {
		"AIO", "AuthDBQuery", "CharDBQuery", "GetCurrTime", "GetItemTemplate", "RegisterPlayerEvent",
		"WorldDBQuery"
	},
}

-- WoW 3.3.5a API, AIO and frames created in XML (client).
files["patches/**/*.lua"] = {
	read_globals = {
		"ACCEPT", "AIO", "CANCEL", "CharacterAmmoSlot", "CharacterFrame", "ChatEdit_SendText",
		"ChatFrame1EditBox", "ChatFrame_AddMessageEventFilter", "CreateFrame", "CursorUpdate",
		"DEFAULT_CHAT_FRAME", "DressUpTexturePath", "EasyMenu", "GameTooltip", "GetCoinTextureString",
		"GetCursorPosition", "GetInventoryItemID", "GetInventoryItemTexture", "GetInventorySlotInfo",
		"GetItemIcon", "GetItemInfo", "GetTransmogrificationOptions",
		"InterfaceOptionsFrame_OpenToCategory", "IsEquippableItem", "ItemSearchInput", "LeftButton",
		"LibStub", "OKAY", "PaperDollFrame", "PaperDollFrame_SetLevel", "PaperDollFrame_SetResistances",
		"PaperDollFrame_UpdateStats", "PlaySound", "PlayerTitleFrame_UpdateTitles",
		"PlayerTitlePickerScrollFrame", "ReloadUI", "RightButton", "SaveButton", "SetItemButtonTexture",
		"ShowCloak", "ShowCloakCheckBox", "ShowCloakText", "ShowHelm", "ShowHelmCheckBox", "ShowHelmText",
		"ShowingCloak", "ShowingHelm", "StaticPopupDialogs", "StaticPopup_Show", "Subtitle", "Title",
		"TransmogCloseButton", "TransmogMouseCapture", "TransmogPaginationText", "TransmogWarningFrame",
		"TransmogWarningText", "Transmogrification", "TransmogrificationFrame",
		"TransmogrificationModelFrame", "UIParent", "UISpecialFrames", "UnitHasRelicSlot", "UnitRace",
		"UnitSex", "strfind", "strsub", "strtrim", "tinsert", "wipe"
	},
}
