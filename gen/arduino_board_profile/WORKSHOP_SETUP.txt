# Soniphorm Gen v1.0 - Workshop Setup Guide

## Required Software

### 1. Arduino IDE
- Version 2.3.2 or later
- Download: https://www.arduino.cc/en/software

### 2. ESP32 Board Support
1. Open Arduino IDE
2. File > Preferences
3. Additional Board Manager URLs - Add:
   ```
   https://espressif.github.io/arduino-esp32/package_esp32_index.json
   ```
4. Tools > Board > Boards Manager
5. Search: **esp32**
6. Install: **esp32 by Espressif Systems** (version 3.3.1 or later)

### 3. Required Libraries

**Both libraries install via Arduino IDE Library Manager:**

1. Open Arduino IDE
2. Tools > Manage Libraries (or Sketch > Include Library > Manage Libraries)
3. Search and install:

**Library 1: Adafruit MCP23017**
- Search: **MCP23017**
- Install: **Adafruit MCP23X17** by Adafruit

**Library 2: Adafruit NeoPixel**
- Search: **NeoPixel**
- Install: **Adafruit NeoPixel** by Adafruit

---

## Board Profile Installation

### Step 1: Close Arduino IDE

Close Arduino IDE completely before proceeding.

### Step 2: Locate boards.txt

**Windows:**
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

1. Right-click `boards.txt`
2. Copy and paste in same folder
3. Rename to: `boards.txt.backup`

### Step 4: Add Board Definition

1. Open `boards.txt` in Notepad
2. Scroll to the very bottom (Ctrl+End)
3. Open `soniphorm_board.txt` (provided in arduino_board_profile folder)
4. Copy all text from `soniphorm_board.txt` (Ctrl+A, Ctrl+C)
5. Paste at the end of `boards.txt` (Ctrl+V)
6. Save and close (Ctrl+S)

### Step 5: Verify

1. Restart Arduino IDE
2. Tools > Board > esp32
3. Select: **Soniphorm Gen v1.0**

**Configured automatically:**
- USB CDC On Boot: Enabled
- PSRAM: OPI PSRAM (8MB)
- Flash Size: 16MB (128Mb)
- Flash Mode: QIO 80MHz
- Partition Scheme: Huge APP (3MB)
- Upload Speed: 921600

---

## Test Compilation

1. File > Examples > 01.Basics > Blink
2. Click Verify (checkmark button)
3. Should compile successfully

---

## Troubleshooting

**Board doesn't appear:**
- Close and restart Arduino IDE

**Compilation errors:**
- Verify ESP32 board package version 3.3.1 or later is installed
- Tools > Board > Boards Manager > Search "esp32" > Update if needed

**To remove board profile:**
1. Open boards.txt
2. Delete all lines starting with "soniphorm."
3. Save and restart Arduino IDE
