# RisingOS Revived 9 for the Samsung Galaxy M20 (m20lte)

Sources for the unofficial RisingOS Revived 9 (Android 17) builds of the Galaxy M20 published at
[m20lte-roms](https://github.com/c8dhjp4tyv-bit/m20lte-roms).

The device trees, the 5.10 kernel and the vendor blobs are the public LineageOS ones:

- Device: [android_device_samsung_m20lte](https://github.com/LineageOS/android_device_samsung_m20lte/tree/lineage-24.0), [android_device_samsung_universal7904-common](https://github.com/LineageOS/android_device_samsung_universal7904-common/tree/lineage-24.0)
- Kernel (5.10): [android_kernel_samsung_universal7904](https://github.com/LineageOS/android_kernel_samsung_universal7904/tree/lineage-24.0) (built from `lineage-24.0` on 2026-11-19/20; `58a091089b5a` for Lunaris)
- Vendor: [proprietary_vendor_samsung_m20lte](https://github.com/TheMuppets/proprietary_vendor_samsung_m20lte/tree/lineage-24.0), [proprietary_vendor_samsung_universal7904-common](https://github.com/TheMuppets/proprietary_vendor_samsung_universal7904-common/tree/lineage-24.0)

This repo holds the local manifest and the patches applied on top for RisingOS Revived 9.

## Build

```bash
repo init -u https://github.com/RisingOS-Revived/android -b seventeen --git-lfs
mkdir -p .repo/local_manifests
cp /path/to/this/repo/local_manifests/m20lte.xml .repo/local_manifests/
repo sync -c -j$(nproc) --force-sync --no-tags
/path/to/this/repo/apply-patches.sh $PWD [--vanilla]
source build/envsetup.sh
lunch lineage_m20lte-bp4a-user
m bacon
```

GApps by default; pass `--vanilla` to also apply `0005-m20lte-RisingOS-vanilla-local.patch`.

## Patches

| Path | Patch |
|---|---|
| `device_samsung_m20lte` | m20lte: RisingOS flags (local) |
| `device_samsung_m20lte` | m20lte: RisingOS pico GApps (local) |
| `device_samsung_m20lte` | m20lte: erofs system (local) |
| `device_samsung_m20lte` | m20lte: legacy props for the Rising OTA banner (local) |
| `device_samsung_m20lte` | m20lte: RisingOS vanilla (local) |
| `hardware_samsung_slsi-linaro_exynos` | gralloc4: Only build GrallocMapperCamera for gralloc4 |
