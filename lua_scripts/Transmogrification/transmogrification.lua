-- ╔════════════════════════════════════════════════════════════════════════╗
-- ║           Transmog System Eluna Script by DanielTheDeveloper           ║
-- ╚════════════════════════════════════════════════════════════════════════╝
--
--                        ╔══════════════════════════╗
-- ╔══════════════════════║ Transmog System Settings ║══════════════════════╗
-- ║                      ╚══════════════════════════╝                      ║
-- ║ Automatically adds transmog appearances to the players account-wide    ║
-- ║ transmog collection when they equip an item for the first time.        ║
-- ║                                                                        ║
-- ║ It is recommended to leave this option enabled.                        ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local ADD_NEWLY_EQUIPPED_ITEMS_TO_THE_TRANSMOG_LIST = true          --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Automatically adds transmog appearances to the players account-wide    ║
-- ║ transmog collection when they loot an item for the first time.         ║
-- ║                                                                        ║
-- ║ It is recommended to leave this option disabled as it creates the      ║
-- ║ potential for a more healthy transmog economy to exist inside the      ║
-- ║ auction house.                                                         ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local ADD_NEWLY_LOOTED_ITEMS_TO_THE_TRANSMOG_LIST = false           --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Automatically adds all applicable quest reward items as transmog       ║
-- ║ appearances to the players account-wide transmog collection when       ║
-- ║ completing a quest, regardless of which quest reward the player        ║
-- ║ actually decided to select.                                            ║
-- ║                                                                        ║
-- ║ It is recommended to leave this option enabled as it eliminates the    ║
-- ║ dilemma of deciding between a potential transmog appearance or gear    ║
-- ║ that is useful for the character.                                      ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local ADD_QUEST_REWARD_ITEMS_TO_THE_TRANSMOG_LIST = true            --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Restricts armor transmog appearances to items made up of the same      ║
-- ║ material. As an example, with this option enabled, cloth chest pieces  ║
-- ║ can only be transmogrified to appear as other cloth chest pieces.      ║
-- ║ When this option is disabled, cloth chest pieces can be                ║
-- ║ transmogrified to appear as a cloth, leather, mail, or plate chest     ║
-- ║ piece.                                                                 ║
-- ║                                                                        ║
-- ║ It is recommended to leave this option enabled as it leaves the        ║
-- ║ class fantasy intact.                                                  ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local RESTRICT_ARMOR_TRANSMOG_TO_SIMILAR_MATERIALS = true           --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Restricts weapon transmog appearances to the same weapon. As an        ║
-- ║ example, with this option enabled, two-handed swords can only be       ║
-- ║ transmogrified to appear as other two-handed swords. When this option  ║
-- ║ is disabled, two-handed swords can be transmogrified to appear as a    ║
-- ║ one-handed sword, staff, polearm, fishing pole, etc.                   ║
-- ║                                                                        ║
-- ║ It is recommended to leave this option enabled as it leaves the        ║
-- ║ class fantasy intact.                                                  ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local RESTRICT_WEAPON_TRANSMOG_TO_SIMILAR_WEAPONS = true            --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Item IDs that can never be collected or used as a transmog appearance, ║
-- ║ e.g. GM or test items. Example: { [19019] = true, [17182] = true }     ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local BLOCKED_TRANSMOG_ITEMS = {}                                   --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Item qualities that can never be collected or used as a transmog       ║
-- ║ appearance. 0 = Poor, 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Epic,    ║
-- ║ 5 = Legendary, 6 = Artifact, 7 = Heirloom. Example: { [0] = true }     ║
-- ║                                                                        ║
-- ║ Already collected appearances stay listed but can no longer be applied.║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local BLOCKED_TRANSMOG_QUALITIES = {}                               --║
-- ╟────────────────────────────────────────────────────────────────────────╢
-- ║                                                                        ║
-- ║ Weapon glows (enchant visuals) players can choose for main-hand and    ║
-- ║ off-hand weapons, free for everyone. Each entry is an enchant ID from  ║
-- ║ SpellItemEnchantment.dbc and the name shown in the menu. Test new IDs  ║
-- ║ in-game before adding them. Set to {} to turn weapon glows off.        ║
-- ╟────────────────────────────────────────────────────────────────────────╢
      local WEAPON_GLOWS = {
          { id = 1900, name = "Crusader" },
          { id = 2673, name = "Mongoose" },
          { id = 3789, name = "Berserking" },
          { id = 3225, name = "Executioner" },
          { id = 3790, name = "Black Magic" },
          { id = 3869, name = "Blade Ward" },
          { id = 3870, name = "Blood Draining" },
          { id = 3273, name = "Deathfrost" },
          { id = 2672, name = "Soulfrost" },
          { id = 2671, name = "Sunfire" },
          { id = 2674, name = "Spellsurge" },
          { id = 2675, name = "Battlemaster" },
          { id = 803, name = "Fiery Weapon" },
          { id = 1894, name = "Icy Chill" },
          { id = 1898, name = "Lifestealing" },
          { id = 1899, name = "Unholy Weapon" },
          { id = 3368, name = "Rune of the Fallen Crusader" },
          { id = 3370, name = "Rune of Razorice" },
      }
-- ╚════════════════════════════════════════════════════════════════════════╝

local AIO = AIO or require("AIO")
local TransmogrificationHandler = AIO.AddHandlers("TransmogrificationServer", {})

-- Bring the characters database up to date if the update scripts in sql/updates were not run, so a
-- missing table or column can't break transmogs for everyone.
CharDBQuery([[CREATE TABLE IF NOT EXISTS `character_transmog_outfits` (
  `player_guid` int unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `items` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`player_guid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;]])
if not CharDBQuery("SHOW COLUMNS FROM `character_transmog` LIKE 'enchant';") then
	CharDBQuery("ALTER TABLE `character_transmog` ADD COLUMN `enchant` int unsigned DEFAULT NULL;")
	print("[Eluna] Transmog System: added the `enchant` column to character_transmog.")
end

-- Per-player limits on how often each client request is handled: at most `count` calls per `window` ms.
-- EquipTransmogItem is sent once per changed slot when pressing Apply, so it allows bursts.
local REQUEST_LIMITS = {
	LoadPlayer = { count = 5, window = 1000 },
	SetTransmogItemIDs = { count = 5, window = 1000 },
	EquipTransmogItem = { count = 30, window = 1000 },
	SetCurrentSlotItemIDs = { count = 10, window = 1000 },
	SetSearchCurrentSlotItemIDs = { count = 10, window = 1000 },
	GetItemsWithSameAppearance = { count = 20, window = 1000 },
	SendCollectedTransmogItemIDs = { count = 2, window = 10000 },
	RequestOutfits = { count = 5, window = 1000 },
	SaveOutfit = { count = 5, window = 1000 },
	DeleteOutfit = { count = 5, window = 1000 },
	ImportOutfits = { count = 1, window = 10000 },
	SetWeaponGlow = { count = 10, window = 1000 },
}
local requestCounts = {}

local function IsRateLimited(player, request)
	local limit = REQUEST_LIMITS[request]
	local guid = player:GetGUIDLow()
	local now = GetCurrTime()
	
	local counts = requestCounts[guid]
	if not counts then
		counts = {}
		requestCounts[guid] = counts
	end
	
	local entry = counts[request]
	-- Start a new window when the old one has passed (or the millisecond timer wrapped around).
	if not entry or now < entry.start or now - entry.start >= limit.window then
		counts[request] = { start = now, count = 1 }
		return false
	end
	
	entry.count = entry.count + 1
	return entry.count > limit.count
end

-- Equipment change refreshes are coalesced: one refresh runs shortly after a burst of changes.
local REFRESH_DELAY = 100
local pendingRefreshes = {}

local SLOTS = 6
local CALC = 281
local PLAYER_VISIBLE_ITEM_1_ENTRYID = 283  -- Head
local PLAYER_VISIBLE_ITEM_3_ENTRYID = 287  -- Shoulder
local PLAYER_VISIBLE_ITEM_4_ENTRYID = 289  -- Shirt
local PLAYER_VISIBLE_ITEM_5_ENTRYID = 291  -- Chest
local PLAYER_VISIBLE_ITEM_6_ENTRYID = 293  -- Waist
local PLAYER_VISIBLE_ITEM_7_ENTRYID = 295  -- Legs
local PLAYER_VISIBLE_ITEM_8_ENTRYID = 297  -- Feet
local PLAYER_VISIBLE_ITEM_9_ENTRYID = 299  -- Wrist
local PLAYER_VISIBLE_ITEM_10_ENTRYID = 301 -- Hands
local PLAYER_VISIBLE_ITEM_15_ENTRYID = 311 -- Back
local PLAYER_VISIBLE_ITEM_16_ENTRYID = 313 -- Main
local PLAYER_VISIBLE_ITEM_17_ENTRYID = 315 -- Off
local PLAYER_VISIBLE_ITEM_18_ENTRYID = 317 -- Ranged
local PLAYER_VISIBLE_ITEM_19_ENTRYID = 319 -- Tabard
local UNUSABLE_INVENTORY_TYPES = {[2] = true, [11] = true, [12] = true, [18] = true, [24] = true, [27] = true, [28] = true}

-- TODO: Add further language support.
local localeMessages = {
	LOOT_ITEM_LOCALE = {
		[0] = " has been added to your appearance collection.", -- enUS/enGB
		[3] = " wurde deiner Transmog-Sammlung hinzugefügt.", -- deDE
	},
	TOO_MANY_OUTFITS = {
		[0] = "You can save up to %d outfits. Delete one to save a new outfit.", -- enUS/enGB
		[3] = "Du kannst bis zu %d Outfits speichern. Lösche eines, um ein neues zu speichern.", -- deDE
	}
}

local function IsAppearanceBlocked(itemTemplate)
	return BLOCKED_TRANSMOG_ITEMS[itemTemplate:GetItemId()] or BLOCKED_TRANSMOG_QUALITIES[itemTemplate:GetQuality()] or false
end

local function GetLocalizedMessage(messageID, locale, ...)
	 local message = localeMessages[messageID][locale] or localeMessages[messageID][0]
	 if select("#", ...) > 0 then
		  return string.format(message, ...)
	 end
	 return message
end

function Transmog_CalculateSlotReverse(slot)
	local reverseSlot = (slot - CALC) / 2
	if (reverseSlot == 1) then
		return 0;
	end
	return reverseSlot;
end

function Transmog_OnCharacterCreate(event, player)
	local playerGUID = player:GetGUIDLow()
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_1_ENTRYID .. "', NULL, '');")  -- Head
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_3_ENTRYID .. "', NULL, '');")  -- Shoulder
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_4_ENTRYID .. "', NULL, '');")  -- Shirt
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_5_ENTRYID .. "', NULL, '');")  -- Chest
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_6_ENTRYID .. "', NULL, '');")  -- Waist
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_7_ENTRYID .. "', NULL, '');")  -- Legs
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_8_ENTRYID .. "', NULL, '');")  -- Feet
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_9_ENTRYID .. "', NULL, '');")  -- Wrist
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_10_ENTRYID .. "', NULL, '');") -- Hands
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_15_ENTRYID .. "', NULL, '');") -- Back
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_16_ENTRYID .. "', NULL, '');") -- Main
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_17_ENTRYID .. "', NULL, '');") -- Off
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_18_ENTRYID .. "', NULL, '');") -- Ranged
	CharDBQuery("INSERT IGNORE INTO `character_transmog` (`player_guid`, `slot`, `item`, `real_item`) VALUES (" .. playerGUID .. ", '" .. PLAYER_VISIBLE_ITEM_19_ENTRYID .. "', NULL, '');") -- Tabard
end

function Transmog_OnCharacterDelete(event, guid)
	CharDBQuery("DELETE FROM character_transmog WHERE player_guid = " .. guid .. "")
	CharDBQuery("DELETE FROM character_transmog_outfits WHERE player_guid = " .. guid .. "")
end

function Transmog_OnCharacterLogin(event, player)
	local playerGUID = player:GetGUIDLow()
	local playerExistsQuery = CharDBQuery("SELECT COUNT(*) FROM character_transmog WHERE player_guid = " .. playerGUID .. ";")
	local playerExists = playerExistsQuery:GetUInt32(0) > 0
	if not playerExists then
		Transmog_OnCharacterCreate(event, player)
	else
		Transmog_ValidateStoredTransmogs(player)
	end
end

local function LootItemLocale(player, item, count, locale)
	local accountGUID = player:GetAccountId()
	local itemID
	local itemTemplate
	
	if type(item) == "number" then
		itemID = item
		itemTemplate = GetItemTemplate(itemID)
	else
		itemTemplate = item:GetItemTemplate()
		itemID = itemTemplate:GetItemId()
	end
	
	if not itemTemplate or IsAppearanceBlocked(itemTemplate) then
		return
	end
	
	local inventoryType = itemTemplate:GetInventoryType()
	local inventorySubType = itemTemplate:GetSubClass()
	local class = itemTemplate:GetClass()

	if (class == 2 or class == 4) and not UNUSABLE_INVENTORY_TYPES[inventoryType] then
		local countQuery = AuthDBQuery("SELECT COUNT(*) FROM account_transmog WHERE account_id = " .. accountGUID .. " AND unlocked_item_id = " .. itemID .. ";")
		local count = countQuery:GetUInt32(0)
		local isNewTransmog = (count == 0)
		
		local displayID = itemTemplate:GetDisplayId()
		
		local displayExistsQuery = AuthDBQuery("SELECT COUNT(*) FROM account_transmog WHERE account_id = " .. accountGUID .. " AND display_id = " .. displayID .. ";")
		local displayExists = displayExistsQuery:GetUInt32(0) > 0
		
		if isNewTransmog and not displayExists then
			local itemName = itemTemplate:GetName()
			local locItemName = itemTemplate:GetName(locale)
			local itemQuality = itemTemplate:GetQuality()
			
			itemName = itemName:gsub("'", "''")
			AuthDBQuery("INSERT IGNORE INTO `account_transmog` (`account_id`, `unlocked_item_id`, `inventory_type`, `inventory_subtype`,`display_id`, `item_name`) VALUES (" .. accountGUID .. ", " .. itemID .. ", " .. inventoryType .. ", " .. inventorySubType .. ", " .. displayID .. ", '" .. itemName .. "');")
			
			if locItemName == nil then
				locItemName = itemTemplate:GetName(0)
			end
			
			local qualityColors = {
				[0] = "|cff9d9d9d", -- Poor
				[1] = "|cffffffff", -- Common
				[2] = "|cff1eff00", -- Uncommon
				[3] = "|cff0070dd", -- Rare
				[4] = "|cffa335ee", -- Epic
				[5] = "|cffff8000", -- Legendary
				[6] = "|cffe6cc80"  -- Heirloom
			}
			
			local colorCode = qualityColors[itemQuality] or "|cffffffff" -- Default to white if quality not found
			
			local itemLink = "|Hitem:" .. itemID .. ":0:0:0:0:0:0:0:0|h" .. colorCode .. "[" .. locItemName .. "]|r|h|r"
			player:SendBroadcastMessage(itemLink .. GetLocalizedMessage("LOOT_ITEM_LOCALE", locale))
		end
	end
end

function GetDisplaySlotForEquipmentSlot(equipSlot)
	local slotMapping = {
		[0] = PLAYER_VISIBLE_ITEM_1_ENTRYID,    -- Head
		[2] = PLAYER_VISIBLE_ITEM_3_ENTRYID,    -- Shoulders
		[3] = PLAYER_VISIBLE_ITEM_4_ENTRYID,    -- Shirt
		[4] = PLAYER_VISIBLE_ITEM_5_ENTRYID,    -- Chest
		[5] = PLAYER_VISIBLE_ITEM_6_ENTRYID,    -- Waist
		[6] = PLAYER_VISIBLE_ITEM_7_ENTRYID,    -- Legs
		[7] = PLAYER_VISIBLE_ITEM_8_ENTRYID,    -- Feet
		[8] = PLAYER_VISIBLE_ITEM_9_ENTRYID,    -- Wrists
		[9] = PLAYER_VISIBLE_ITEM_10_ENTRYID,   -- Hands
		[14] = PLAYER_VISIBLE_ITEM_15_ENTRYID,  -- Back
		[15] = PLAYER_VISIBLE_ITEM_16_ENTRYID,  -- Main Hand
		[16] = PLAYER_VISIBLE_ITEM_17_ENTRYID,  -- Off Hand
		[17] = PLAYER_VISIBLE_ITEM_18_ENTRYID,  -- Ranged
		[18] = PLAYER_VISIBLE_ITEM_19_ENTRYID   -- Tabard
	}
	
	return slotMapping[equipSlot]
end

function Transmog_OnEquipItem(event, player, item, bag, slot)
	local itemID = item:GetItemTemplate():GetItemId()
	local locale = player:GetDbLocaleIndex()
	
	if ADD_NEWLY_EQUIPPED_ITEMS_TO_THE_TRANSMOG_LIST then
		LootItemLocale(player, itemID, 1, locale)
	end
	
	local class = item:GetItemTemplate():GetClass()
	local inventoryType = item:GetItemTemplate():GetInventoryType()
	
	if (class == 2 or class == 4) and not UNUSABLE_INVENTORY_TYPES[inventoryType] then
		local playerGUID = player:GetGUIDLow()
		local displaySlot = GetDisplaySlotForEquipmentSlot(slot)
		
		if displaySlot then
			CharDBQuery("UPDATE character_transmog SET real_item = " .. itemID .. " WHERE player_guid = " .. playerGUID .. " AND slot = " .. displaySlot)
			
			-- The slot's transmog carries over to the new item only if it is still a valid appearance for it.
			local transmog = CharDBQuery("SELECT item FROM character_transmog WHERE player_guid = " .. playerGUID .. " AND slot = " .. displaySlot .. ";")
			local transmogItem = transmog and transmog:GetRow()["item"]
			if (transmogItem and transmogItem ~= 0 and not CanApplyTransmog(player, displaySlot, item, transmogItem)) then
				CharDBQuery("UPDATE character_transmog SET item = NULL WHERE player_guid = " .. playerGUID .. " AND slot = " .. displaySlot .. ";")
				AIO.Handle(player, "TransmogrificationServer", "ClearSlotTransmogrification", displaySlot)
			end
		end
	end
end

function Transmog_OnLootItem(event, player, item, count)
	local locale = player:GetDbLocaleIndex()
	LootItemLocale(player, item, 1, locale)
end

function Transmog_OnQuestComplete(event, player, quest)
	local questID = quest:GetId()
	local locale = player:GetDbLocaleIndex()
	
	local questRewardsQuery = WorldDBQuery("SELECT RewardItem1, RewardItem2, RewardItem3, RewardItem4, RewardChoiceItemID1, RewardChoiceItemID2, RewardChoiceItemID3, RewardChoiceItemID4, RewardChoiceItemID5, RewardChoiceItemID6 FROM quest_template WHERE ID = " .. questID .. ";")
	
	if not questRewardsQuery then
		return
	end
	
	for i = 0, 9 do
		local itemID = questRewardsQuery:GetUInt32(i)
		if itemID and itemID > 0 then
			LootItemLocale(player, itemID, 1, locale)
		end
	end
end

function GetEquipmentSlot(displaySlot)
	-- Map from display/visual slots to actual equipment slots
	local slotMapping = {
		[PLAYER_VISIBLE_ITEM_1_ENTRYID] = 0,     -- Head (0 in equipment slot system)
		[PLAYER_VISIBLE_ITEM_3_ENTRYID] = 2,     -- Shoulders
		[PLAYER_VISIBLE_ITEM_4_ENTRYID] = 3,     -- Shirt
		[PLAYER_VISIBLE_ITEM_5_ENTRYID] = 4,     -- Chest
		[PLAYER_VISIBLE_ITEM_6_ENTRYID] = 5,     -- Waist
		[PLAYER_VISIBLE_ITEM_7_ENTRYID] = 6,     -- Legs
		[PLAYER_VISIBLE_ITEM_8_ENTRYID] = 7,     -- Feet
		[PLAYER_VISIBLE_ITEM_9_ENTRYID] = 8,     -- Wrists
		[PLAYER_VISIBLE_ITEM_10_ENTRYID] = 9,    -- Hands
		[PLAYER_VISIBLE_ITEM_15_ENTRYID] = 14,   -- Back/Cloak
		[PLAYER_VISIBLE_ITEM_16_ENTRYID] = 15,   -- Main Hand
		[PLAYER_VISIBLE_ITEM_17_ENTRYID] = 16,   -- Off Hand
		[PLAYER_VISIBLE_ITEM_18_ENTRYID] = 17,   -- Ranged
		[PLAYER_VISIBLE_ITEM_19_ENTRYID] = 18,   -- Tabard
	}
	
	return slotMapping[displaySlot] or Transmog_CalculateSlotReverse(displaySlot)
end

-- Inventory types that may be used as appearances for each display slot.
local INVENTORY_TYPES_BY_SLOT = {
	[PLAYER_VISIBLE_ITEM_1_ENTRYID] = "= 1",
	[PLAYER_VISIBLE_ITEM_3_ENTRYID] = "= 3",
	[PLAYER_VISIBLE_ITEM_4_ENTRYID] = "= 4",
	[PLAYER_VISIBLE_ITEM_5_ENTRYID] = "IN (5, 20)",
	[PLAYER_VISIBLE_ITEM_6_ENTRYID] = "= 6",
	[PLAYER_VISIBLE_ITEM_7_ENTRYID] = "= 7",
	[PLAYER_VISIBLE_ITEM_8_ENTRYID] = "= 8",
	[PLAYER_VISIBLE_ITEM_9_ENTRYID] = "= 9",
	[PLAYER_VISIBLE_ITEM_10_ENTRYID] = "= 10",
	[PLAYER_VISIBLE_ITEM_15_ENTRYID] = "= 16",
	[PLAYER_VISIBLE_ITEM_16_ENTRYID] = "IN (13, 17, 21)",
	[PLAYER_VISIBLE_ITEM_17_ENTRYID] = "IN (13, 17, 22, 23, 14)",
	[PLAYER_VISIBLE_ITEM_18_ENTRYID] = "IN (15, 25, 26)",
	[PLAYER_VISIBLE_ITEM_19_ENTRYID] = "= 19"
}

-- Handler arguments come straight from the client, so only accept known display slots.
local function ToTransmogSlot(slot)
	slot = tonumber(slot)
	if slot and INVENTORY_TYPES_BY_SLOT[slot] then
		return slot
	end
	return nil
end

local function ToPositiveInteger(value)
	value = tonumber(value)
	if value and value >= 1 and value <= 4294967295 and value % 1 == 0 then
		return value
	end
	return nil
end

-- Builds the account_transmog WHERE clause for appearances that can be applied to the given slot.
function GetTransmogQueryConditions(accountGUID, slot, equippedItem)
	local inventoryTypes = INVENTORY_TYPES_BY_SLOT[slot]
	if not inventoryTypes then
		return nil
	end
	
	local equippedItemType = nil
	local equippedItemSubType = nil
	if equippedItem then
		equippedItemType = equippedItem:GetClass()
		equippedItemSubType = equippedItem:GetSubClass()
		
		-- Armor and weapon subclasses overlap (shield = polearm = 6, misc = axe = 0), so when filtering by
		-- subclass an off-hand shield or holdable only matches its own inventory type, and weapons only weapons.
		if slot == PLAYER_VISIBLE_ITEM_17_ENTRYID then
			if (RESTRICT_ARMOR_TRANSMOG_TO_SIMILAR_MATERIALS and equippedItemType == 4) then
				inventoryTypes = "= " .. equippedItem:GetItemTemplate():GetInventoryType()
			elseif (RESTRICT_WEAPON_TRANSMOG_TO_SIMILAR_WEAPONS and equippedItemType == 2) then
				inventoryTypes = "IN (13, 17, 22)"
			end
		end
	end
	
	local queryConditions = "account_id = " .. accountGUID .. " AND inventory_type " .. inventoryTypes
	
	local blockedItemIDs = {}
	for itemID in pairs(BLOCKED_TRANSMOG_ITEMS) do
		table.insert(blockedItemIDs, tonumber(itemID))
	end
	if #blockedItemIDs > 0 then
		queryConditions = queryConditions .. " AND unlocked_item_id NOT IN (" .. table.concat(blockedItemIDs, ", ") .. ")"
	end
	
	if equippedItemSubType then
		if (RESTRICT_ARMOR_TRANSMOG_TO_SIMILAR_MATERIALS and equippedItemType == 4) then
			queryConditions = queryConditions .. " AND inventory_subtype = " .. equippedItemSubType
		elseif (RESTRICT_WEAPON_TRANSMOG_TO_SIMILAR_WEAPONS and equippedItemType == 2) then
			queryConditions = queryConditions .. " AND inventory_subtype = " .. equippedItemSubType
		end
	end
	
	return queryConditions
end

-- Returns true if the account has collected the item and it is a valid appearance for the equipped item.
function CanApplyTransmog(player, slot, equippedItem, itemID)
	local itemTemplate = GetItemTemplate(itemID)
	if not itemTemplate or IsAppearanceBlocked(itemTemplate) then
		return false
	end
	
	local queryConditions = GetTransmogQueryConditions(player:GetAccountId(), slot, equippedItem)
	if not queryConditions then
		return false
	end
	
	local result = AuthDBQuery("SELECT 1 FROM account_transmog WHERE " .. queryConditions .. " AND unlocked_item_id = " .. itemID .. " LIMIT 1;")
	return result ~= nil
end

-- Clears stored transmogs that are no longer valid for the equipped item: ones saved by versions
-- before 2.6.0 without ownership checks, or ones that break restriction settings changed since.
function Transmog_ValidateStoredTransmogs(player)
	local playerGUID = player:GetGUIDLow()
	local transmogs = CharDBQuery("SELECT slot, item FROM character_transmog WHERE player_guid = "..playerGUID.." AND item > 0;")
	if not transmogs then
		return
	end

	for i = 1, transmogs:GetRowCount() do
		local row = transmogs:GetRow()
		local slot = ToTransmogSlot(row["slot"])
		local equippedItem = slot and player:GetEquippedItemBySlot(GetEquipmentSlot(slot))
		if equippedItem and not CanApplyTransmog(player, slot, equippedItem, row["item"]) then
			CharDBQuery("UPDATE character_transmog SET item = NULL WHERE player_guid = "..playerGUID.." AND slot = "..slot..";")
		end
		transmogs:NextRow()
	end
end

local function RefreshEquippedTransmogs(player)
	local playerGUID = player:GetGUIDLow()
	
	-- Clear transmogs from slots that no longer have an item equipped.
	local transmogs = CharDBQuery("SELECT slot FROM character_transmog WHERE player_guid = "..playerGUID.." AND item > 0;")
	if transmogs then
		for i = 1, transmogs:GetRowCount() do
			local slot = tonumber(transmogs:GetRow()["slot"])
			
			if not player:GetEquippedItemBySlot(GetEquipmentSlot(slot)) then
				-- Clear the transmog by setting both item and real_item to NULL
				CharDBQuery("UPDATE character_transmog SET item = NULL, real_item = NULL WHERE player_guid = "..playerGUID.." AND slot = "..slot..";")
				player:SetUInt32Value(slot, 0)
				
				-- Inform the client to update the display for this slot
				AIO.Handle(player, "TransmogrificationServer", "ClearSlotTransmogrification", slot)
			end
			transmogs:NextRow()
		end
	end
	
	-- Equipping an item makes the core reset that slot's visual to the real item, so reapply the
	-- stored transmogs. Otherwise they only come back after the next teleport or UI reload.
	Transmog_Load(player)
end

-- Sent by the client whenever its equipment or model changes.
function TransmogrificationHandler.OnUnequipItem(player)
	local guid = player:GetGUIDLow()
	local now = GetCurrTime()
	local pending = pendingRefreshes[guid]
	-- A refresh is already queued (stale entries are ignored in case the timed event was dropped).
	if pending and now >= pending and now - pending < 1000 then
		return
	end
	
	pendingRefreshes[guid] = now
	player:RegisterEvent(function(eventId, delay, repeats, refreshPlayer)
		pendingRefreshes[guid] = nil
		RefreshEquippedTransmogs(refreshPlayer)
	end, REFRESH_DELAY, 1)
end

-- Weapon glows: the visible enchant field sits right after each visible item field. NULL = the
-- weapon's own enchant, 0 = no glow, otherwise an enchant ID from WEAPON_GLOWS.
local WEAPON_GLOW_SLOTS = { [PLAYER_VISIBLE_ITEM_16_ENTRYID] = true, [PLAYER_VISIBLE_ITEM_17_ENTRYID] = true }
local ALLOWED_WEAPON_GLOWS = {}
for _, glow in ipairs(WEAPON_GLOWS) do
	ALLOWED_WEAPON_GLOWS[glow.id] = true
end

-- Glows only show on weapons, so shields and held-in-off-hand items are skipped.
local function GetGlowWeapon(player, slot)
	if not WEAPON_GLOW_SLOTS[slot] then
		return nil
	end
	local item = player:GetEquippedItemBySlot(GetEquipmentSlot(slot))
	if item and item:GetClass() == 2 then
		return item
	end
	return nil
end

local function ApplyWeaponGlow(player, slot, weapon, glow)
	if glow == nil then
		-- Show the weapon's own permanent and temporary enchants again.
		glow = (weapon:GetEnchantmentId(0) or 0) + (weapon:GetEnchantmentId(1) or 0) * 65536
	end
	player:SetUInt32Value(slot + 1, glow)
end

function Transmog_Load(player)
	local playerGUID = player:GetGUIDLow()
	
	local transmogs = CharDBQuery("SELECT item, slot, enchant FROM character_transmog WHERE player_guid = "..playerGUID..";")
	if (transmogs == nil) then
		return;
	end
	
	for i = 1, transmogs:GetRowCount(), 1 do
		local currentRow = transmogs:GetRow()
		local slot = tonumber(currentRow["slot"])
		local item = currentRow["item"]
		if (item ~= nil and item ~= '' and player:GetEquippedItemBySlot(GetEquipmentSlot(slot))) then
			player:SetUInt32Value(slot, item)
		end
		
		-- Equipping resets the enchant field too, so reapply a chosen glow (if it is still on the list).
		local glow = currentRow["enchant"]
		local weapon = GetGlowWeapon(player, slot)
		if weapon and glow ~= nil and (glow == 0 or ALLOWED_WEAPON_GLOWS[glow]) then
			ApplyWeaponGlow(player, slot, weapon, glow)
		end
		transmogs:NextRow()
	end
end

function TransmogrificationHandler.LoadPlayer(player)
	Transmog_Load(player)
	AIO.Handle(player, "TransmogrificationServer", "SetWeaponGlowList", WEAPON_GLOWS)
	player:SetUInt32Value(147, 1) -- use unit padding
end

-- Sends the stored transmog of one slot to the client, e.g. to undo a change the server rejected.
local function SendSlotTransmog(player, slot)
	local transmog = CharDBQuery("SELECT item, real_item FROM character_transmog WHERE player_guid = "..player:GetGUIDLow().." AND slot = "..slot..";")
	local row = transmog and transmog:GetRow() or {}
	AIO.Handle(player, "TransmogrificationServer", "SetTransmogItemIDClient", slot, row["item"], row["real_item"])
end

function TransmogrificationHandler.EquipTransmogItem(player, item, slot)
	local playerGUID = player:GetGUIDLow()
	
	-- Only allow transmogs onto an equipped item, using an appearance the account has collected (0 = hidden, nil = restore).
	slot = ToTransmogSlot(slot)
	if not slot then
		return
	end
	local equippedItem = player:GetEquippedItemBySlot(GetEquipmentSlot(slot))
	if not equippedItem then
		SendSlotTransmog(player, slot)
		return
	end
	if item ~= nil and item ~= 0 then
		item = ToPositiveInteger(item)
		if not item or not CanApplyTransmog(player, slot, equippedItem, item) then
			SendSlotTransmog(player, slot)
			return
		end
	end
	
	-- Store what is actually equipped as real_item; restoring (nil) shows that item again.
	local realItemID = equippedItem:GetEntry()
	local itemValue = (item == nil) and "NULL" or item
	CharDBQuery("INSERT INTO character_transmog (`player_guid`, `slot`, `item`, `real_item`) VALUES ("..playerGUID..", '"..slot.."', "..itemValue..", "..realItemID..") ON DUPLICATE KEY UPDATE item = VALUES(item), real_item = VALUES(real_item);")
	player:SetUInt32Value(slot, item or realItemID)
end

function TransmogrificationHandler.SetTransmogItemIDs(player)
	local playerGUID = player:GetGUIDLow()
	
	local transmogs = CharDBQuery('SELECT item, real_item, slot, enchant FROM character_transmog WHERE player_guid = '..playerGUID..';')
	if (transmogs == nil) then
		return;
	end
	
	for i = 1, transmogs:GetRowCount(), 1 do
		local currentRow = transmogs:GetRow()
		local item = currentRow["item"]
		local slot = currentRow["slot"]
		local real_item = currentRow["real_item"]
		-- The database is the source of truth: item NULL = no transmog, 0 = hidden, otherwise the transmog item.
		AIO.Handle(player, "TransmogrificationServer", "SetTransmogItemIDClient", slot, item, real_item)
		if WEAPON_GLOW_SLOTS[tonumber(slot)] then
			AIO.Handle(player, "TransmogrificationServer", "SetWeaponGlowClient", slot, currentRow["enchant"])
		end
		transmogs:NextRow()
	end
end

-- Sets the glow for a weapon slot: nil = the weapon's own enchant, 0 = no glow, or an ID from WEAPON_GLOWS.
-- The choice stays with the slot and is reapplied to whatever weapon is equipped there.
function TransmogrificationHandler.SetWeaponGlow(player, slot, glow)
	slot = ToTransmogSlot(slot)
	if not slot or not WEAPON_GLOW_SLOTS[slot] then
		return
	end
	if glow ~= nil then
		glow = tonumber(glow)
		if glow ~= 0 and not ALLOWED_WEAPON_GLOWS[glow] then
			glow = false
		end
	end
	
	local playerGUID = player:GetGUIDLow()
	if glow ~= false then
		CharDBQuery("UPDATE character_transmog SET enchant = "..(glow == nil and "NULL" or glow).." WHERE player_guid = "..playerGUID.." AND slot = "..slot..";")
		local weapon = GetGlowWeapon(player, slot)
		if weapon then
			ApplyWeaponGlow(player, slot, weapon, glow)
		end
	end
	
	-- Confirm the stored glow to the client (this also undoes a rejected choice).
	local stored = CharDBQuery("SELECT enchant FROM character_transmog WHERE player_guid = "..playerGUID.." AND slot = "..slot..";")
	AIO.Handle(player, "TransmogrificationServer", "SetWeaponGlowClient", slot, stored and stored:GetRow()["enchant"])
end

-- Sends one page of collected appearances for the slot, optionally filtered by a search string.
local function SendSlotItemIDs(player, slot, page, search)
	slot = ToTransmogSlot(slot)
	page = ToPositiveInteger(page)
	if not slot or not page then
		return
	end
	
	local equippedItem = player:GetEquippedItemBySlot(GetEquipmentSlot(slot))
	local queryConditions = GetTransmogQueryConditions(player:GetAccountId(), slot, equippedItem)
	
	if search then
		local searchConditions = "display_id LIKE '%" .. search .. "%' OR item_name LIKE '%" .. search .. "%'"
		
		-- Each look is stored under the first item collected with it, so also match looks shared with any
		-- other item whose name or item ID matches the search.
		local searchItemID = ToPositiveInteger(search)
		local displayQuery = "SELECT DISTINCT displayid FROM item_template WHERE InventoryType " .. INVENTORY_TYPES_BY_SLOT[slot]
			.. " AND (name LIKE '%" .. search .. "%'" .. (searchItemID and (" OR entry = " .. searchItemID) or "") .. ") LIMIT 500;"
		local displayResult = WorldDBQuery(displayQuery)
		if displayResult then
			local displayIDs = {}
			for i = 1, displayResult:GetRowCount() do
				table.insert(displayIDs, displayResult:GetRow()["displayid"])
				displayResult:NextRow()
			end
			searchConditions = searchConditions .. " OR display_id IN (" .. table.concat(displayIDs, ", ") .. ")"
		end
		
		queryConditions = queryConditions .. " AND (" .. searchConditions .. ")"
	end
	
	-- Calculate page offset for pagination
	local pageOffset = (page > 1) and (SLOTS * (page - 1)) or 0
	
	-- Query to count matching transmogs
	local countQuery = string.format(
		"SELECT COUNT(unlocked_item_id) FROM account_transmog WHERE %s;",
		queryConditions
	)
	local countResult = AuthDBQuery(countQuery)
	if not countResult then
		AIO.Handle(player, "TransmogrificationServer", "InitTab", {}, page, false, 0)
		return
	end
	
	-- Get the total number of transmogs
	local totalTransmogs = countResult:GetUInt32(0)
	local hasMorePages = (totalTransmogs > SLOTS * page)
	
	-- Query to retrieve transmogs for the current page
	local transmogQuery = string.format(
		"SELECT unlocked_item_id FROM account_transmog WHERE %s LIMIT %d OFFSET %d;",
		queryConditions, SLOTS, pageOffset
	)
	local transmogs = AuthDBQuery(transmogQuery)
	if not transmogs then
		AIO.Handle(player, "TransmogrificationServer", "InitTab", {}, page, false, totalTransmogs)
		return
	end
	
	-- Collect the unlocked item IDs
	local currentSlotItemIDs = {}
	for i = 1, transmogs:GetRowCount() do
		local currentRow = transmogs:GetRow()
		local item = currentRow["unlocked_item_id"]
		table.insert(currentSlotItemIDs, item)
		transmogs:NextRow()
	end
	
	-- Return the result to the player
	AIO.Handle(player, "TransmogrificationServer", "InitTab", currentSlotItemIDs, page, hasMorePages, totalTransmogs)
end

function TransmogrificationHandler.SetCurrentSlotItemIDs(player, slot, page)
	SendSlotItemIDs(player, slot, page, nil)
end

function TransmogrificationHandler.SetSearchCurrentSlotItemIDs(player, slot, page, search)
	-- Ensure search is not empty or nil
	if ( type(search) ~= "string" or search == '' ) then
		return;
	end
	
	-- Escape special characters in search string
	search = search:gsub("[%'`&\"\\]", "%%")
	
	SendSlotItemIDs(player, slot, page, search)
end

function TransmogrificationHandler.GetItemsWithSameAppearance(player, itemID)
	itemID = ToPositiveInteger(itemID)
	if not itemID then
		return
	end
	
	-- Query the server for the display ID of the new item
	local displayIDQuery = "SELECT displayid FROM item_template WHERE entry = " .. itemID .. ";"
	local displayIDResult = WorldDBQuery(displayIDQuery)
	
	if not displayIDResult then
		return
	end
	
	local displayID = displayIDResult:GetUInt32(0)
	
	-- Find all items with the same display ID
	local matchingItemsQuery = "SELECT entry FROM item_template WHERE displayid = " .. displayID .. ";"
	local matchingItemsResult = WorldDBQuery(matchingItemsQuery)
	
	if not matchingItemsResult then
		return
	end
	
	-- Collect the matching item IDs into a table
	local matchingItems = {}
	for i = 1, matchingItemsResult:GetRowCount() do
		local currentRow = matchingItemsResult:GetRow()
		local matchingItemID = currentRow["entry"]
		table.insert(matchingItems, matchingItemID)
		matchingItemsResult:NextRow()
	end
	
	-- Send the matching transmogs to the client
	AIO.Handle(player, "TransmogrificationServer", "ReceiveMatchingAppearances", itemID, matchingItems)
end

-- `silent` is set by the client's automatic sync on login; /transmog sync shows the result in chat.
function TransmogrificationHandler.SendCollectedTransmogItemIDs(player, silent)
	silent = (silent == true)
	local accountGUID = player:GetAccountId()
	
	-- Query to retrieve collected transmog display IDs
	local collectedDisplayIDsQuery = "SELECT DISTINCT display_id FROM account_transmog WHERE account_id = " .. accountGUID .. ";"
	local displayIDsResult = AuthDBQuery(collectedDisplayIDsQuery)
	
	if not displayIDsResult then
		AIO.Handle(player, "TransmogrificationServer", "ReceiveCollectedAppearances", {}, 0, silent)
		return
	end
	
	-- Count the unique appearances.
	local uniqueAppearancesCount = displayIDsResult:GetRowCount()
	
	-- Collect the display IDs into a table
	local collectedDisplayIDs = {}
	for i = 1, displayIDsResult:GetRowCount() do
		local currentRow = displayIDsResult:GetRow()
		local displayID = currentRow["display_id"]
		table.insert(collectedDisplayIDs, displayID)
		displayIDsResult:NextRow()
	end
	
	local collectedAppearances = {}
	
	-- Find all items that share any of the collected appearances
	local itemsWithDisplayQuery = "SELECT entry FROM item_template WHERE displayid IN (" .. table.concat(collectedDisplayIDs, ", ") .. ");"
	local itemsResult = WorldDBQuery(itemsWithDisplayQuery)
	
	if itemsResult then
		for j = 1, itemsResult:GetRowCount() do
			local itemRow = itemsResult:GetRow()
			local itemID = itemRow["entry"]
			table.insert(collectedAppearances, itemID)
			itemsResult:NextRow()
		end
	end
	
	-- Send the collected transmogs to the client
	AIO.Handle(player, "TransmogrificationServer", "ReceiveCollectedAppearances", collectedAppearances, uniqueAppearancesCount, silent)
end

-- Saved outfits: named sets of appearances per character, stored as "slot=item,..." (0 = hidden;
-- slots left out show the equipped item). Loading one only fills the client's preview; applying it
-- still goes through EquipTransmogItem and its checks.
local MAX_OUTFITS = 20

local function ToOutfitName(name)
	if type(name) ~= "string" then
		return nil
	end
	name = name:gsub("[%c'\"`\\%%;]", ""):gsub("^%s+", ""):gsub("%s+$", "")
	if name == "" or #name > 64 then
		return nil
	end
	return name
end

local function SendOutfits(player)
	local outfits = {}
	local result = CharDBQuery("SELECT name, items FROM character_transmog_outfits WHERE player_guid = "..player:GetGUIDLow()..";")
	if result then
		for i = 1, result:GetRowCount() do
			local row = result:GetRow()
			local outfit = {}
			for slot, item in string.gmatch(row["items"] or "", "(%d+)=(%d+)") do
				outfit[tonumber(slot)] = tonumber(item)
			end
			outfits[row["name"]] = outfit
			result:NextRow()
		end
	end
	AIO.Handle(player, "TransmogrificationServer", "ReceiveOutfits", outfits)
end

-- Saves (or overwrites) one outfit. Returns false if the outfit limit is reached.
local function StoreOutfit(player, name, outfit)
	name = ToOutfitName(name)
	if not name or type(outfit) ~= "table" then
		return true
	end
	
	local items = {}
	for outfitSlot, outfitItem in pairs(outfit) do
		local slot = ToTransmogSlot(outfitSlot)
		local item = tonumber(outfitItem)
		if slot and item and (item == 0 or ToPositiveInteger(item)) then
			table.insert(items, string.format("%d=%d", slot, item))
		end
	end
	table.sort(items)
	
	local playerGUID = player:GetGUIDLow()
	local exists = CharDBQuery("SELECT 1 FROM character_transmog_outfits WHERE player_guid = "..playerGUID.." AND name = '"..name.."';")
	if not exists then
		local count = CharDBQuery("SELECT COUNT(*) FROM character_transmog_outfits WHERE player_guid = "..playerGUID..";")
		if count and count:GetUInt32(0) >= MAX_OUTFITS then
			return false
		end
	end
	
	CharDBQuery("REPLACE INTO character_transmog_outfits (`player_guid`, `name`, `items`) VALUES ("..playerGUID..", '"..name.."', '"..table.concat(items, ",").."');")
	return true
end

function TransmogrificationHandler.RequestOutfits(player)
	SendOutfits(player)
end

function TransmogrificationHandler.SaveOutfit(player, name, outfit)
	if not StoreOutfit(player, name, outfit) then
		player:SendBroadcastMessage(GetLocalizedMessage("TOO_MANY_OUTFITS", player:GetDbLocaleIndex(), MAX_OUTFITS))
	end
	SendOutfits(player)
end

-- Moves outfits saved on the client by 2.6.x onto the server, in one request.
function TransmogrificationHandler.ImportOutfits(player, outfits)
	if type(outfits) ~= "table" then
		return
	end
	local imported = 0
	for name, outfit in pairs(outfits) do
		imported = imported + 1
		if imported > MAX_OUTFITS or not StoreOutfit(player, name, outfit) then
			break
		end
	end
	SendOutfits(player)
end

function TransmogrificationHandler.DeleteOutfit(player, name)
	name = ToOutfitName(name)
	if name then
		CharDBQuery("DELETE FROM character_transmog_outfits WHERE player_guid = "..player:GetGUIDLow().." AND name = '"..name.."';")
	end
	SendOutfits(player)
end

-- Apply the request limits to every limited handler.
for request in pairs(REQUEST_LIMITS) do
	local handler = TransmogrificationHandler[request]
	TransmogrificationHandler[request] = function(player, ...)
		if IsRateLimited(player, request) then
			return
		end
		return handler(player, ...)
	end
end

function Transmog_OnLogout(event, player)
	local guid = player:GetGUIDLow()
	requestCounts[guid] = nil
	pendingRefreshes[guid] = nil
end

RegisterPlayerEvent(1, Transmog_OnCharacterCreate)
RegisterPlayerEvent(2, Transmog_OnCharacterDelete)
RegisterPlayerEvent(3, Transmog_OnCharacterLogin)
RegisterPlayerEvent(4, Transmog_OnLogout)

RegisterPlayerEvent(29, Transmog_OnEquipItem)

if ADD_NEWLY_LOOTED_ITEMS_TO_THE_TRANSMOG_LIST then
	RegisterPlayerEvent(32, Transmog_OnLootItem)
	RegisterPlayerEvent(51, Transmog_OnLootItem)
	RegisterPlayerEvent(52, Transmog_OnLootItem)
	RegisterPlayerEvent(53, Transmog_OnLootItem)
	RegisterPlayerEvent(56, Transmog_OnLootItem)
end

if ADD_QUEST_REWARD_ITEMS_TO_THE_TRANSMOG_LIST then
	RegisterPlayerEvent(54, Transmog_OnQuestComplete)
end

RegisterPlayerEvent(42, function(event, player, command)
	if command:lower() == "transmog sync" then
		TransmogrificationHandler.SendCollectedTransmogItemIDs(player)
		return false
	end
	return true
end)

print("[Eluna] Transmog System loaded successfully.")
