-- Not required: the server script applies this automatically at startup. Kept for reference.
-- Upgrade from 2.6.x. Run once against the characters database (e.g. acore_characters).
-- Saved transmog outfits, now stored on the server so they follow the character to any PC.
-- Outfits saved by 2.6.x on the client are moved here automatically the next time the player logs in.
CREATE TABLE IF NOT EXISTS `character_transmog_outfits` (
  `player_guid` int unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `items` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`player_guid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
