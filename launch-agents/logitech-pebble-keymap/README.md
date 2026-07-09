# Logitech Pebble macOS keymap

This LaunchAgent fixes the Logitech Pebble keyboard on macOS when the `` ` `` / `~` key and the ISO non-US backslash key are swapped.

It applies this `hidutil` mapping only to the Logitech device with:

- VendorID: `1133`
- ProductID: `45943`

The built-in MacBook keyboard is not affected.

## What it does

At login, macOS `launchd` runs:

```sh
hidutil property \
  --matching '{"VendorID":1133,"ProductID":45943}' \
  --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'
```

This swaps:

- `0x700000064`: non-US backslash / ISO extra key, usually left of `Z`
- `0x700000035`: grave accent and tilde key, usually left of `1`

`hidutil` mappings are not persistent across reboots, so the LaunchAgent reapplies the mapping automatically when the user logs in.

## Deploy

From this directory:

```sh
mkdir -p ~/Library/LaunchAgents
cp com.local.logitech-pebble-keymap.plist ~/Library/LaunchAgents/
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.local.logitech-pebble-keymap.plist
launchctl kickstart -k gui/$(id -u)/com.local.logitech-pebble-keymap
```

Verify:

```sh
hidutil property --matching '{"VendorID":1133,"ProductID":45943}' --get UserKeyMapping
```

Expected output includes two mappings between `30064771172` and `30064771125`.

## Permissions

The terminal app used to run the commands may need Input Monitoring permission:

System Settings → Privacy & Security → Input Monitoring

Enable the terminal app, then quit and reopen it.

## Undo

Unload and remove the LaunchAgent:

```sh
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.local.logitech-pebble-keymap.plist
rm -f ~/Library/LaunchAgents/com.local.logitech-pebble-keymap.plist
```

Clear the active mapping from the Logitech keyboard:

```sh
hidutil property --matching '{"VendorID":1133,"ProductID":45943}' --set '{"UserKeyMapping":[]}'
```

Verify it is gone:

```sh
hidutil property --matching '{"VendorID":1133,"ProductID":45943}' --get UserKeyMapping
```
