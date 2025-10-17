# Soniphorm Gen v1.0 - Custom Arduino Board Profile

This custom board profile automates all ESP32-S3 configuration settings for Soniphorm Gen hardware, eliminating manual configuration and reducing setup errors.

## What It Does

**Before (Manual Configuration):**
Students must configure 7+ settings in Tools menu:
- Board: ESP32S3 Dev Module
- USB CDC On Boot: Enabled
- PSRAM: OPI PSRAM
- Flash Size: 16MB (128Mb)
- Flash Mode: QIO 80MHz
- Partition Scheme: Huge APP (3MB No OTA/1MB SPIFFS)
- Upload Speed: 921600

**After (Automatic with Custom Profile):**
Students select one option:
- Board: **Soniphorm Gen v1.0**

All settings are automatically configured!

## Installation

### Method 1: Manual Installation (Recommended for IT/Workshop Setup)

**Perfect for:** University IT departments, multiple computers, security-conscious environments

**See:** [MANUAL_INSTALL.md](MANUAL_INSTALL.md) for complete step-by-step instructions

**Quick Summary:**
1. Close Arduino IDE
2. Open: `%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1\boards.txt`
3. Scroll to bottom
4. Paste contents of `soniphorm_board.txt`
5. Save, restart Arduino IDE
6. Select: Tools > Board > esp32 > **Soniphorm Gen v1.0**

**Time:** 3-5 minutes per computer

---

### Method 2: Automated Installation (Optional)

**Perfect for:** Individual users, personal computers

#### Windows

1. **Close Arduino IDE** (if open)
2. Double-click `install_windows.bat`
3. Press any key when prompted
4. Restart Arduino IDE
5. Select: Tools > Board > esp32 > **Soniphorm Gen v1.0**

#### Mac / Linux

1. **Close Arduino IDE** (if open)
2. Open Terminal in this folder
3. Make script executable:
   ```bash
   chmod +x install_mac_linux.sh
   ```
4. Run installer:
   ```bash
   ./install_mac_linux.sh
   ```
5. Restart Arduino IDE
6. Select: Tools > Board > esp32 > **Soniphorm Gen v1.0**

## Testing Installation

### Test 1: Verify Board Appears

1. Open Arduino IDE
2. Go to: Tools > Board > esp32
3. Scroll down and look for: **Soniphorm Gen v1.0**
4. Select it

✅ **Success:** Board name appears in list
❌ **Failed:** Board not found - check installation output for errors

### Test 2: Verify Settings Are Correct

After selecting "Soniphorm Gen v1.0", check Tools menu shows:

- **Upload Speed:** 921600 (or menu shows "921600" option selected)
- **USB CDC On Boot:** Enabled (or menu shows "Enabled" option selected)
- **PSRAM:** OPI PSRAM (or menu shows "OPI PSRAM" option selected)
- **Flash Mode:** QIO 80MHz (or menu shows "QIO 80MHz" option selected)
- **Flash Size:** 16MB (128Mb) (or menu shows "16MB" option selected)
- **Partition Scheme:** Huge APP (or menu shows "Huge APP" option selected)

✅ **Success:** All settings match
❌ **Failed:** Settings incorrect - see Troubleshooting

### Test 3: Compile a Sketch

1. File > Examples > 01.Basics > Blink
2. Verify (checkmark button)
3. Should compile successfully

✅ **Success:** "Done compiling" message appears
❌ **Failed:** Compilation errors - see Troubleshooting

## Troubleshooting

### "ESP32 board support not found"

**Problem:** ESP32 board package not installed

**Solution:**
1. Open Arduino IDE
2. File > Preferences
3. Additional Board Manager URLs: Add this URL:
   ```
   https://espressif.github.io/arduino-esp32/package_esp32_index.json
   ```
4. Tools > Board > Boards Manager
5. Search: "esp32"
6. Install: "esp32" by Espressif Systems (version 3.3.1 or later)
7. Run installer again

### "Board profile already installed"

**Problem:** Profile was previously installed

**Solution:**
- If working correctly: No action needed!
- To reinstall:
  1. Locate boards.txt (path shown in error message)
  2. Open in text editor (Notepad++, TextEdit, etc.)
  3. Search for "soniphorm" and delete all lines starting with "soniphorm."
  4. Save file
  5. Run installer again

### "Failed to backup boards.txt"

**Problem:** Permission denied or file locked

**Solution:**
1. Close Arduino IDE completely
2. Run installer as Administrator (Windows) or with sudo (Mac/Linux)
3. If still fails, manually copy boards.txt to boards.txt.backup

### Board appears but settings are wrong

**Problem:** Old ESP32 board package or incomplete installation

**Solution:**
1. Update ESP32 board package:
   - Tools > Board > Boards Manager
   - Search "esp32"
   - Update to version 3.3.1 or later
2. Check boards.txt manually:
   - Open boards.txt (location shown during install)
   - Search for "soniphorm"
   - Verify all lines from soniphorm_board.txt are present

## Uninstalling

To remove the custom board profile:

1. Close Arduino IDE
2. Open boards.txt in text editor:
   - Windows: `%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1\boards.txt`
   - Mac: `~/Library/Arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt`
   - Linux: `~/.arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt`
3. Search for "soniphorm" and delete the entire section (all lines starting with "soniphorm.")
4. Save file
5. Restart Arduino IDE

**Or restore from backup:**
```bash
# Windows
copy "%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1\boards.txt.backup" "%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1\boards.txt"

# Mac/Linux
cp ~/Library/Arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt.backup ~/Library/Arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt
```

## Technical Details

### What Gets Configured

| Setting | Value | Purpose |
|---------|-------|---------|
| PSRAM | OPI PSRAM (8MB) | Required for 20s looper, large sample buffers |
| Flash Size | 16MB (128Mb) | Match hardware specification |
| Flash Mode | QIO 80MHz | Fast quad I/O mode |
| Partition | Huge APP (3MB) | Maximum sketch size for complex patches |
| USB CDC | Enabled | Serial.print() debug via USB |
| Upload Speed | 921600 | Fast sketch uploads |
| CPU Freq | 240 MHz | Maximum performance |

### Board Definition Location

After installation, the board definition is appended to:
```
[Arduino15]/packages/esp32/hardware/esp32/3.3.1/boards.txt
```

### Backup File

A backup is automatically created during installation:
```
boards.txt.backup
```

Keep this file in case you need to restore the original configuration.

## Workshop Deployment

### For IT Staff

**Mass Installation on Multiple Computers:**

1. **Option A: Clone Drive Image**
   - Install on one "master" computer
   - Verify installation
   - Create disk image
   - Deploy to all workshop computers

2. **Option B: Network Script**
   - Share `arduino_board_profile` folder on network
   - Have students run installer from network location
   - Or copy folder to each computer and run locally

3. **Option C: Manual Installation**
   - Provide printed instructions
   - Students install during workshop setup time
   - Have backup of boards.txt ready in case of issues

**Recommended:** Option A (disk image) is fastest and most reliable for 10+ computers.

### For Students

Workshop materials should include:
1. Arduino IDE installation guide (with ESP32 board support)
2. Custom board profile installer (in USB drive or network share)
3. Printout of this README for reference

## Support

If issues persist after troubleshooting:
1. Check Arduino IDE version (2.3.2 or later required)
2. Check ESP32 board package version (3.3.1 or later required)
3. Try manual board configuration as fallback (see DEPLOYMENT.md)
4. Contact workshop instructor

## License

This board profile is part of the Soniphorm Gen project.
Free to use for educational and workshop purposes.
