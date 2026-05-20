#!/bin/bash

TARGET_PATH="/var/www/pterodactyl/app/Http/Controllers/Api/Client/Servers/PowerController.php"

echo "🔄 Menjalankan Uninstall Protect Anti Rusuh Server..."

LATEST_BACKUP=$(ls -t "${TARGET_PATH}".bak_* 2>/dev/null | head -n 1)

if [ -n "$LATEST_BACKUP" ] && [ -f "$LATEST_BACKUP" ]; then
    echo "📦 Backup ditemukan: $LATEST_BACKUP"
    mv "$LATEST_BACKUP" "$TARGET_PATH"
    chmod 644 "$TARGET_PATH"
    echo "✅ Berhasil mengembalikan file original ke $TARGET_PATH"
else
    echo "❌ Gagal: File backup (.bak_*) tidak ditemukan."
    exit 1
fi

echo "🧹 Membersihkan cache Pterodactyl..."
cd /var/www/pterodactyl && php artisan view:clear && php artisan config:clear && php artisan cache:clear
echo "🎉 Selesai! Uninstall Protect Berhasil."
