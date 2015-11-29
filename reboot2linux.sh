#!/system/bin/sh

out=/dev/block/platform/ff0f0000.rksdmmc/by-name/misc

pad() {
    busybox dd if=/dev/zero bs=$1 count=1
}

echo_pad() {
    echo -n "$1" | busybox dd bs=$2 conv=sync;
}

{   pad 16k
    echo_pad boot-recovery 8k
    echo_pad geekbox-linux 8k
    pad 16k
} > $out
