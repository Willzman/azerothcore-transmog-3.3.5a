-- Not required: the server script applies this automatically at startup. Kept for reference.
-- Upgrade an existing 2.5.x install. Run once against the auth database (e.g. acore_auth).
-- Speeds up the appearance list, which filters by account, inventory type and subtype.
ALTER TABLE `account_transmog`
  ADD KEY `account_inventory_type` (`account_id`,`inventory_type`,`inventory_subtype`);
