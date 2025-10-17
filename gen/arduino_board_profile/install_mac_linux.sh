#!/bin/bash

echo "========================================"
echo "Soniphorm Board Profile Installer"
echo "========================================"
echo ""

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    BOARDS_FILE="$HOME/Library/Arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt"
else
    BOARDS_FILE="$HOME/.arduino15/packages/esp32/hardware/esp32/3.3.1/boards.txt"
fi

# Check if file exists
if [ ! -f "$BOARDS_FILE" ]; then
    echo "[ERROR] ESP32 board support not found at:"
    echo "$BOARDS_FILE"
    echo ""
    echo "Please install ESP32 board support first:"
    echo "1. Open Arduino IDE"
    echo "2. File > Preferences"
    echo "3. Add URL: https://espressif.github.io/arduino-esp32/package_esp32_index.json"
    echo "4. Tools > Board > Boards Manager"
    echo "5. Search \"esp32\" and install \"esp32\" by Espressif Systems"
    echo ""
    exit 1
fi

# Check if already installed
if grep -q "soniphorm.name=Soniphorm Gen v1.0" "$BOARDS_FILE"; then
    echo "[INFO] Soniphorm board profile is already installed!"
    echo ""
    echo "To reinstall:"
    echo "1. Open: $BOARDS_FILE"
    echo "2. Remove lines starting with \"soniphorm.\""
    echo "3. Run this installer again"
    echo ""
    exit 0
fi

# Backup original file
echo "[1/3] Backing up boards.txt..."
cp "$BOARDS_FILE" "$BOARDS_FILE.backup"
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to backup boards.txt"
    exit 1
fi
echo "      Backup saved: $BOARDS_FILE.backup"

# Append board definition
echo "[2/3] Installing Soniphorm board profile..."
cat soniphorm_board.txt >> "$BOARDS_FILE"
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to append board definition"
    echo "Restoring backup..."
    cp "$BOARDS_FILE.backup" "$BOARDS_FILE"
    exit 1
fi

# Verify installation
if grep -q "soniphorm.name=Soniphorm Gen v1.0" "$BOARDS_FILE"; then
    echo "      Installation successful!"
    echo ""
    echo "[3/3] Next steps:"
    echo "      1. Close Arduino IDE if it's open"
    echo "      2. Restart Arduino IDE"
    echo "      3. Go to Tools > Board > esp32"
    echo "      4. Select \"Soniphorm Gen v1.0\""
    echo ""
    echo "[SUCCESS] Board profile installed successfully!"
    echo ""
    echo "All settings are now automatic:"
    echo "  - PSRAM: OPI PSRAM (8MB)"
    echo "  - Flash: 16MB QIO 80MHz"
    echo "  - Partition: Huge APP (3MB)"
    echo "  - USB CDC: Enabled"
    echo "  - Upload Speed: 921600"
    echo ""
else
    echo "[ERROR] Installation verification failed"
    echo "Restoring backup..."
    cp "$BOARDS_FILE.backup" "$BOARDS_FILE"
    exit 1
fi
