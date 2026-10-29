-- Not required: the server script applies this automatically at startup. Kept for reference.
-- Upgrade an existing 2.5.x install. Run once against the characters database (e.g. acore_characters).
-- Replaces the duplicate (player_guid, slot) indexes with a primary key.
DELETE FROM `character_transmog` WHERE `player_guid` IS NULL;
ALTER TABLE `character_transmog`
  MODIFY `player_guid` int unsigned NOT NULL,
  DROP KEY `player_and_slot`,
  DROP KEY `player_and_slot_key`,
  ADD PRIMARY KEY (`player_guid`,`slot`);
