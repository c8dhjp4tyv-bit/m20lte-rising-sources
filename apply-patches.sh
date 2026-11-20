#!/bin/bash
# Apply the m20lte patches on top of a synced source tree.
# Usage: ./apply-patches.sh /path/to/source [--vanilla]
set -e
SRC=${1:?source tree}; HERE=$(cd "$(dirname "$0")" && pwd)
declare -A MAP=(
  [device_samsung_m20lte]=device/samsung/m20lte
  [device_samsung_universal7904-common]=device/samsung/universal7904-common
  [hardware_lineage_compat]=hardware/lineage/compat
  [hardware_samsung_slsi-linaro_config]=hardware/samsung_slsi-linaro/config
  [hardware_samsung_slsi-linaro_exynos]=hardware/samsung_slsi-linaro/exynos
  [hardware_samsung_slsi-linaro_graphics]=hardware/samsung_slsi-linaro/graphics
  [vendor_pixel_gms]=vendor/pixel/gms
)
for d in "$HERE"/patches/*/; do
  n=$(basename "$d"); dst="$SRC/${MAP[$n]}"
  echo "== $n -> ${MAP[$n]}"
  for p in "$d"*.patch; do
    case "$p" in *vanilla*) [ "$2" = "--vanilla" ] || continue ;; esac
    git -C "$dst" am -3 --empty=drop "$p"
  done
done
