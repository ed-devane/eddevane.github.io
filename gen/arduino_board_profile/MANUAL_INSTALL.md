# Soniphorm Gen v1.0 - Manual Board Profile Installation

## For IT Staff / Workshop Setup

This guide explains how to manually install the Soniphorm Gen v1.0 custom board profile for Arduino IDE. This eliminates the need for students to configure 7+ settings manually.

---

## Prerequisites

**IMPORTANT:** ESP32 board support must be installed first:

1. Open Arduino IDE
2. File > Preferences
3. Additional Board Manager URLs - Add:
   ```
   https://espressif.github.io/arduino-esp32/package_esp32_index.json
   ```
4. Tools > Board > Boards Manager
5. Search: "esp32"
6. Install: **esp32 by Espressif Systems** (version 3.3.1 or later)

---

## Manual Installation Steps

### Step 1: Close Arduino IDE

**IMPORTANT:** Arduino IDE must be closed before editing boards.txt

### Step 2: Locate boards.txt File

**Windows:**
```
%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1\boards.txt
```

To open quickly:
1. Press Windows Key + R
2. Paste: `%LOCALAPPDATA%\Arduino15\packages\esp32\hardware\esp32\3.3.1`
3. Press Enter
4. Open `boards.txt` in Notepad

**Mac:**
```
~/Library/Arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt
```

**Linux:**
```
~/.arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt
```

### Step 3: Create Backup

**Before editing, create a backup:**
1. Right-click `boards.txt`
2. Copy and paste in the same folder
3. Rename to: `boards.txt.backup`

### Step 4: Open soniphorm_board.txt

Open the file `soniphorm_board.txt` (provided in the arduino_board_profile folder) in Notepad.

### Step 5: Copy Board Definition

1. Select all text in `soniphorm_board.txt` (Ctrl+A)
2. Copy (Ctrl+C)

### Step 6: Append to boards.txt

1. Open `boards.txt` in Notepad
2. Scroll to the very bottom (Ctrl+End)
3. Position cursor at the end of the last line
4. Press Enter to create a new line
5. Paste the copied text (Ctrl+V)
6. **Save and close** (Ctrl+S)

### Step 7: Verify Installation

1. Restart Arduino IDE
2. Go to: Tools > Board > esp32
3. Scroll down and look for: **"Soniphorm Gen v1.0"**
4. Select it

**Expected result:** All these settings are now automatic:
- USB CDC On Boot: Enabled
- PSRAM: OPI PSRAM (8MB)
- Flash Size: 16MB (128Mb)
- Flash Mode: QIO 80MHz
- Partition Scheme: Huge APP (3MB)
- Upload Speed: 921600

---

## Testing the Installation

### Quick Test:
1. File > Examples > 01.Basics > Blink
2. Click Verify (checkmark button)
3. Should compile successfully

✅ **Success:** "Done compiling" message appears

---

## Troubleshooting

### Board doesn't appear in list

**Problem:** Arduino IDE was open during editing

**Solution:**
1. Completely close Arduino IDE (File > Quit)
2. Reopen Arduino IDE
3. Check Tools > Board > esp32 again

### Compilation errors after selecting board

**Problem:** Wrong ESP32 board package version

**Solution:**
1. Tools > Board > Boards Manager
2. Search: "esp32"
3. Update to version 3.3.1 or later

### Want to remove the board profile

1. Close Arduino IDE
2. Open boards.txt (see Step 2 above)
3. Scroll to bottom
4. Delete all lines starting with "soniphorm."
5. Save and close

**Or restore from backup:**
1. Delete boards.txt
2. Rename boards.txt.backup to boards.txt

---

## For Multiple Computers (Workshop Setup)

### Option A: Master Image (Recommended for 10+ computers)
1. Install everything on one "master" computer
2. Verify installation works
3. Create disk image
4. Deploy to all workshop computers

### Option B: Network Share
1. Share the arduino_board_profile folder on network
2. Have students/staff follow these manual steps from shared location

### Option C: Individual Installation
1. Provide these instructions to each student/staff member
2. They follow steps on their own machine
3. Estimated time: 3-5 minutes per computer

---

## What This Profile Configures

| Setting | Value | Why It's Important |
|---------|-------|-------------------|
| PSRAM | OPI PSRAM (8MB) | Required for 20-second looper, large sample buffers |
| Flash Size | 16MB (128Mb) | Matches hardware specification |
| Flash Mode | QIO 80MHz | Fast quad I/O mode for performance |
| Partition Scheme | Huge APP (3MB) | Maximum sketch size for complex synthesizer patches |
| USB CDC On Boot | Enabled | Enables Serial.print() debugging via USB |
| Upload Speed | 921600 | Fast sketch uploads (saves time) |
| CPU Frequency | 240 MHz | Maximum performance for real-time audio |

**Without this profile:** Students must manually configure all 7 settings every time they select the board.

**With this profile:** Students select "Soniphorm Gen v1.0" once, all settings are automatic.

---

## Support

If installation issues persist:
1. Verify ESP32 board package version 3.3.1+ is installed
2. Check Arduino IDE version (2.3.2 or later recommended)
3. Try on a clean Arduino IDE installation
4. Contact workshop instructor

---

## License

This board profile is part of the Soniphorm Gen project.
Free to use for educational and workshop purposes.
