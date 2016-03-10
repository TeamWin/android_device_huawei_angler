#!/sbin/sh

# This pulls the files out of /vendor that are needed for decrypt
# This allows us to decrypt the device in recovery and still be
# able to unmount /vendor when we are done.

mkdir -p /vendor
mount -t ext4 -o ro /dev/block/platform/soc.0/f9824900.sdhci/by-name/vendor /vendor

cp /vendor/lib64/libQSEEComAPI.so /sbin/libQSEEComAPI.so
cp /vendor/lib64/hw/keystore.msm8994.so /sbin/keystore.msm8994.so
cp /vendor/lib64/libdrmfs.so /sbin/libdrmfs.so
cp /vendor/lib64/libdrmtime.so /sbin/libdrmtime.so
cp /vendor/lib64/librpmb.so /sbin/librpmb.so
cp /vendor/lib64/libssd.so /sbin/libssd.so
cp /vendor/lib64/libdiag.so /sbin/libdiag.so
cp /vendor/lib64/libkmcrypto.so /sbin/libkmcrypto.so

umount /vendor

mkdir -p /vendor/lib64/hw
cp /sbin/keystore.msm8994.so /vendor/lib64/hw/keystore.msm8994.so
