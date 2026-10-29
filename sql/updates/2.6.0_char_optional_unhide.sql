-- OPTIONAL. Run once against the characters database (e.g. acore_characters) after upgrading from 2.5.x.
-- Versions before 2.6.0 saved slots that were empty during a loading screen as "hidden" (item = 0),
-- which makes items equipped there later invisible. This clears those entries, but only for slots
-- that never had an item recorded, so hides players chose themselves are kept. A slot hidden on gear
-- equipped before the AddOn was installed may also be reset; players can simply hide it again.
UPDATE `character_transmog` SET `item` = NULL
WHERE `item` = 0 AND (`real_item` IS NULL OR `real_item` = 0);
