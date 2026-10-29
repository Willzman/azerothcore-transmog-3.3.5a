-- Not required: the server script applies this automatically at startup. Kept for reference.
-- Upgrade from 2.7.x. Run once against the characters database (e.g. acore_characters).
-- Stores the chosen weapon glow (enchant visual) per weapon slot. The server script also adds
-- this column automatically at startup if it is missing, so running this is optional.
ALTER TABLE `character_transmog` ADD COLUMN `enchant` int unsigned DEFAULT NULL;
