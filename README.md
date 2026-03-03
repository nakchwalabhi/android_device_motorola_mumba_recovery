# Device Tree for Motorola Moto G57 Power (mumba)

**SoC:** Qualcomm SM4450 (Parrot)  
**Android version:** 16 (API 36)  
**Boot header version:** 4 (GKI)  
**Partitioning:** A/B (Virtual A/B with snapshots)  
**Encryption:** FBE (AES-256-XTS + wrapped keys)

---

## Building TWRP

### Prerequisites

- Linux build environment (Ubuntu 20.04 or 22.04 LTS recommended)
- At least 200 GB free disk space
- 16 GB RAM (32 GB recommended)
- `repo`, `git`, `python3`, and standard Android build tools installed
- Open file descriptor limit of at least 16 000 (`ulimit -n 65535`)

### 1. Initialize the TWRP build manifest

```bash
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
```

### 2. Create a local manifest for this device tree

```bash
mkdir -p .repo/local_manifests
cat > .repo/local_manifests/mumba.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="nakchwalabhi/android_device_motorola_mumba"
           path="device/motorola/mumba"
           remote="github"
           revision="main" />
</manifest>
EOF
```

### 3. Sync sources

```bash
repo sync -j$(nproc) --force-sync --no-clone-bundle --no-tags
```

### 4. Build TWRP recovery image

```bash
. build/envsetup.sh
lunch twrp_mumba-eng
ulimit -n 65535          # raise open-file limit; Android build requires >= 16000
mka recoveryimage
```

The output recovery image will be at:
```
out/target/product/mumba/recovery.img
```

### 5. Flash TWRP

Boot your device into fastboot mode (hold **Vol Down + Power**):

```bash
fastboot flash recovery out/target/product/mumba/recovery.img
fastboot reboot recovery
```

> **Note:** On A/B devices, `fastboot flash recovery` flashes both slots automatically.

---

## Building LineageOS

### Extract proprietary blobs (required once)

```bash
./extract-files.sh
```

### Sync and build

```bash
repo sync
. build/envsetup.sh
lunch lineage_mumba-bp4a-userdebug
mka bacon
```

---

## Key device specs

| Feature | Value |
|---|---|
| Chipset | Qualcomm SM4450 (Parrot / Ravelin) |
| Architecture | arm64-v8a (64-bit only) |
| Boot header | v4 |
| Partitioning | Virtual A/B (snapshot-based OTA) |
| Recovery | Dedicated 128 MiB partition |
| Filesystem | EROFS (system, vendor, product, …) |
| Encryption | FBE AES-256-XTS + wrapped keys |
| Display density | 390 dpi |

