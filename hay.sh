#!/usr/bin/env bash

set -uex

declare -A COPIES=(
  ["qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf"]="Driver/QualcommBSP/Subsystem/qcsubsys_ext_adsp8380_1128_Signed/adsp_dtbs.elf"
  ["qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn"]="Driver/QualcommBSP/Subsystem/qcsubsys_ext_adsp8380_1128_Signed/qcadsp8380.mbn"
  ["qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf"]="Driver/QualcommBSP/Subsystem/qcsubsys_ext_cdsp8380_1016_sign/cdsp_dtbs.elf"
  ["qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn"]="Driver/QualcommBSP/Subsystem/qcsubsys_ext_cdsp8380_1016_sign/qccdsp8380.mbn"
  ["qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn"]="Driver/QualcommBSP/GFX/qcdx8380_7500/qcdxkmsuc8380.mbn"
  ["qca/hmtbtfw20.tlv"]="Driver/QualcommBSP/WIFI_BT/qcbluetooth8380/hmtbtfw20.tlv"
  ["qca/hmtnv20.b112"]="Driver/QualcommBSP/WIFI_BT/qcbluetooth8380/hmtnv20.b112"
)

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
if [[ -f "$1" ]]; then
  rm -rf build
  mkdir -p build
  cd build
  7z x "$1" || true # Some files will fail to extract, doesn't matter now.
  cd ..
fi

for target in "${!COPIES[@]}"; do
  source="${COPIES[$target]}"
  cp "build/$source" "$target"
done
