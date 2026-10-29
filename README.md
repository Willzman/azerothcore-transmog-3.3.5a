# AzerothCore Transmog System (3.3.5a)

**A Transmogrification system built with AIO and Eluna for AzerothCore.**

## 🎯 About

This project brings a fully functional Transmog system to AzerothCore servers, combining the power of [AIO](https://github.com/Rochet2/AIO) and [Eluna](https://github.com/azerothcore/mod-eluna).

## 📤 Installation (Server)

1. Ensure you have both [AIO](https://github.com/Rochet2/AIO) and [mod-eluna](https://github.com/azerothcore/mod-eluna) installed on your AzerothCore server.
2. Copy the contents of the `lua_scripts` folder into your Eluna/AIO Lua scripts directory.
3. Import all `.sql` files located in the `sql` folder into your server database.
4. Move the patch files into an `.mpq` archive of your choice (you can use [MPQEditor](https://www.zezula.net/en/mpq/download.html)).
5. Start your server — and enjoy your new Transmog system!

📚 For more help, check out the [mod-eluna documentation](https://github.com/azerothcore/mod-eluna).

### Upgrading from 2.6.x

1. Replace the server script and the client AddOn with the new versions. **Both must be updated.**
2. Run `sql/updates/2.7.0_char.sql` against your characters database (once). Outfits players saved with 2.6.x are moved to the server automatically the next time they log in.

### Upgrading from 2.5.x

Follow these steps, then the 2.6.x steps above.

1. Replace the server script and the client AddOn with the new versions. **Both must be updated** — 2.6.0 changes messages between client and server.
2. Run `sql/updates/2.6.0_auth.sql` against your auth database and `sql/updates/2.6.0_char.sql` against your characters database (once).
3. Optional: run `sql/updates/2.6.0_char_optional_unhide.sql` against your characters database to fix slots that earlier versions wrongly saved as hidden (items equipped there later appear invisible). Hides that players chose themselves are kept.

## ⚙️ Configuration

All options are at the top of `lua_scripts/Transmogrification/transmogrification.lua`:

- Which items are added to the collection (equipped, looted, quest rewards).
- Armor material and weapon type restrictions.
- `BLOCKED_TRANSMOG_ITEMS` / `BLOCKED_TRANSMOG_QUALITIES` — items or qualities that can never be used as appearances.

## 📥 Installation (Client)

1. Ensure you have both the [AIO](https://github.com/Rochet2/AIO) and [Transmogrify](https://github.com/DanieltheDeveloper/azerothcore-transmog-3.3.5a/tree/master/patches/lose%20files/Interface/addons) client-side AddOns installed to the AddOns folder of your World of Warcraft installation.

## ✨ Features

- Account-wide appearance collection, synced automatically on login (`/transmog sync` to sync manually).
- Hide or restore any slot, with a live preview before applying.
- Search finds a look by the name or item ID of any item that shares it, not just the one you collected. Each slot shows how many appearances are available.
- **Ctrl-click** an appearance to try it on in the Dressing Room, **Shift-click** to link it in chat.
- Applying a transmog plays a short spin-and-glow animation on the preview model (can be turned off in the AddOn options).
- The Transmogrify button on the Character window can be moved with **Shift-drag** (reset it in the AddOn options or with `/transmog resetbutton`).
- Saved outfits: use the **Outfits** button in the Transmogrify window to save the current preview, load it back later, or delete it. Outfits are stored per character on the server (up to 20), so they follow the character to any PC.

## 📝 Changelog

### 2.7.0

- Saved outfits are now stored on the server. Outfits saved with 2.6.x are moved over automatically.
- Search also matches the names and item IDs of other items that share a collected look.
- Each slot shows how many appearances are available.
- Ctrl-click an appearance to try it on in the Dressing Room, Shift-click to link it in chat.
- Stored transmogs are checked at login; ones that are no longer valid for the equipped item (e.g. left over from before 2.6.0, or after changing the restriction settings) are cleared.
- `/transmog sync` and the options button now ask the server directly instead of sending a chat command.

### 2.6.3

- Applying a transmog now plays a spin-and-glow animation on the preview model in the Transmogrify window. Toggle it with "Play Transmogrify Animation" in the AddOn options.

### 2.6.2

- Removed the transmog cost option. Transmogrification is always free.

### 2.6.1

- The Transmogrify button on the Character window can now be moved (Shift-drag), so it no longer clashes with UI addons.

### 2.6.0

- **Security:** all client requests are now validated and rate limited. Earlier versions allowed SQL injection, editing arbitrary character fields, and applying or unlocking appearances the player did not own. Server owners should update.
- Fixed transmogs reverting to the original or an old appearance after teleports and UI reloads.
- Fixed armor material restrictions for legs, feet and wrists, and off-hand shields/holdables being offered weapon appearances.
- Transmogs carry over when swapping gear if the appearance is still valid for the new item.
- Added item/quality blocklists, saved outfits and automatic collection sync.
- Faster appearance lists and collection sync (new database indexes, fewer queries).

## 🚧 Work in Progress (WIP)

- Search by display ID
- Weapon aura support
- Spells and character visual effects

## 🖼️ Screenshots

![Transmog Preview 1](./Screenshot.png)  
![Transmog Preview 2](./Screenshot2.png)

## ⚖️ Legal Notice

- *World of Warcraft*, *Battle.net*, *Blizzard Entertainment*, and all related trademarks and logos are property of Blizzard Entertainment.
- This project is not affiliated with Blizzard Entertainment or any of their partners.
- All other trademarks and copyrights are property of their respective owners.
